class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

       with_options presence: true do
           with_options format: {with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: '全角文字を使用して下さい'} do
               validates :family_name
               validates :first_name
           end
           with_options format: {with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナを使用して下さい'} do
                validates :family_name_1
                validates :first_name_1
           end
                validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: '半角英数字で、アルファベットと数字を混ぜて下さい'}
                validates :birthday, presence: true
                validates :nickname, presence: true
       end
end
