class Token
  include Mongoid::Document
  include Mongoid::Timestamps

  field :assigned_at, type: DateTime
  field :expire_at, type: DateTime

  MAX_IDLE_TIME = 5.minutes
  SHELF_LIFE = 1.minutes

  index({ assigned_at: 1 })

  # MongoDB TTL index, this index will automatically delete
  # when expire time limit overs
  index({ expire_at: 1 }, { expire_after_seconds: MAX_IDLE_TIME })

  before_create :set_expire_at

  scope :assigned, -> { where.not(assigned_at: nil) }

  def self.available
    time = Time.now

    self.or({ :expire_at.gte => time - MAX_IDLE_TIME,
              :assigned_at => nil })
        .or({ :expire_at.gte => time - MAX_IDLE_TIME,
              :assigned_at.lt => time - SHELF_LIFE })
  end

  def keep_alive
    time = Time.now
    update(expire_at: time, assigned_at: time)
  end

  def unblock
    update(expire_at: Time.now, assigned_at: nil)
  end

  def alive?
    assigned_at > Time.now - SHELF_LIFE
  end

  private

  def set_expire_at
    self.expire_at = Time.now
  end
end
