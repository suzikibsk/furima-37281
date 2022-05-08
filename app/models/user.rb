class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



  has_many :items
  has_many :orders


  with_options presence: true do
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'

    validates :nickname, presence: true, uniqueness: true
    # @含むこと・存在することはdeviseのデフォルト実装のため省略
    validates :email,    uniqueness: true
    # 全角ひらがな、全角カタカナ、漢字
    validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    # 全角カタカナ
    validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birth_day, presence: true
  end
end