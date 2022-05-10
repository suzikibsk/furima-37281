class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  #テーブルとのアソシエーション
  belongs_to :user

  # アクティブハッシュとのアソシエーション
  belongs_to :category
  belongs_to :region
  belongs_to :item_status
  belongs_to :shipping_cost
  belongs_to :shipping_date

  #acitive_storageとのアソシエーション
  has_one_attached :image

  with_options presence: true do
    validates :user_id
    validates :name
    validates :description
    validates :category_id
    validates :item_status_id
    validates :shipping_cost_id
    validates :delivery_area_id
    validates :shipping_date_id
    # 300円以上かつ半角数字でないと入力不可
    validates :price, numericality: { greater_than_or_equal_to: 300 }
  end

  # ジャンルの選択が「--」の時は保存不可
  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :region_id
    validates :item_status_id
    validates :shipping_cost_id
    validates :shipping_date_id
  end
end
