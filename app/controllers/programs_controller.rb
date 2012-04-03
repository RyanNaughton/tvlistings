class ProgramsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index

    @search = Program.search do
      fulltext params[:q]
    end

#    if params[:q]
 #   @programs = Program.where("title like ? or subtitle like ?","%#{params[:q]}", "%#{params[:q]}%")
  #  else
   #   @programs = Program.all
    #end
    @programs = @search.results

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @programs }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @program = Program.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @program }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @program = Program.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @program }
    end
  end

  # GET /posts/1/edit
  def edit
    @program = Program.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @program = Post.new(params[:post])

    respond_to do |format|
      if @program.save
        format.html { redirect_to @program, notice: 'Post was successfully created.' }
        format.json { render json: @program, status: :created, location: @program }
      else
        format.html { render action: "new" }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @program = Program.find(params[:id])

    respond_to do |format|
      if @program.update_attributes(params[:post])
        format.html { redirect_to @program, notice: 'Post was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @program = Program.find(params[:id])
    @program.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :ok }
    end
  end
end
