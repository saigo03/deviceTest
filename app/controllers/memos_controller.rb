class MemosController < ApplicationController
  def index
    if params[:tag_id].present?
      # 単一のタグIDに基づいてメモをフィルタリング
      @memos = Memo.joins(:tags).where(tags: { id: params[:tag_id] }).distinct
    elsif params[:search].present?
      # テキストでの検索
      @memos = current_user.memos.where("title LIKE ?", "%#{params[:search]}%")
    else
      # すべてのメモを表示
      @memos = current_user.memos
    end
  end

  def show
    @memo = Memo.find(params[:id])
  end

  def new
    @memo = Memo.new
  end

  def create
    @memo = current_user.memos.new(memo_params)
    if @memo.save
      redirect_to @memo
    else
      render :new
    end
  end


  def edit
    @memo = Memo.find(params[:id])
  end

  def update
    @memo = Memo.find(params[:id])
    if @memo.update(memo_params)
      redirect_to @memo
    else
      render :edit
    end
  end

  def destroy
    @memo = Memo.find(params[:id])
    @memo.destroy
    redirect_to memos_path
  end

  private

  def memo_params
    params.require(:memo).permit(:title, :content, tag_ids: [])
  end
end
