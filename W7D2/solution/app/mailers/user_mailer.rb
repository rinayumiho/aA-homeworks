class UserMailer < ApplicationMailer
    default from: '99cats@99cats.com'

    def welcome_email(user)
        @user = user
        @url = 'http://localhost:3000/session/new'
        mail(to: @user.username, subject: 'Welcome!')
    end
end
