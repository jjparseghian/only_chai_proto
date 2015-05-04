class ProfilesController < ApplicationController
  def new
    @client = MemberProfile.new
    @fitness_professional = FitnessProfessionalProfile.new
  end

  def create
    @client = MemberProfile.new(client_params)
    @fitness_professional = FitnessProfessionalProfile.new(fitness_professional_params)

    if @client.save || @fitness_professional.save
      p "Profile created successfully"
    else
      p "Something went wrong"
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
    params.require(:client).permit(:ethnicity, :height, :weight, :smoking_status, :activity_level, :training_location, :my_own_space, :independent_facility, :trainer_facility, :goals, :goal_specifics, :medical_conditions, :past_injury, :injury_history, :training_style, :appointment_lengths, :group_training, :consent_waiver, :user_id)
  end

  def fitness_professional_params
    params.require(:fitness_professional).permit(:ethnicity, :training_location, :client_space_descrip, :independent_facility_descrip, :membership_facility_descrip, :private_facility_descrip, :credentials, :goals, :goal_specifics, :medical_conditions, :orthopedic_injury_experience, :population_experience, :athlete_experience, :training_style, :appointment_lengths, :group_training, :consent_waiver, :user_id)
  end
end
