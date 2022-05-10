class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions


  # アクティブハッシュとのアソシエーション
  belongs_to :category
  belongs_to :region
  belongs_to :item_status
  belongs_to :shipping_cost
  belongs_to :shipping_date


  # ジャンルの選択が「--」の時は保存不可
  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :region_id
    validates :item_status_id
    validates :shipping_cost_id
    validates :shipping_date_id
  end
end
