class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about]
  #全てのアクションの前にユーザーがログインしているか確認するよ
  #ただし、topアクションは除くよ
  before_action :configure_permitted_parameters, if: :devise_controller?
  #これの意味
  def after_sign_in_path_for(resource)#サインインした後にアクセスするパスは
    user_path(current_user.id)#（現在ログインしているユーザーのidの）ユーザーパスつまりユーザー詳細画面に行くよ
  end

  def after_sign_out_path_for(resource)#サインアウトした後にアクセスするパスは
    root_path#ルートパスだよつまりトップ画面にアクセスするよ
  end

  private#ここから下はこのコントローラでしか呼び出せないよ？
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
