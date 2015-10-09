# protospace

## 概要
開発者が作成したプロトタイプを投稿・共有するサービス。
投稿されたプロトタイプにはコメントはいいね！もできる。

## 機能
- ユーザー管理ができる
- プロトタイプ投稿・編集・削除ができる
- タグ管理ができる
- 画像投稿ができる
- コメントができる
- いいねができる
- ランキングページ

## DB設計
- テーブル名
追加するカラム

- users
name
group
work
profile
avatar

- prototypes
title
copy
concept
user_id

- captured_images
prototype_id

- comments
text
user_id
prototype_id

- likes
user_id
prototype_id

gemを使用するので、実際に使ってからカラムを決める
- tags
name
prototype_id

### アソシエーション
- User.rb
has_many prototypes
has_many likes
has_many comments

- Prototype.rb
has_many likes
has_many comments
has_many tags
has_many captured_images

## その他
すえまってぃーの参考にして便利な物がいくつか挙げられていたので使ってみる。
- bullet
N+1問題を検出
- carrier wave
画像投稿

- attribute_nester_for
フォーム入力の際に複数のモデルを扱う

- act_as_taggable_on
タグ機能の実装に使用
