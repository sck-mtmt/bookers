class BooksController < ApplicationController
  def new
    @book=Book.new
  end

  def create
    @book=Book.new(book_params)
    if @book.save
     flash[:notice]="Book was successfully created"
     redirect_to book_path(@book.id)
    else
     flash[:alret]="Book was not created"
     @books=Book.all
     render :index
    end
  end

  def index
    @books=Book.all
    @book=Book.new
  end

  def show
    @book= Book.find(params[:id])
  end

  def edit
    @book= Book.find(params[:id])
  end

  def destroy
    book= Book.find(params[:id])
    Book.destroyd(book_params)
    book.destroy
    if @book.save
     redirect_to book_path(@book.id)
    else
     flash.now="Book Was Successfully Destroyd"
     render :edit
    end
  end

  def update
    book= Book.find(params[:id])
    book.update(book_params)
    if @book.save
     redirect_to edit_book_path(book.id)
    else
     flash.now="Book Was Successfully Updated"
     render :edit
    end
  end


  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
