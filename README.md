Live: http://alexa-scraper.herokuapp.com/

**Note:** The screenshots do not work on heroku because the web dynos are read-only,
so I would need to setup an AWS S3 account to upload files there

**Preview**

![](https://dl.dropboxusercontent.com/spa/9kycf4oxo6l3hcj/sdasln-m.png)

### How to setup

```sh-session
bundle install
bundle exec rake db:setup
bundle exec rake alexa:import_top_sites

rails server
```
