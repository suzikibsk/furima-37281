# README

## users テーブル
| name                | string     | null:false             |
| email               | string     | null:false,unique:true |
| encrypted_password  | string     | null:false             |
| first_name          | string     | null:false             |
| last_name           | string     | null:false             |
| first_name_kana     | string     | null:false             |
| last_name_kana      | string     | null:false             |
| birth_day           | date       | null:false             |

### Association
-has_one :profile, dependent: destroy
-has_one :sending_destination, dependent: destroy
-has_one :credit_card,dependent: destroy
-has_many :items, dependent: destroy, foreign_key: items

## sending_destinations
| first_name      | string     | null:false                   |
| last_name       | string     | null:false                   |
| first_name_kana | string     | null:false                   |
| last_name_kana  | string     | null:false                   |
| post_code       | integer    | null:false                   |
| prefecture_code | integer    | null:false                   |
| city            | string     | null:false                   |
| house_number    | string     | null:false                   |
| building_name   | string     | ---------------------------  |
| phone_number    | integer    | unique:true                  |
| user_id         | references | null:false,foreign_key: true |

### Association 

-belongs_to :user

## profiles テーブル
| first_name      | string     | null:false                    |
| last_name       | string     | null:false                    |
| first_name_kana | string     | null:false                    |
| last_name_kana  | string     | null:false                    |
| birth_day       | date       | null:false                    |
| user_id         | references | null:false, foreign_key: true |

### Association 

-belongs_to :user

## credit_cards テーブル
| user_id     | references | null:false, foreign_key: true |
| customer_id | string     | null:false                    |
| card_id     | string     | null:false                    |

### Association

-belongs_to :user

## items テーブル
| name           | string        | null:false                    |
| introduction   | text          | null:false                    |
| price          | integer       | null:false                    |
| brand          | integer       | ----------------------------- |
| item_condition | integer       | null:false                    |
| postage_payer  | integer       | null:false                    |
| postage_type    | integer      | null:false                    |
| preparation_day | integer      | null:false                    |
| category        | references   | null:false                    |
| trading_status  | integer      | null:false                    |
| seller          | references   | null:false                    |
| buyer           | references   | null:false                    |

### Association

-has_many :favorites, dependent: destroy
-has_many :item_images, dependent: destroy
-belongs_to :user
-belongs_to :category
-belongs_to_active_hash :item_condition
-belongs_to_active_hash :preparation_day
-belongs_to_active_hash :postage_payer
-belongs_to_active_hash :postage_type
-belongs_to :brand
-belongs_to :seller, class_name: "User"
-belongs_to :buyer, class_name: "User"

## item_images テーブル
| src     | string      | null:false                    |
| item_id | references  | null:false, foreign_key: true |

### Association 

-belongs_to :item

## category テーブル
| name | string | null:false |

### Association

-has_many :items
-has_ancestry

## favorites テーブル
| user_id | references | ----------|
| item_id | references | ----------|

### Association

-has_many :favorites, dependent: destroy
-has_many :favorites, dependent: destroy
-has_many :favorites_item, thorough :favorites, source :item

