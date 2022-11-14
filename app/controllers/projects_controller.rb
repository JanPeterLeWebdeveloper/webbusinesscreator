lass ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show explore]
  skip_after_action :verify_authorized, only: [:user_index]
  before_action :set_project, only: %i[show edit update destroy]

  def index

  end
