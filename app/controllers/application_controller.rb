require "json"
class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here

  # GET all restaurants
  get "/api/restaurants" do
    r=Restaurant.all
    r.to_json
  end

  # GET all jobs
  get "/api/jobs" do
    Job.all.to_json(include: :restaurant)
  end

  # GET all jobs and applicants
  get "/api/applicants" do
    Job.all.to_json(include: {restaurant: {include: {jobs: {include: {userjobs: {include: :user}}}}}})
    # Job.all.to_json(include: :restaurant)
  end
  # Joellen Ratke
  # GET specific user and applied jobs
  get "/api/myappliedjobs/:full_name" do
    specific_user = User.find_by_full_name(params[:full_name])
    specific_user.to_json(include: {userjobs: {include: :job}})
  end

  # GET all users
  get "/api/users" do
    u=User.all
    u.to_json
  end

  # GET specific restaurant with its jobs
  get "/api/restaurants/:id" do
    specific_restaurant = Restaurant.find(params[:id])
    specific_restaurant.to_json(include: :jobs)
  end

  # GET specific job and its applicants
  get "/api/jobs/:id" do
    specific_job = Job.find(params[:id])
    specific_job.to_json(include:
    {userjobs: {include: :user}}
    )
  end

  # GET specific user 
  get "/api/users/:full_name" do
    specific_user = User.find_by_full_name(params[:full_name])
    if specific_user
      specific_user.to_json(include: {restaurants: {include: {jobs: {include: {userjobs: {include: :user}}}}}})
    else
      {message: "This username does not exist"}.to_json
    end
  end

  # GET specific hiring manager's restaurants and posted jobs
  get "/api/applicants/:full_name" do
    specific_user =Job.select{|i| i.hiring_managername ==params[:full_name]}
      # _by_hiring_managername(params[:full_name])
    if specific_user
      specific_user.to_json(include: :users)
    else
      {message: "This username does not exist"}.to_json
    end
  end

  # GET specific user and applied jobs
  get "/api/myjobs/:id" do
    specific_user = User.find(params[:id])
    specific_user.to_json(include: :userjobs)
  end

  #DELETE specific restaurant
  delete "/api/restaurants/:id" do
    specific_restaurant = Restaurant.find(params[:id])
    specific_restaurant.destroy 
    specific_restaurant.to_json 
  end 

  #DELETE specific job
  delete "/api/jobs/:id" do
    specific_job = Job.find(params[:id])
    specific_job.destroy 
    specific_job.to_json 
  end 

  #POST new user
  post "/api/users" do 
    new_user = User.create(
      hiringcheck_id: 2,
      full_name: params[:full_name],
      phone_number: params[:phone_number],
      email: params[:email],
      description: params[:description],
      profile_pic: params[:profile_pic],
      linkedin_link: params[:linkedin_link],
    )
    new_user.to_json
  end

  #POST new restaurant
  post "/api/restaurants" do 
    new_restaurant = Restaurant.create(
      user_id: params[:user_id],
      name: params[:name],
      borough_location: params[:borough_location],
      price_range: params[:price_range],
      picture: params[:picture],
      restaurant_type: params[:restaurant_type]
    )
    new_restaurant.to_json
  end

  #POST new job
  post "/api/jobs" do 
    JSON.parse(request.body.read.to_json)
    
    new_job = Job.create(
      restaurant_id: params[:restaurant_id],
      name: params[:name],
      job_type: params[:job_type],
      pay: params[:pay],
      description: params[:description],
      desired_start_date: params[:desired_start_date]
    )
    new_job.to_json
  end

  # PATCH specific restaurant
  patch "/api/restaurants/:id" do
    specific_restaurant = Restaurant.find(params[:id])
    specific_restaurant.update(
      price_range: params[:price_range],
      picture: params[:picture]
    )
    specific_restaurant.to_json
  end

  # PATCH specific job
  patch "/api/jobs/:id" do
    specific_job = Job.find(params[:id])
    specific_job.update(
      job_type: params[:job_type],
      pay: params[:pay],
      description: params[:description],
      desired_start_date: params[:desired_start_date]
    )
    specific_job.to_json
  end

  # POST apply to specific job
  post "/api/jobs/:id/apply" do
    new_job = Userjob.create(
      job_id: params[:id],
      user_id: 1 #to do remove hard-coded userID
    )
    # new_job.user_id = User.find_by_full_name(params[:full_name]).id
    # new_job.save
    new_job.to_json
  end

  # PATCH specific user
  patch "/api/users/:id" do
    specific_user = User.find(params[:id])
    specific_user.update(
      hiringcheck_id: 2,
      phone_number: params[:phone_number],
      email: params[:email],
      description: params[:description],
      profile_pic: params[:profile_pic],
      linkedin_link: params[:linkedin_link],
    )
    specific_user.to_json
  end

  #PATCH user hiring status
  patch "/api/booked/:full_name" do
    hired_user=User.find_by_full_name(params[:full_name])
    # hired_user.hired?=true
    hired_user.update(hired?:true)
    hired_user.save
    hired_user.to_json
  end
  

end
