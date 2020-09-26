class V1::TokensController < ApplicationController
  def create
    Token.create
    render status: :created, json: { message: "Token created" }
  end

  def destroy
    Token.find(params[:id]).destroy
    render status: :ok, json: { message: "Token deleted" }
  end
end
