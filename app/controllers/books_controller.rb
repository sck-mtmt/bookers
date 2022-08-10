class BooksController < ApplicationController
  def new
    @book=Book.new
  end

  def create
    @books=Book.all
    @book=Book.new(book_params)
    if @book.save
     flash[:notice]="Book was successfully created"
     redirect_to book_path(@book.id)
    else
     flash.now[:alert]="error"
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
    @book= Book.find(params[:id])
    if @book.destroy
     flash[:notice]="Book aas successfully destroyd"
     redirect_to books_path
    end
  end

  def update
    @books=Book.all
    @book= Book.find(params[:id])
    @book.update(book_params)
    if @book.save
     flash[:notice]="Book was successfully updated"
     redirect_to book_path(@book.id)
    else
     flash.now[:alert]="error"
     render :show
    end
  end


  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
