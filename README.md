# アプリ名
The-Expenses

# 概要
グラフやカレンダーを用いて収支管理ができる家計簿アプリケーションです。<br><br><br>

# 本番環境
https://the-expenses-95.herokuapp.com/<br><br><br>

# ログイン情報(テスト用)
- email: peach@gmail.com
- password: peach12345
<br><br><br>

# 制作背景
今ある既存の家計簿アプリケーションは資産の管理など様々な機能が盛り込まれていて、便利な反面使いづらいと感じていました。  
家計簿の本来の目的は収支管理ができることであると私は考えているので、収支管理に特化した機能を持つアプリケーションが欲しいという思いから作成しました。(月単位で収支を管理したい)<br><br><br>

# 要件定義
https://docs.google.com/spreadsheets/d/1snFgivknfB_BC2ffHZamqrz6KsGUSf7kIpquJ6RASOQ/edit#gid=282075926



# DEMO

# ユーザー管理機能(devise)
[![Image from Gyazo](https://i.gyazo.com/0aad1f22ca0d79a18fa00e87e0502355.png)](https://gyazo.com/0aad1f22ca0d79a18fa00e87e0502355)

ログインしていないユーザーは新規登録画面に遷移します。  
各項目を入力をしてください。
「create Account」ボタンを押下すると、トップページに遷移します。
既にアカウントをお持ちの方は「既にアカウントをお持ちの方はこちら」のリンクをクリックしてください。  
ログインページに遷移します。  
同様に各項目を入力して、「Log in」ボタンを押下してください。<br><br><br>


# 一覧表示機能(トップページ)
[![Image from Gyazo](https://i.gyazo.com/fac958efd9dd0f0374c35c47062850f1.png)](https://gyazo.com/fac958efd9dd0f0374c35c47062850f1)  
  
新規登録またはログイン後にトップページへ遷移します。  
収入と支出の入力フォームから入力された情報が一覧で表示され、
支出と収入の各項目を洗い出すことでユーザーが目視で確認できるようにしています。<br><br><br>



# 入力機能(収入、支出)
<a href="https://gyazo.com/862608e14c4d20d490f306f4ebda0852"><img src="https://i.gyazo.com/862608e14c4d20d490f306f4ebda0852.gif" alt="Image from Gyazo" width="1000"/></a>

入力機能は支出と収入の二つのフォームがあります。  
トップページのヘッダー上部の「支出」と「収入」という文字にカーソルを合わせクリックするとそれぞれの入力フォームに遷移します。
入力フォームではそれぞれの項目を埋めて、下部の「SEND」ボタンをクリックすると一覧ページに戻ります。<br><br><br>

# 詳細表示機能
<a href="https://gyazo.com/1a137ea68b062feb0273cbc5ae2811d6"><img src="https://i.gyazo.com/1a137ea68b062feb0273cbc5ae2811d6.gif" alt="Image from Gyazo" width="1000"/></a>

一覧ページの○月の支出と収入の詳細確認したい項目にカーソルを合わせると詳細ボタンが表示されますのでボタンを押下すると詳細ページに遷移します。  
ここでは、入力フォームに入力した情報が表示されます。
具体的にはカテゴリー・日付・金額・メモの四つが表示されます。<br><br><br>


# 編集機能

<a href="https://gyazo.com/35cd1ff9a98c5fa841262845f0edc934"><img src="https://i.gyazo.com/35cd1ff9a98c5fa841262845f0edc934.gif" alt="Image from Gyazo" width="1000"/></a>
一覧ページの○月の支出と収入の編集したい項目にカーソルを合わせると編集ボタンが表示されますのでボタンを押下すると編集ページに遷移します。  
編集したい項目に編集後「SEND」ボタンを押下すると編集されます。<br><br><br>


# 削除機能

<a href="https://gyazo.com/ccc931d6cc0663e6ead2bd04ea27c498"><img src="https://i.gyazo.com/ccc931d6cc0663e6ead2bd04ea27c498.gif" alt="Image from Gyazo" width="1000"/></a>

一覧ページの○月の支出と収入の削除したい項目にカーソルを合わせると削除ボタンが表示されますのでボタンを押下すると削除されます。<br><br><br>




# グラフ機能(chartkick, highcharts)
<a href="https://gyazo.com/9007662969125e601a38faa731a64f5d"><img src="https://i.gyazo.com/9007662969125e601a38faa731a64f5d.gif" alt="Image from Gyazo" width="572"/></a>

該当月の各項目の支出のグラフが表示されます。  
ここでは、何の項目に出費が多いかを可視化することができ、収支が管理しやすくなることを目的にしています。
また、該当月の収入の合計と支出の合計、収入と支出の差を表示することで該当月の合計の収支を可視化できます。<br><br><br>



# カレンダー機能(simple_calendar)
<a href="https://gyazo.com/b3c536410f0fe708269cb1d6f70e4995"><img src="https://i.gyazo.com/b3c536410f0fe708269cb1d6f70e4995.gif" alt="Image from Gyazo" width="1000"/></a>

一覧ページ右上のハンバーガーメニューをクリックするとリストが表示されます。カレンダーをクリックするとカレンダーが表示されます。  
ここでは、カレンダーに支出のカテゴリーと金額が表示されています。それぞれの項目をクリックすると、詳細ページに遷移します。<br><br><br>

# 工夫したポイント
- 作業工程を細分化するために、まずは画面遷移図を作成し、するべきことをリスト化し、1つずつ実装→デプロイをすることを意識しました。  
すべてまとめて実装してしまうと、工数見積りが立てにくいだけでなく、万が一使い勝手が悪かった場合にやり直しが生じる懸念があると考えました。

- GitHubにおいて、自分や第三者がコードを見たときにcommit内容を容易に把握するために細かい粒度でcommitを行いました。<br><br><br>

# 使用技術(開発環境)
## バックエンド
Ruby, Ruby on Rails

## フロントエンド
Html, Css, JavaScript

## データベース
MySQL, SequelPro

## インフラ
Heroku

## ソース管理

GitHub, GitHubDesktop

## テスト
Rspec

## エディタ
VSCode<br><br><br>

# 課題や今後実装したい機能
- 現段階ではpc上のブラウザ用でアプリケーションを作成しているので、スマートフォンなどのアプリケーションでも対応できるようにレスポンシブ対応にしていこうと考えています。  
昨今スマートフォンが当たり前な世の中でスマートフォンにも対応しているレスポンシブ対応にすることで用途の幅が広がると考えます。

- 一覧表示されている項目を検索できる機能を実装していきます。  
この機能を実装し、膨大なデータが一覧表示されている時に検索がかけられることですぐに該当のものを見つけることができると考えます。


# DB設計
## usersテーブル

| Colum              | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name               | string | null: false               |

### Association
- has_many :incomes
- has_many :spendings
<br><br>

## incomesテーブル

| Colum              | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| price              | integer    | null: false                    |
| category           | integer    | null: false                    |
| date               | date       | null: false                    |
| memo               | text       |                                |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
<br><br>

## spendingsテーブル

| Colum              | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| price              | string     | null: false, unique: true      |
| category_id        | integer    | null: false                    |
| date               | date       | null: false                    |
| memo               | text       |                                |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
