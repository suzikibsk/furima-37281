class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  #before_action :set_item, only: :show
  
  
  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  #def destroy
  #  item = Item.find(params[:id])
  #  item.destroy
  #end

  #def edit
  #end

  #def update
  #  @item.update(item_params)
  #  # バリデーションがOKであれば詳細画面へ
  #  if @item.valid?
  #    redirect_to item_path(item_params)
  #  else
  #    # NGであれば、エラー内容とデータを保持したままeditファイルを読み込み、エラーメッセージを表示させる
  #    render 'edit'
  #  end
  #end

  #def show
  #end

  private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :category_id, :item_status_id, :shipping_cost_id, :region_id, :shipping_date_id, :price).merge(user_id: current_user.id)
  end

  #def set_item
  #  @item = Item.find(params[:id])
  #end
end