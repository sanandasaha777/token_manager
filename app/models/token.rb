class Token
  include Mongoid::Document
  include Mongoid::Timestamps

  field :expire_at, type: DateTime, default: DateTime.now

  index({ expire_at: 1 }, { expire_after_seconds: 5.minutes })
end
