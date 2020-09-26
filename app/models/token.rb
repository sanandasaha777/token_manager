class Token
  include Mongoid::Document
  include Mongoid::Timestamps

  field :assigned_at, type: DateTime
  field :expire_at, type: DateTime, default: DateTime.now

  index({ assigned_at: 1 })

  # MongoDB TTL index, this index will automatically delete
  # when expire time limit overs
  index({ expire_at: 1 }, { expire_after_seconds: 5.minutes })

  scope :assigned, -> { where.not(assigned_at: nil) }

  def self.available
    time = DateTime.now

    self.or({ :expire_at.gte => time - 5.minutes,
              :assigned_at => nil })
        .or({ :expire_at.gte => time - 5.minutes,
              :assigned_at.lt => time - 1.minutes })
  end

  def keep_alive
    time = DateTime.now
    update(expire_at: time, assigned_at: time)
  end

  def unblock
    update(expire_at: DateTime.now, assigned_at: nil)
  end

  def alive?
    assigned_at > DateTime.now - 1.minutes
  end
end
