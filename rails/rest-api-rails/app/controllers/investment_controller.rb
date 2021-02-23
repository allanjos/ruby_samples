require 'base64'
require 'date'
require 'json'

class InvestmentController < ApplicationController
  def index
    puts("index()")

    #request.headers.each do |key, value|
    #  puts "#{key}: #{value}"
    #end

    #puts('Authorization: ' + request.headers['Authorization'])

    authorizationToken = request.headers['Authorization']

    authorizationToken = authorizationToken.gsub(/^Basic\s+/, '')

    authorizationToken = Base64.decode64(authorizationToken)

    #puts('Authorization token: ' + authorizationToken)

    userCredential = authorizationToken.split(':')

    #puts('User credential:' + userCredential[0] + ', ' + userCredential[1])
    #puts('Login: ' + userCredential[0])
    #puts('Password: ' + + userCredential[1])

    investments = Investment.all

    result = {
      resource: "investments",
      status: 'ok',
      data: investments
    }

    render json: result, status: :ok
  end

  def show
    puts("show()")

    response = '{"resource": "investment-show"}'

    render json: response, status: :ok
  end

  def new
    puts("new()")

    #puts("request.raw_post: " + request.raw_post)

    info = JSON.parse(request.raw_post)

    info.each do |key, value|
      puts "#{key}: #{value}"
    end

    currentDate = DateTime.now
    currentDate.strftime("%Y/%m/%d %H:%M:%s")

    investment = Investment.create(name: info['name'], broker: info['broker'], register_dt: currentDate)

    response = {
      resource: "investment-new",
      status: 'ok',
      data: investment
    }

    render json: response, status: :ok
  end

  def update
    puts("update()")

    #puts("request.raw_post: " + request.raw_post)

    info = JSON.parse(request.raw_post)

    puts("id: #{info['id']}")

    investment = Investment.find(info['id'])

    investment.update(name: info['name'], broker: info['broker'])

    response = {
      resource: "investment-update",
      status: 'ok',
      data: investment
    }

    render json: response, status: :ok
  end

  def delete
    puts("delete()")

    puts("param id: #{params[:id]}")

    investment = Investment.find(params[:id])

    investment.destroy()
  end
end
