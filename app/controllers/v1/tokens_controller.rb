class V1::TokensController < ApplicationController
  def create
    Token.create
    render status: :created, json: { message: "Token created" }
  end

  def destroy
    Token.find(params[:id]).destroy
    render status: :ok, json: { message: "Token deleted" }
  end

  def assign
    token = Token.available.sample

    if token&.keep_alive
      render status: :ok, json: {
        key: token._id.to_s,
        message: "Token assigned"
      }
    else
      render status: :not_found, json: { message: "Record not found" }
    end
  end
end
