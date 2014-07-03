class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.all
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new(params[:post_id])
    @post = Post.last
    @price_for_banquet_hall = 0
    @post_begin = @post.begin
    @post_end = @post.end
    @datestart = @post.begin.to_datetime.hour.to_i
    @datefinish = @post.end.to_datetime.hour.to_i
    @date_diff_in_hour = (@datefinish - @datestart).to_i
    @datediff_in_days = (@post.end.to_date - @post.begin.to_date).to_i


   	       if @datediff_in_days == 0
		   @mapping_date = (@post.begin.to_date..@post.end.to_date)
		   @mapping_date.map do |date|
			 if date.wday.to_i == 1
		   		 date = 36* @date_diff_in_hour
			 elsif date.wday.to_i == 2
		  		  date = 36* @date_diff_in_hour
			 elsif date.wday.to_i == 3
		  		  date = 36* @date_diff_in_hour
			 elsif date.wday.to_i == 4
		   		 date = 48* @date_diff_in_hour
			 elsif date.wday.to_i == 5
		  		  date = 55* @date_diff_in_hour
			 elsif date.wday.to_i == 6
		  		  date = 73* @date_diff_in_hour
			 else
		  		  date = 65* @date_diff_in_hour
			 end 
			   	 @price_for_banquet_hall += date 
		     end
		  end
    		 if @datediff_in_days == 1
		     @mapping_date = (@post.begin.to_date..@post.end.to_date-1)
		     @mapping_date.map do |date|
			 @inputted_hours = ((@post.end - @post.begin) / 1.hour).round
			 if date.wday.to_i == 1
		  		  date = 36*@inputted_hours
			 elsif date.wday.to_i == 2
				    date = 36*@inputted_hours
			 elsif date.wday.to_i == 3
				    date = 36*@inputted_hours
			 elsif date.wday.to_i == 4
				    date = 48*@inputted_hours
			 elsif date.wday.to_i == 5
		  		  date = 55*@inputted_hours
			 elsif date.wday.to_i == 6
		  		  date = 73*@inputted_hours
			 else
		  		  date = 65*@inputted_hours
			 end 
				 @price_for_banquet_hall += date 
		     end
   		  end

		  if @datediff_in_days == 2
		  @inputted_hours_first_day = (24-@post.begin.to_datetime.hour.to_i)
		  @inputted_hours_second_day = (@post.end.to_datetime.hour.to_i)
		 
			 if @post_begin.to_datetime.wday.to_i == 1
		  		 @date1 = 36*@inputted_hours_first_day
			 elsif @post_begin.to_datetime.wday.to_i == 2
				 @date1 = 36*@inputted_hours_first_day
			 elsif @post_begin.to_datetime.wday.to_i == 3
				 @date1 = 36*@inputted_hours_first_day
			 elsif @post_begin.to_datetime.wday.to_i == 4
				 @date1 = 48*@inputted_hours_first_day
			 elsif @post_begin.to_datetime.wday.to_i == 5
		  		 @date1 = 55*@inputted_hours_first_day
			 elsif @post_begin.to_datetime.wday.to_i == 6
		  		 @date1 = 73*@inputted_hours_first_day
			 else
		  		 @date1 = 65*@inputted_hours_first_day
		         end

			 if @post_begin.tomorrow.to_datetime.wday.to_i == 1
		  		 @date2 = 36*24
			 elsif @post_begin.tomorrow.to_datetime.wday.to_i == 2
				 @date2 = 36*24
			 elsif @post_begin.tomorrow.to_datetime.wday.to_i == 3
				 @date2 = 36*24
			 elsif @post_begin.tomorrow.to_datetime.wday.to_i == 4
				 @date2 = 48*24
			 elsif @post_begin.tomorrow.to_datetime.wday.to_i == 5
		  		 @date2 = 55*24
			 elsif @post_begin.tomorrow.to_datetime.wday.to_i == 6
		  		 @date2 = 73*24
			 else
		  		 @date2 = 65*24
		         end

			 if @post_end.to_datetime.wday.to_i == 1
		  		 @date3 = 36*@inputted_hours_second_day
			 elsif @post_end.to_datetime.wday.to_i == 2
				 @date3 = 36*@inputted_hours_second_day
			 elsif @post_end.to_datetime.wday.to_i == 3
				 @date3 = 36*@inputted_hours_second_day
			 elsif @post_end.to_datetime.wday.to_i == 4
				 @date3 = 48*@inputted_hours_second_day
			 elsif @post_end.to_datetime.wday.to_i == 5
		  		 @date3 = 55*@inputted_hours_second_day
			 elsif @post_end.to_datetime.wday.to_i == 6
		  		 @date3 = 73*@inputted_hours_second_day
			 else
		  		 @date3 = 65*@inputted_hours_second_day
		         end

			 @price_for_banquet_hall = @date1 + @date2 + @date3
   		  end	

		  if @datediff_in_days > 2
		  @inputted_hours_first_day = (24-@post.begin.to_datetime.hour.to_i)
		  @inputted_hours_second_day = (@post.end.to_datetime.hour.to_i)
		  @date2 = 0
			 if @post_begin.to_datetime.wday.to_i == 1
		  		 @date1 = 36*@inputted_hours_first_day
			 elsif @post_begin.to_datetime.wday.to_i == 2
				 @date1 = 36*@inputted_hours_first_day
			 elsif @post_begin.to_datetime.wday.to_i == 3
				 @date1 = 36*@inputted_hours_first_day
			 elsif @post_begin.to_datetime.wday.to_i == 4
				 @date1 = 48*@inputted_hours_first_day
			 elsif @post_begin.to_datetime.wday.to_i == 5
		  		 @date1 = 55*@inputted_hours_first_day
			 elsif @post_begin.to_datetime.wday.to_i == 6
		  		 @date1 = 73*@inputted_hours_first_day
			 else
		  		 @date1 = 65*@inputted_hours_first_day
		         end

			  if @post_end.to_datetime.wday.to_i == 1
		  		 @date3 = 36*@inputted_hours_second_day
			 elsif @post_end.to_datetime.wday.to_i == 2
				 @date3 = 36*@inputted_hours_second_day
			 elsif @post_end.to_datetime.wday.to_i == 3
				 @date3 = 36*@inputted_hours_second_day
			 elsif @post_end.to_datetime.wday.to_i == 4
				 @date3 = 48*@inputted_hours_second_day
			 elsif @post_end.to_datetime.wday.to_i == 5
		  		 @date3 = 55*@inputted_hours_second_day
			 elsif @post_end.to_datetime.wday.to_i == 6
		  		 @date3 = 73*@inputted_hours_second_day
			 else
		  		 @date3 = 65*@inputted_hours_second_day
		         end

		     @mapping_date = (@post.begin.tomorrow.to_date..@post.end.yesterday.to_date)
		     @mapping_date_count = @mapping_date.count 
		     @mapping_date_weekdays = @mapping_date.map{ |date1| date1.wday }
		     @mapping_date.map do |date|
			 if date.wday.to_i == 1
		  		  date = 36*24
			 elsif date.wday.to_i == 2
				    date = 36*24
			 elsif date.wday.to_i == 3
				    date = 36*24
			 elsif date.wday.to_i == 4
				    date = 48*24
			 elsif date.wday.to_i == 5
		  		  date = 55*24
			 elsif date.wday.to_i == 6
		  		  date = 73*24
			 else
		  		  date = 65*24
			 end 
				 @date2 += date.to_i
		         end

			 @price_for_banquet_hall = @date1 + @date3 + @date2
   		  end		
    
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:name, :lastname, :phone, :email, :additional_info, :price, :post_id)
    end
end
