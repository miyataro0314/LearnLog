class MeasurementsController < ApplicationController
    def new
        end_already?
        @measurement = Measurement.new
        render "measurement"
    end

    def index
        # current_userの計測結果のみ取得
        @measurements = Measurement.where(user_id: @current_user.id)
    end

    def show
        # 詳細表示したい1件を取得
        @measurement = Measurement.find_by(id: params[:id])
        # ログインユーザーと認証し、異なる場合は一覧へ
        if @current_user.id != @measurement.user_id
            flash[:notice] = "権限がありません"
            redirect_to(measurements_path)
        end
    end

    def edit
        # 編集したい1件を取得
        @measurement = Measurement.find_by(id: params[:id])
        if @current_user.id != @measurement.user_id
            flash[:notice] = "権限がありません"
            redirect_to(measurements_path)
        end
    end

    def update
        # 更新したい1件を取得
        @measurement = Measurement.find_by(id: params[:id])
        # ログインユーザーと認証し、異なる場合は一覧へ
        if @current_user.id != @measurement.user_id
            flash[:notice] = "権限がありません"
            redirect_to(measurements_path)
        end
        # 更新処理の成否で分岐 ストロングパラメータ使用
        if @measurement.update(measurement_params)
            flash[:notice] = "更新しました"
            redirect_to "/mesurements/#{@measurement.id}/edit"
        else
            flash.now[:notice] = "更新に失敗しました"
            render "edit", status: 422
        end
    end


    def destroy
        # 削除したい1件を取得
        measurement = Measurement.find_by(id: params[:id])
        # ログインユーザーと認証し、異なる場合は一覧へ
        if @current_user.id != measurement.user_id
            flash[:notice] = "権限がありません"
            redirect_to(measurements_path)
        end
        measurement.destroy
        flash[:notice] = "削除しました"
        redirect_to measurements_path
    end

    def start
        # URL直打ち防止
        unless end_already?
            flash.now[:notice] = "まだ計測が完了されていません"
            render "measurement", status: 422
        end

        user = User.find_by(id: session[:user_id])
        @measurement = Measurement.new(date: Date.today, start_at: Time.now, user_id: user.id)
        if @measurement.save
            flash[:notice] = "計測を開始しました"
            redirect_to new_measurement_path
        else
            flash.now[:notice] = "計測を開始出来ませんでした"
            render "measurement", status: 422
        end

    end

    def end
        # URL直打ち防止
        if end_already?
            flash.now[:notice] = "まだ計測が開始されていません"
            render "measurement", status: 422
        end

        user = User.find_by(id: session[:user_id])
        @measurement = Measurement.last
        @measurement[:end_at] = Time.now
        if @measurement.save
            flash[:notice] = "計測を終了しました"
            redirect_to new_measurement_path
        else
            flash.now[:notice] = "計測を終了出来ませんでした"
            render "measurement", status: 422
        end

    end

    private
        def measurement_params
            params.require(:measurement).permit(:date, :start_at, :end_at)
        end

        def end_already?
            measurement = Measurement.where(user_id: @current_user.id).order(created_at: :desc).first

            if measurement == nil
                @end_already = true
                return true
            elsif
                measurement.end_at
                @end_already = true
                return true
            else
                @end_already = false
                return false
            end
        end

end
