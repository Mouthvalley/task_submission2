class BooksController < ApplicationController

  def index
    @books = Book.new
    # List.allはテーブルに保存されたデータを全取得する
    @books = Book.all
  end

  def create
     # １.&2. データを受け取り新規登録するためのインスタンス作成
    book = Book.new(book_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    book.save
    # 4. トップ画面へリダイレクト
    redirect_to '/books'
  end

  def show
    @books = Book.find(params[:id])
  end

  def edit
  end

   private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
