class PostsController < ApplicationController
  def index
    # @welcome_msg = "Hola Amigo!"
    # @posts = PostsController.allposts
    @posts = Post.all
  end

  def create
    # params is the hash that the information submitted.
    @params = params
    # @title = params["title"]
    # @body = params["body"]

    @mypost = Post.new
    # [:post] is the class name, for tasklist, it is task.
    @mypost.title = params[:patch][:title]
    @mypost.author = params[:patch][:author]
    @mypost.body = params[:patch][:body]
    @mypost.save


  end

  def update
    @mypost = Post.find(params[:id].to_i)

    @mypost.title = params[:post][:title]
    @mypost.author = params[:post][:author]
    @mypost.body = params[:post][:body]
    @mypost.save
    # @posts = PostsController.allposts
    # @mypost = nil
    #
    # @posts.each do |post|
    #   number = params[:id].to_i
    #   if post[:id] == number
    #     @mypost = post
    #   end
    # end
    #
    # if @mypost == nil
    #   @mypost = {id: params[:id].to_i, title: "The Blog was not found",
    #       body: "" }
    # end
    #
    # @mypost[:title] = params["title"]
    # @mypost[:author] = params["author"]
    # @mypost[:body] = params["body"]

  end


  def show
    @mypost = Post.find(params[:id].to_i)
    # @posts = PostsController.allposts
    # @mypost = nil
    #
    # @posts.each do |post|
    #   number = params[:id].to_i
    #   if post[:id] == number
    #     @mypost = post
    #   end
    # end
    #
    # if @mypost == nil
    #   @mypost = {id: params[:id].to_i, title: "The Blog was not found",
    #       body: "" }
    # end
  end

  def new
    @mypost = Post.new
  end

  def edit
    @mypost = Post.find(params[:id].to_i)
    # @posts = PostsController.allposts
    # @mypost = nil
    #
    # @posts.each do |post|
    #   number = params[:id].to_i
    #   if post[:id] == number
    #     @mypost = post
    #   end
    # end
    #
    # if @mypost == nil
    #   @mypost = {id: params[:id].to_i, title: "The Blog was not found",
    #       body: "" }
    # end
  end

  def destroy
    @mypost = Post.destroy(params[:id].to_i)
  end

  # def self.allposts
  #
  #   [
  #     {id: 1, title: "My First Blog Post",
  #       author: "Dave Matthews",
  #       body: "Loren Ipsem"},
  #     {id: 2, title: "My Second Blog Post",
  #       author: "Dave Matthews",
  #       body: "This is the body"},
  #     {id: 3, title: "My Third Blog Post",
  #       author: "Dave Matthews",
  #       body: "I get seen around Seattle all the time"}
  #   ]
  # end

  private
   def post_params
     params.require(:post).permit(:title, :author, :body)
   end

end
