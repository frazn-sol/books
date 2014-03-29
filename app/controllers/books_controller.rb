class BooksController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  skip_before_filter :authenticate_user!, only: [:file_send]
  # GET /books
  # GET /books.json
  def index
    @books = current_user.books
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    respond_to do |format|
      if @book.save
        somefile = File.open(@book.book_file_name+".txt", "w")
        reader = PDF::Reader.new("public"+@book.book.url(:original,false))
          reader.pages.each do |page|
          somefile.puts(page.text)
        end
        @book.update_attribute(:text_file, somefile)
        somefile.close
        format.html { redirect_to books_path, notice: 'Book was successfully created.' }
        format.json { render action: 'show', status: :created, location: @book }
      else
        format.html { render action: 'new' }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url }
      format.json { head :no_content }
    end
  end

  def pdf
    @rich = Rich.new
  end

  def pdf_save
    @rich = Rich.new(rich_params)
    @rich.save
    redirect_to books_path
  end

  def file_send
    @file = Rich.last
    send_file "public"+@file.doc.url(:original,false), :type=>"application/pdf", :x_sendfile=>true 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:text_file, :image, :title, :description, :book_text, :book, :user_id)
    end

    def rich_params
      params.require(:rich).permit(:doc)
    end
end
