class User < ApplicationRecord
  def self.find_via_omniauth(provider:, uid:)
    User.find_by(:provider => provider, :uid => uid.to_s)
  end

  def self.create_with_omniauth(auth)
    User.new.tap do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.avatar_url = auth['extra']['raw_info']['avatar_url']
      user.username = auth['info']['nickname']
      user.url = auth['info']['urls']['GitHub']
      user.save!
      user.sign
    end
  end

  def sign
    self.signed = true
    save!
  end
end
