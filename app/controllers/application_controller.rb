class ApplicationController < ActionController::Base
  #ApplicationControllerは全てのコントローラに対する処理を行う権限を持ってるよ
  #deviseのコントローラは編集できないよ
  before_action :authenticate_user!, except: [:top, :about]
  #全てのアクションの前にユーザーがログインしているか確認するよ
  #ただし、topアクションは除くよ
  before_action :configure_permitted_parameters, if: :devise_controller?
  #（アプリ２の６章）devise利用の機能（ユーザ登録、ログイン認証など）が使われる前に、
  #configure_permitted_parametersメソッドが実行されるよ

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

  protected#ここから下は呼び出された他のコントローラからも参照できるよ

  def configure_permitted_parameters#ストロングパラメータと同じ機能だよ
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end#ユーザー登録（sign_up）の際に、emailのデータ操作を許可しているよ
end
