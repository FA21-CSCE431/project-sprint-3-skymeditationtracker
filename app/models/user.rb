# frozen_string_literal: true

# admins, members, guests
class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  def self.create_user_for_google(data)
    where(username: data['email']).first_or_initialize.tap do |user|
      user.username = data['email']
      user.firstname = data['given_name']
      user.lastname = data['family_name']
      # user.password=Devise.friendly_token[0,20]
      # user.password_confirmation=user.password
      user.save!
    end
  end
end
