class ChaptersController < ApplicationController
  before_action :set_chapter, only: [ :edit, :update, :destroy, :show]
  before_action :nodes, only: [:show, :to_md]
  # before_action :nodes_to_md, only: [:to_md]

  # GET /chapters
  # GET /chapters.json
  def index
    @chapters = Chapter.all
  end

  # GET /chapters/1
  # GET /chapters/1.json
  def show
  end

  # GET /chapters/new
  def new
    @chapter = Chapter.new
  end

  # GET /chapters/1/edit
  def edit
  end

  # POST /chapters
  # POST /chapters.json
  def create
    @chapter = Chapter.new(chapter_params)
    @md = params[:md]

    #redCarpet
    renderer = ChapterRenderer.new
    renderer.chapter = @chapter
    markdown = Redcarpet::Markdown.new(renderer, extensions = {})
    convert_text = markdown.render(@md)

    # @chapter.name = convert_text.match(%r{<h1>(.+?)</h1>})[1]

    respond_to do |format|
      if @chapter.save
        format.html { redirect_to @chapter}
        format.json { render :show, status: :created, location: @chapter }
      else
        format.html { render :new }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chapters/1
  # PATCH/PUT /chapters/1.json
  def update
    respond_to do |format|
      if @chapter.update(chapter_params)
        format.html { redirect_to @chapter, notice: 'Chapter was successfully updated.' }
        format.json { render :show, status: :ok, location: @chapter }
      else
        format.html { render :edit }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chapters/1
  # DELETE /chapters/1.json
  def destroy
    @chapter.destroy
    respond_to do |format|
      format.html { redirect_to chapters_url, notice: 'Chapter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def to_md
  end

  def nodes
    @chapters = Chapter.includes(:quotations, :headings, :codes, :urls).find(params[:id])
    @nodes = []
    @heads  = @chapters.headings
    @codes  = @chapters.codes
    @quotes = @chapters.quotations
    @urls   = @chapters.urls

    @codes.each do |hoge|
      @nodes.push hoge
    end
    @heads.each do |hoge|
      @nodes.push hoge
    end
    @quotes.each do |hoge|
      @nodes.push hoge
    end
    @urls.each do |hoge|
      @nodes.push hoge
    end
    @nodes = @nodes.sort { |x,y| x.order <=> y.order }
  end

  # def nodes_to_md
  #   @chapters = Chapter.includes(:quotations, :headings, :codes, :urls).find(params[:id])
  #   @nodes = []
  #   @heads  = @chapters.headings
  #   @codes  = @chapters.codes
  #   @quotes = @chapters.quotations
  #   @urls   = @chapters.urls

  #   @codes.each do |hoge|
  #     hoge.content = "\n```\n#{hoge.content}\n```\n"
  #     @nodes.push hoge
  #   end
  #   @heads.each do |hoge|
  #     hoge.content = "\n###{hoge.content}\n"
  #     @nodes.push hoge
  #   end
  #   @quotes.each do |hoge|
  #     hoge.content = "\n>#{hoge.content}\n"
  #     @nodes.push hoge
  #   end
  #   @urls.each do |hoge|
  #     hoge.content = "\n#{hoge.content}\n"
  #     @nodes.push hoge
  #   end
  #   @nodes = @nodes.sort { |x,y| x.order <=> y.order }
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chapter
      @chapter = Chapter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chapter_params
      params[:chapter]
    end
end
