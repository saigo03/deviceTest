class Tag < ApplicationRecord
  # 下記の書き方をすれば中間テーブルのモデルは必要なし、マイグレーションファイルは必要
  has_and_belongs_to_many :memos
end
