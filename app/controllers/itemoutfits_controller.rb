class ItemoutfitsController < ApplicationController
  def index
    matching_itemoutfits = Itemoutfit.all

    @list_of_itemoutfits = matching_itemoutfits.order({ :created_at => :desc })

    render({ :template => "itemoutfits/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_itemoutfits = Itemoutfit.where({ :id => the_id })

    @the_itemoutfit = matching_itemoutfits.at(0)

    render({ :template => "itemoutfits/show" })
  end

  def create
    the_itemoutfit = Itemoutfit.new
    the_itemoutfit.item_id = params.fetch("query_item_id")
    the_itemoutfit.outfit_id = params.fetch("query_outfit_id")

    if the_itemoutfit.valid?
      the_itemoutfit.save
      redirect_to("/itemoutfits", { :notice => "Itemoutfit created successfully." })
    else
      redirect_to("/itemoutfits", { :alert => the_itemoutfit.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_itemoutfit = Itemoutfit.where({ :id => the_id }).at(0)

    the_itemoutfit.item_id = params.fetch("query_item_id")
    the_itemoutfit.outfit_id = params.fetch("query_outfit_id")

    if the_itemoutfit.valid?
      the_itemoutfit.save
      redirect_to("/itemoutfits/#{the_itemoutfit.id}", { :notice => "Itemoutfit updated successfully."} )
    else
      redirect_to("/itemoutfits/#{the_itemoutfit.id}", { :alert => the_itemoutfit.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_itemoutfit = Itemoutfit.where({ :id => the_id }).at(0)

    the_itemoutfit.destroy

    redirect_to("/itemoutfits", { :notice => "Itemoutfit deleted successfully."} )
  end
end
