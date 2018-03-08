class User < ApplicationRecord
  devise :omniauthable, omniauth_providers: %i[github]

  after_create :sign

  def sign
    self.signed = true
    save!
  end
end
