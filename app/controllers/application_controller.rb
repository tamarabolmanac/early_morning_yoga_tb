class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  include Authentication
  include ApplicationHelper
end
