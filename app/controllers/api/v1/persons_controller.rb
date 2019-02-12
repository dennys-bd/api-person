class Api::V1::PersonsController < ApplicationController

    before_action :find_person, only: [:show, :update]

    def show
    end

    def index
        @persons = Person.all.order(:created_at)
    end

    def create
        @person = Person.new(person_params)

        if @person.save
            render :show, status: :created
        else
            render json: { errors: @person.errors }, status: :unprocessable_entity
        end
    end

    def update
        if @person.update(person_params)
            render :show, status: :ok
        else
            render json: { errors: @person.errors }, status: :unprocessable_entity
        end
    end

    protected

    def find_person
        unless @person = Person.find_by(id: params[:uuid])
            head :not_found
        end
    end

    def person_params
        params.require(:person).permit(:name, :email)
    end
end
