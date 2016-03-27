class RecipesController < ApplicationController
	
	before_action :get_recipe, only: [:show,:edit,:update,:destroy]

	def index
		@recipes = Recipe.all.order(created_at: :desc)
	end

	def show
	end

	def new
		@recipe = Recipe.new
	end

	def create
		@recipe = Recipe.new(recipe_params)
		if @recipe.save
			redirect_to @recipe
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @recipe.update(recipe_params)
			redirect_to @recipe
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
			params.require(:recipe).permit(:title,:description)
		end

		def get_recipe
			@recipe = Recipe.find(params[:id])
		end

end
