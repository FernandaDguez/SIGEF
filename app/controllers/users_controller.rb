class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    if (current_user.admin?) then
      @user = User.new(user_params)

      respond_to do |format|
        if @user.save
          #RegistrationMailer.registration_email(@user, @user.password).deliver_later
          #redirect_to root_path
          format.html { redirect_to @user, notice: 'El usuario ha sido creada exitosamente.' }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to root_path, notice: "No tienes permisos para realizar esta acción"
      return
    end
  end

  def update
    if (current_user.admin?) then
      respond_to do |format|

        if @user.update(user_params)
          format.html { redirect_to @user, notice: 'El usuario ha sido actualizado exitosamente.' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to root_path, notice: "No tienes permisos para realizar esta acción"
      return
    end
  end

  def destroy
    if (current_user.admin?) then
      @user.destroy
      respond_to do |format|
        format.html { redirect_to :users, notice: 'El usuario se ha eliminado exitosamente.' }
        format.json { head :no_content }
      end
    else
      redirect_to root_path, notice: "No tienes permisos para realizar esta acción"
      return
    end
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :name, :permission, :password, :password_confirmation)
  end


end
