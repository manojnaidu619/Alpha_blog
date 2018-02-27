class User < ApplicationRecord
  validates :username , presence: true ,
  length: {minimum: 3 ,maximum: 25},
  uniqueness: {case_sensitive: false}

  EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :email , presence: true ,length: {maximum: 60},
  format: {with: EMAIL_REGEX}
end
