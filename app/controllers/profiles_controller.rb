class ProfilesController < ApplicationController
  def show
    @profile = current_user.profile
  end

  def edit
    # if current_user.profile.present?
    #   @profile = current_user.profile
    # else
    #   @profile = current_user.build_profile
    # end
    # 上の表現から下の表現へ変更できる
    # @profile = current_user.profile || current_user.build_profile
    # 更にこの表現から下記の表現へ変更できる（user.rb）
    @profile = current_user.prepare_profile
  end

  def update
    @profile = current_user.prepare_profile
    @profile.assign_attributes(profile_params)
    if @profile.save
      redirect_to profile_path, notice: 'プロフィール画像更新'
    else
      flash.now[:error] = '更新できませんでした'
      render 'edit'
    end
  end

  def destroy
  end

  private
  def profile_params
    params.require(:profile).permit(:avatar)
  end
end