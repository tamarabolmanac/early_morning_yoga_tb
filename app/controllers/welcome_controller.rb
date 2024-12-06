class WelcomeController < ApplicationController
  before_action :authenticate_user!, only: [:about_yoga]
  def about_yoga
  end
end
