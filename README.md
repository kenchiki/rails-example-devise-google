# omniauthを使用したgoogleからのログイン

## 実装手順
- [DeviseのGetting startedを見ながら導入を進める](https://github.com/plataformatec/devise#getting-started)
- [基本はDeviseのOmniauth認証方法を見ながら導入を進める](https://github.com/plataformatec/devise/wiki/OmniAuth:-Overview)
- [scopeなどのパラメータ、google api key取得はgoogleのgemの公式を参照](https://github.com/zquestz/omniauth-google-oauth2)

## callback urlの調べ方

```ruby
devise :database_authenticatable, :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[google_oauth2]
```

- 上記のところまで設定したら[http://localhost:3000/rails/info/routes](http://localhost:3000/rails/info/routes)にアクセスしてcallback urlを調べてAPI取得時のcallback urlに設定する

## googleのIDとSECRET取得のおおざっぱな手順（2019年4月6月現在）
- [https://console.developers.google.com/](https://console.developers.google.com/)にアクセス
- 上にプロジェクトのプルダウンがあるので新規作成する（プロジェクト毎にアプリ名の出る`OAuth 同意画面`が作れる）
- `OAuth 同意画面`設定と`OAuth 2.0 クライアント ID`作成し、IDとSECRETを発行する
