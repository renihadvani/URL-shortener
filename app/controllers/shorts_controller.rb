class ShortsController < ApplicationController
	before_action :set_short, only: :show
	
	def index 
		@shorts = Short.includes(:countries).all
	end

	def new
		@short = Short.new
	end

	def create 
		@short = Short.new(short_params)
		generate_url
		if @short.save 
			render json: { message: 'success', url: @short_url, id: @short.id}, status: :created
		else 
			render json: {message: 'error'}, status: :unprocessable_entity
		end
	end

	def show
		if @short.expire_date > Time.zone.today
			@country = Geocoder.search(request.remote_ip).first.country
			@short.countries.create(name: @country, ip_add: request.remote_ip)
			@short.count += 1
			@short.save
			redirect_to @short.url
		else 
			render :file => 'public/404.html', :status => :not_found, :layout => false
		end
	end

	private 

	def set_short 
		@short = Short.find_by(id: params[:id])
		redirect_to root_path if @short.blank?
	end

	def short_params
		params[:short].permit(:url) 
	end

	def generate_url
		slug = Array.new(5){[*"a".."z", *"0".."9"].sample}.join
		@short_url = DOMAIN + slug
		@short.slug = slug
		@short.expire_date = Time.zone.today + 30.days
	end
end
