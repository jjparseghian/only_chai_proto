class ProfilesController < ApplicationController
  def new
    @client = MemberProfile.new
    @fitness_professional = FitnessProfessionalProfile.new
  end

  def create
    p params
    user = User.find(session[:user_id])
    p user
    if user.user_type == "Client"
      @client = MemberProfile.new(client_params)
      if @client.save
        p "Client profile created successfully"
      else
        p "Something went wrong"
      end
    elsif user.user_type == "Fitness_Professional"
      @fitness_professional = FitnessProfessionalProfile.new(fitness_professional_params)
      if @fitness_professional.save
        p "Successfully created fitness professional profile"
      else
        p "Error creating fitness professional profile"
      end
    else
      p "Problem creating profile either profile"
    end
  end

  def show

  end

  def edit
  end

  def update
  end

  private

  def client_params
    params.require(:client).permit(
      :ethnicity,
      :height,
      :weight,
      :smoking_status,
      :activity_level,
      :own_space_descrip,
      :independent_facility_descrip,
      :trainer_facility_descrip,
      :fitness_facility_descrip,
      :goal_specifics,
      :consent_waiver,
      :user_id,
      :injury_history => [],
      :past_injury => [],
      :medical_conditions => [],
      :goals => [],
      :training_location => [],
      :training_style => [],
      :appointment_lengths => [],
      :group_training => []
      )
  end

  def fitness_professional_params
    params.require(:fitness_professional).permit(
      :ethnicity,
      :client_space_descrip,
      :independent_facility_descrip,
      :membership_facility_descrip,
      :private_facility_descrip,
      :credentials,
      :goal_specifics,
      :athlete_experience,
      :consent_waiver,
      :user_id,
      :training_location => [],
      :goals => [],
      :medical_conditions => [],
      :orthopedic_injury_experience => [],
      :population_experience => [],
      :training_style => [],
      :appointment_lengths => [],
      :group_training => [],
      )
  end
end
