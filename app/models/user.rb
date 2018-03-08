class User < ApplicationRecord
  def self.find_via_omniauth(provider:, uid:)
    User.find_by(:provider => provider, :uid => uid.to_s)
  end

  def self.create_with_omniauth(auth)
    User.new.tap do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["user_info"]["name"]
      user.save!
      user.sign
    end
  end

  def sign
    self.signed = true
    save!
  end
end
