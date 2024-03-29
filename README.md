# rails-cushion

[![CircleCI](https://circleci.com/gh/inayuky/rails-cushion/tree/main.svg?style=svg)](https://circleci.com/gh/inayuky/rails-cushion/tree/main)

## 画面設計

- ホーム画面
    - 画像のみ表示
- ヘッダー
    - ホーム
    - 未ログイン時のみ
      - 新規登録
        - ユーザ登録
      - ログイン
    - ログイン時のみ
      - ユーザ一覧
      - 投稿一覧
      - 投稿
      - ログアウト
      - マイページ
        - ユーザ情報
- フッター
    - copyright
- ユーザ登録画面
- ユーザ表示画面
    - ユーザ名、メールアドレス、編集リンク、削除リンク
- ユーザ一覧表示画面
    - ユーザ名(表示リンク)、メールアドレス、編集リンク、削除リンク
    - ページネーション
- 投稿一覧表示画面
    - 投稿内容、投稿ユーザ名、投稿日時
    - ページネーション
- 投稿画面
    - 投稿内容
    - 投稿ボタン

## その他

- css
  - webpackで管理
  - javascript/packsのcustom.cssをapplication.jsから読み込む形
- kaminari
    - ページネーション
- bootstrap4
    - gemではなくyarnで導入した
- faker
    - ダミーデータの作成
- flash
  - 一時メッセージの表示
- factory_bot
  - テスト用データの作成
- rspec
    - model
    - request
    - integration
- CircleCIによるCI
- Capistranoによるデプロイ