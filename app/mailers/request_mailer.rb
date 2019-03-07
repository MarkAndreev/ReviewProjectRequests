class RequestMailer < ApplicationMailer
  def welcome_email
    @request = params[:request]
    @url  = 'http://localhost:3000'
    mail(to: @request.email, subject: 'Спасибо, что оставили отзыв или задали вопрос!')
  end

  def new_request_email
  @request = params[:request]
  @admin = params[:admin]
  @url  = 'http://localhost:3000'
  mail(to: @admin.email, subject: 'Пользователь задается вопросом!')
  end

  def response_email
    @request = params[:request]
    @url  = 'http://localhost:3000'
    mail(to: @request.email, subject: 'Ответ на Ваш вопрос!')
  end
end
