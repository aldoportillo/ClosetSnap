class ItemcategoriesController < ApplicationController
  def index
    matching_itemcategories = Itemcategory.all

    @list_of_itemcategories = matching_itemcategories.order({ :created_at => :desc })

    render({ :template => "itemcategories/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_itemcategories = Itemcategory.where({ :id => the_id })

    @the_itemcategory = matching_itemcategories.at(0)

    render({ :template => "itemcategories/show" })
  end

  def create
    the_itemcategory = Itemcategory.new
    the_itemcategory.category_id = params.fetch("category_id")
    the_itemcategory.item_id = params.fetch("item_id")

    if the_itemcategory.valid?
      the_itemcategory.save
      redirect_to("/item/#{the_itemcategory.item_id}", { :notice => "Itemcategory created successfully." })
    else
      redirect_to("/itemcategories", { :alert => the_itemcategory.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_itemcategory = Itemcategory.where({ :id => the_id }).at(0)

    the_itemcategory.category_id = params.fetch("query_category_id")
    the_itemcategory.item_id = params.fetch("query_item_id")

    if the_itemcategory.valid?
      the_itemcategory.save
      redirect_to("/item/#{the_itemcategory.item_id}", { :notice => "Itemcategory updated successfully."} )
    else
      redirect_to("/itemcategories/#{the_itemcategory.id}", { :alert => the_itemcategory.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_itemcategory = Itemcategory.where({ :id => the_id }).at(0)

    the_itemcategory.destroy

    redirect_to("/itemcategories", { :notice => "Itemcategory deleted successfully."} )
  end
end
