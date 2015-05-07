class MembersController < ApplicationController
  def show
    user_id = session[:user_id]
    all_trainers = User.where(user_type: "Fitness_Professional")
    @trainers = all_trainers.sample(3)
    @trainer = all_trainers.sample
  end
end
