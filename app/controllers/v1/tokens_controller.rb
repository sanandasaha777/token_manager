class V1::TokensController < ApplicationController
  def create
    Token.create
    render status: :created, json: { message: "Token created" }
  end
end
