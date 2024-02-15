class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,         presence: true
  validates :first_name_kanji, presence: true
  validates :last_name_kanji,  presence: true
  validates :first_name_kana,  presence: true
  validates :last_name_kana,   presence: true
  validates :birthday,         presence: true
end
