class BankAccountsController < ApplicationController
	before_action :current_bank_account, only: [:show, :edit, :update, :destroy]

	def index
		redirect_to action: :new	
	end	

	def new
		@company = Company.find(params[:company_id])
		@bank_account = BankAccount.new
		render layout: 'modern'
	end

	def create
		@company = Company.find(params[:company_id])
		@bank_account = @company.bank_accounts.create(bank_account_params)
		if @bank_account.save
			redirect_to company_url(@company), notice: "The bank account \"#{@bank_account.bank_name}\" was built successfully."
		else
			render "new", layout: 'modern'
		end
	end

	def show
		@company= Company.find(params[:company_id])
		@bank_account = @company.bank_accounts.find(params[:id])
	    render layout: 'modern'	
	end

	def edit
		render layout: 'modern'
	end

	def update	
			if @bank_account.update(bank_account_params)
				redirect_to company_bank_account_url, notice: "The bank account \"#{@bank_account.bank_name}\" was successfully updated."  
			else
		       render "edit", layout: 'modern'
			end
	end

	def destroy
		@bank_account.destroy
		redirect_to company_url(@company)
	end

	private
	def bank_account_params
		params.require(:bank_account).permit(:bank_name, :currency, :account_number, :swift_code, :bank_address, :user_name, :password, :logo, :account_type)
	end

	def current_bank_account
		@company= Company.find(params[:company_id])
		@bank_account= @company.bank_accounts.find(params[:id])
	end
end
