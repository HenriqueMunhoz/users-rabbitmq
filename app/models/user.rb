# frozen_string_literal: true

class User < ApplicationRecord
  validates :full_name, :email, presence: true
  validates :email, uniqueness: true

  after_save :publish!

  def publish!
    BunnyClient.push(to_json(except: %i[id created_at updated_at]), self.class.name)
  end
end
