class ItemsController < ApplicationController
  
  before_action :require_user_logged_in
  
  def new
    @items =[]
    
    @keyword = params[:keyword]
    if @keyword.present?
    results = RakutenWebService::Ichiba::Item.search({
      keyword: @keyword,
      imageFlag:1,
      hits:20,
    })
    
    results.each do |result|
      # 扱い易いように Item としてインスタンスを作成する（保存はしない）
      #item = Item.new(read(result))↓へ修正
      
      item = Item.find_or_initialize_by(read(result))
      @items << item
     end
    end
  end
  
  def show
    @item = Item.find(params[:id])
    @want_users = @item.want_users
    @have_users = @item.have_users
  end
  
end

#items_controller.rb から application_controller.rb へ def read は移動された