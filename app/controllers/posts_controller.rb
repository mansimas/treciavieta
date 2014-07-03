class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show

  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @post_category = Post.last.category
    @post_begin = Post.last.begin
    @post_end = Post.last.end
    @post_people = Post.last.people
    @price_for_banquet_hall = 0

    @datestart = Post.last.begin.to_datetime.hour.to_i
    @datefinish = Post.last.end.to_datetime.hour.to_i
    @date_diff_in_hour = (@datefinish - @datestart).to_i
    @datediff_in_days = (Post.last.end.to_date - Post.last.begin.to_date).to_i


   	       if @datediff_in_days == 0
		   @mapping_date = (Post.last.begin.to_date..Post.last.end.to_date)
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
		     @mapping_date = (Post.last.begin.to_date..Post.last.end.to_date-1)
		     @mapping_date.map do |date|
			 @inputted_hours = ((Post.last.end - Post.last.begin) / 1.hour).round
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
		  @inputted_hours_first_day = (24-Post.last.begin.to_datetime.hour.to_i)
		  @inputted_hours_second_day = (Post.last.end.to_datetime.hour.to_i)
		 
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
		  @inputted_hours_first_day = (24-Post.last.begin.to_datetime.hour.to_i)
		  @inputted_hours_second_day = (Post.last.end.to_datetime.hour.to_i)
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

		     @mapping_date = (Post.last.begin.tomorrow.to_date..Post.last.end.yesterday.to_date)
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
  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)


    respond_to do |format|
      if @post.save
        format.html { redirect_to edit_post_path(id: @post.id), notice: t('Post was successfully created.') }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update2
	 redirect_to edit_post_path(id: @post.id)
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update

    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to edit_post_path(id: @post.id), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { redirect_to new_post_path, notice: 'Problem' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
	    params.require(:post).permit(:id, :category, :begin, :people, :end, :price, :text)
    end
end
