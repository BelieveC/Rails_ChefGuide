class RecipesController < ApplicationController
	
	before_action :get_recipe, only: [:show,:edit,:update,:destroy]
	before_action :authenticate_user!, except:[:show,:index]
	def index
		@recipes = Recipe.all.order(created_at: :desc)
	end

	def show
	end

	def new
		@recipe = current_user.recipes.build
	end

	def create
		@recipe = current_user.recipes.build(recipe_params)
		if @recipe.save
			redirect_to @recipe,notice: "Successfully created the Recipe!"
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @recipe.update(recipe_params)
			redirect_to @recipe,notice:"Successfully updated the Reccipe!"
		else
			render 'edit'
		end
	end

	def destroy
		@recipe.destroy
		redirect_to root_path
	end

	private
		def recipe_params
			params.require(:recipe).permit(:title,:description,:image,ingredients_attributes:[:id,:name,:_destroy],directions_attributes:[:id,:step,:_destroy])
		end

		def get_recipe
			@recipe = Recipe.find(params[:id])
		end

end
