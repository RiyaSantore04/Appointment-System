class FeedbacksController < ApplicationController

	def create
		@feedback = Feedback.new(counsellor_id: params[:counsellor_id],customer_id: params[:customer_id],description: params[:description] )
		if @feedback.save
			render json: @feedback, status: 201
		else
			render json: { errors: @feedback.errors.full_messages },
			status: :unprocessable_entity
		end
	end

	def destroy
		@feedback = Feedback.find(params[:id])
        @feedback.destroy
        render json: {message: "deleted successfully" },
			status: :unprocessable_entity
	end
end
