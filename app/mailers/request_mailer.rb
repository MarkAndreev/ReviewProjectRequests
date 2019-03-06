class RequestMailer < ApplicationMailer
  def welcome_email
    @request = params[:request]
    @url  = 'http://localhost:3000'
    mail(to: @request.email, subject: 'Спасибо, что оставили отзыв или задали вопрос!')
  end
end
