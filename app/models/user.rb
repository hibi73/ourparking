class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :parks
  has_many :comments
  has_many :purchases

  validates :nickname, presence: true
  validate :password_complexity
end

def password_complexity
  return if password.blank? || password =~ /^(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{6,}$/
  errors.add :password, 'Complexity requirement not met.'
end