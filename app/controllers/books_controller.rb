class BooksController < ApplicationController

  def index
    @book = Book.new
    # List.allはテーブルに保存されたデータを全取得する
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    # ビューページーに情報を渡すときに@インスタン変数を使う
    @book = Book.find(params[:id])
    # book_paramsはストロングパラメータを参照
    if @book.update(book_params)
      # book_path(@book.id)をURLで表示させると/books/1,2,3...となる
      # book_path = /books 固定
      # (@book:id) = /1,2,3 showの@book = Book.find(params[:id])を参照している
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    # destroyは消すだけの処理のためローカル変数で良い
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to '/books'  # 投稿一覧画面へリダイレクト
  end

   private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
