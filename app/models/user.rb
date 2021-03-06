class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nick_name
    validates :email, uniqueness: true
    validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "is valid. Include both letters and numbers."}
    validates :first_name, format: {with: /\A[ぁ-んァ-ン一-龥]/,message: "is invalid. Input full-width caracters."}
    validates :last_name, format: {with: /\A[ぁ-んァ-ン一-龥]/,message: "is invalid. Input full-width caracters."}
    validates :first_name_kana, format: {with: /\A[ァ-ヶー－]+\z/,message: "is invalid. Input full-width katakana characters."}
    validates :last_name_kana, format: {with: /\A[ァ-ヶー－]+\z/,message: "is invalid. Input full-width katakana characters."}
    validates :birth_date

  end
end
