class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    authorize @review
    @review.test = Test.find(params[:test_id])
    @review.user = current_user
    if @review.save
      redirect_to test_path(@review.test, anchor: "review-#{@review.id}")
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :question1, :question2, :question3)
  end
end
