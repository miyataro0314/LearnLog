class MeasurementsController < ApplicationController
    def new
        render "measurement"
    end

    def index
        @measurements = Measurement.all
    end

    def show
        @measurement = Measurement.find_by(id: params[:id])
    end

    def edit

    end

    def destroy
        measurement = Measurement.find_by(id: params[:id])
        measurement.destroy
        redirect_to measurements_path
    end

    def start
        user = User.find_by(id: session[:user_id])
        measurement = Measurement.new(start_at: Time.now, user_id: user.id)
        if measurement.save
            flash.now[:notice] = "記録を開始しました#{measurement.start_at}"
            render "measurement", status: 422
        else
            flash.now[:notice] = "記録を開始出来ませんでした"
            render "measurement", status: 422
        end

    end

    def end
        user = User.find_by(id: session[:user_id])
        measurement = Measurement.last
        measurement[:end_at] = Time.now
        if measurement.save
            flash.now[:notice] = "記録を開始しました#{measurement.end_at}、#{measurement.end_at - measurement.start_at}"
            render "measurement", status: 422
        else
            flash.now[:notice] = "記録を開始出来ませんでした"
            render "measurement", status: 422
        end

    end


end
