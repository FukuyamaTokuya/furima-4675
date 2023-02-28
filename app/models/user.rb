class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  VALID_KANJI_GANA_KANA= /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  VALID_KANA=/\A[ァ-ヶ]+\z/
  validates :password, format: {with: VALID_PASSWORD_REGEX}
  validates :last_name, presence: true, format:{with: VALID_KANJI_GANA_KANA}
  validates :first_name, presence: true, format:{with: VALID_KANJI_GANA_KANA}
  validates :last_name_kana, presence: true, format:{with: VALID_KANA}
  validates :first_name_kana, presence: true, format:{with: VALID_KANA}
  validates :birthday, presence: true



end
