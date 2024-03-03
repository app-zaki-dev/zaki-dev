# あたらしい技術情報ブログ(zaki-dev)

### デプロイ

github actions経由でvercelにデプロイしています。

- 事前準備
  vercel cliのインストール後プロジェクトの設定を行ないます。

```
npm i -g vercel@latest

vercel --version

vercel login

# プロジェクトの作成
vercel link
```

その他、githubで下記のシークレットを登録します。

```
# .vercel/project.jsonに記載
VERCEL_ORG_ID
VERCEL_PROJECT_ID

# Vercelの画面から生成
VERCEL_TOKEN
```

### ディレクトリ構成

```
src
├── components
├── hooks    # カスタムフック
├── libs     # 外部ライブラリに対しての処理など
├── pages
│   ├── api
│   └── ...
├── store    # Redux
├── test
├── utils    # 自作
```
