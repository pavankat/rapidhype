class BlogsController < ApplicationController
  require 'page_rankr'

  # GET /blogs
  # GET /blogs.json
  def index
    @blogs = Blog.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @blogs }
    end
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    @blog = Blog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @blog }
    end
  end

  # GET /blogs/new
  # GET /blogs/new.json
  def new
    @blog = Blog.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @blog }
    end
  end

  # GET /blogs/1/edit
  def edit
    @blog = Blog.find(params[:id])
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(params[:blog])

    # grab the page rank of the blog and store it
    # if site is unindexed then page_rank will be nil 
    @blog.page_rank = PageRankr.ranks(@blog.url, :google)

    # grab the alexa ranking of the blog and store it
    @blog.alexa = PageRankr.ranks(@blog.url, :alexa_us)

    # should throw all of this into the background and time them out by 12 seconds apart (to avoid the seomoz 10 second penalty)
      response = client.urlMetrics(@blog.url, :cols => :all)

      # A normalized 100-point score representing the likelihood of a domain to rank well in search engine results
      @blog.domain_authority = response.data[:domain_authority]
      
      # External Equity Links
      # The number of external equity links to the URL
      # equity represents a page's ability to rank higher in search engine results. 
      @blog.external_links = response.data[:external_links]
      
      # A normalized 100-point score representing the likelihood of a page to rank well in search engine results
      @blog.page_authority = response.data[:page_authority]

      # The number of links (equity or nonequity or not, internal or external) to the URL
      @blog.links = response.data[:links]

      # The MozRank of the URL, in both the normalized 10-point score (umrp) and the raw score (umrr)
      @blog.mozrank = response.data[:mozrank]

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        format.json { render json: @blog, status: :created, location: @blog }
      else
        format.html { render action: "new" }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /blogs/1
  # PUT /blogs/1.json
  def update
    @blog = Blog.find(params[:id])

    respond_to do |format|
      if @blog.update_attributes(params[:blog])
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to blogs_url }
      format.json { head :no_content }
    end
  end
end
