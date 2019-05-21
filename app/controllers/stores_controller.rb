class StoresController < ApplicationController
  def index
    @stores = Store.includes(:transactions).all
  end
end
