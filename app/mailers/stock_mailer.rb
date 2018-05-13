class StockMailer < ApplicationMailer
  def error_email(method_name, error)
    @method_name = method_name
    @error = error

    mail(to: 'magokoro1106@gmail.com', subject: '【Stock Tool】で例外が発生しました')
  end
end
