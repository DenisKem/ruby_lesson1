+ Установите git, у кого нет

`sudo apt-get update`

`sudo apt-get install git`

+ Далее в домашней директории:

`git clone https://github.com/DenisKem/ruby_lesson1.git`

`cd ruby_lesson1`

`bundle install`

`rake db:create`

`rake db:migrate`

`rake db:seed`

+ Запустите сервер
`rails server`