class CompaniesController < ApplicationController
	

	def index
		@companies = Company.all
	end
	

	def new 
		@company = Company.new
	end

	def create
		@company = Company.new(company_params)
		if @company.save
			redirect_to @company, notice: "the company   \"#{@company.name}\"  was built successfully"
		else
			render "new"
		end
	end

	def show
		@company= Company.find(params[:id])
	end

	private

	def company_params
		params.require(:company).permit(:name, :address, :directors, :logo, :custom_fields)
	end

end