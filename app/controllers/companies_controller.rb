class CompaniesController < ApplicationController	

	def index
		# check if the query string contains this param. if so, it means a filter is selected
		@has_filter = params["company_name"].present?
		@list = Company.select(:name).distinct.order(:name)
		
		if @has_filter
			selected_company_name = Company.find_by_name(params["company_name"]).name
			@companies = Company.where("name = ?", selected_company_name)
		else	
			@companies = Company.all
		end	
	end
	
	def new  
		@company = Company.new
	end

	def create
		@company = Company.new(company_params)
		if @company.save
			redirect_to @company, notice: "The company   \"#{@company.name}\"   was built successfully."
		else
			render "new"
		end
	end

	def show
		@company= Company.find(params[:id])
		@has_filter = params["bank_name"].present?
		@company_accounts = @company.bank_accounts
		@distinct_accounts = @company_accounts.select(:bank_name).distinct.order(:bank_name)

		if @has_filter
			selected_bank_name = @company_accounts.find_by_bank_name(params["bank_name"]).bank_name
			
			@bank_accounts = @company_accounts.where("bank_name = ?", selected_bank_name)
		else
			@bank_accounts= @company_accounts
		end

	end

	def edit
		@company= Company.find(params[:id])
	end

	def update 
		@company= Company.find(params[:id])
		if @company.update(company_params)
			redirect_to companies_url, notice: "The company \"#{@company.name}\" was updated sucessfully."
		else
			render "edit"
		end
	end

	def destroy
		@company= Company.find(params[:id])
		@company.destroy
		flash[:success] = "Company deleted"
		redirect_to companies_url
	end

	private

	def company_params
		params.require(:company).permit(:name, :address, :directors, :logo)
	end


end