class RequestsController < ApplicationController
  def index
	# For URL like /movies/1/reviews
	# Get the movie with id=1
	@patient = Patient.find(params[:patient_id])
	# Access all reviews for that movie
	@requests = @patient.requests
  end

  def show
	@patient = Patient.find(params[:patient_id])
	# For URL like /movies/1/reviews/2
	# Find an review in movies 1 that has id=2
	@request = @patient.requests.find(params[:id])
  end

  def new
	@patient = Patient.find(params[:patient_id])
	# Associate an review object with movie 1
	@request = @patient.requests.build
  end

  def create
	@patient = Patient.find(params[:patient_id])
	# For URL like /movies/1/reviews
	# Populate an review associate with movie 1 with form data
	# Movie will be associated with the review
	# @review = @movie.reviews.build(params.require(:review).permit!)
	@request = @patient.requests.build(params.require(:request).permit(:details))
	if @request.save
		# Save the review successfully
		redirect_to patient_request_url(@patient, @request)
	else
		render :action => "new"
	end
  end

  def edit
	@patient = Patient.find(params[:patient_id])
	# For URL like /movies/1/reviews/2/edit
	# Get review id=2 for movie 1
	@request = @patient.requests.find(params[:id])
  end

  def update
	@patient = Patient.find(params[:patient_id])
	@request = Request.find(params[:id])
	if @request.update_attributes(params.require(:request).permit(:details))
		# Save the review successfully
		redirect_to patient_request_url(@patient, @request)
  	else
		render :action => "edit"
  	end
  end

  def destroy
	@patient = Patient.find(params[:patient_id])
	@request = Request.find(params[:id])
	@request.destroy
	respond_to do |format|
	format.html { redirect_to patient_requests_path(@patient) }
	format.xml { head :ok }
  end
end
end
