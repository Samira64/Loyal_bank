class BankAccountsController < ApplicationController
	before_action :current_bank_account, only: [:show, :edit, :update, :destroy]

	def new
		@company = Company.find(params[:company_id])
		@bank_account = BankAccount.new
	end

	def create
		@company = Company.find(params[:company_id])
		@bank_account = @company.bank_accounts.create(bank_account_params)
		
		if @bank_account.save
			render :show, notice: "the account_number   \"#{@bank_account.bank_name}\"  was built successfully"
		else
			render "new"
		end
	end

	def show	
	end

	def edit
	end

	def update	
		respond_to do |format|
			if @bank_account.update(bank_account_params)
				format.html { redirect_to company_bank_account_url, notice: 'bank_account was successfully updated.' }
				format.json { render :show, status: :ok, location: @bank_account }
			else
				format.html { render :edit }
				format.json { render json: @bank_account.errors, status: :unprocessable_entity }
			end
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
