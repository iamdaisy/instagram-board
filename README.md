#### 

##### form_for 학습함

`rails new form_for --skip-bundle`

`rails g scaffold blog title content image_url is_active:boolean`

`rails g controller posts index new create show edit update destroy`

`rails g model post title content img_url is_active:boolean`

`rake db:migrate`



#### page nation

`gem 'kaminari'`



`gem 'faker'`  추가 후 seed.rb 파일에 데이터 얼마나 넣을지 기술

`rake db:seed`



#### signin / login

`gem 'devise'`

`rails g devise:install`



####  drop 없이 migrate 파일 만들어서 컬럼 추가하기

`rails g migration add_user_id_to_tweets user_id:integer`

`rake db:migrate` 

