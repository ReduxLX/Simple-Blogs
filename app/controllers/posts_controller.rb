class PostsController < ApplicationController
    def index 
        # Post.all allows us to show all posts in the main page
        @posts = Post.all
    end
    def show
        # Show the specific post passed in by using the id parameter
        @post = Post.find(params[:id])
    end
    def new
        # To get the error handling to work, we need a post reference to the new post created
        @post = Post.new
    end
    def create
        # Below outputs <ActionController::Parameters {"title"=>"<input_title>", "body"=>"<input_body>"} permitted: false>
        # This proves that the data enterred in the new posts page is being sent back properly
        # render plain: params[:post].inspect

        @post = Post.new(post_params)
        # Call save method to actually save and redirect to the post created (load show view)
        # After implementing field constraints in post.rb (model), we need to check if
        # post is actually saved before redirecting to home page else if not then just re-render the page
        if (@post.save)
            redirect_to @post
        else
            # Reloads the current page (new.html)
            render 'new'
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_path
    end

    # Used to implement the edit button for show page's html
    def edit
        # Same as show action, we need to find the specific post to edit
        @post = Post.find(params[:id])
    end

    # Update existing posts, called from edit.html.erb
    def update
        # Copy & Paste from show & create actions
        @post = Post.find(params[:id])
        # Instead of @post.save, its gonna be @post.update(post_params)
        if (@post.update(post_params))
            redirect_to @post
        else
            # Reloads the current page (edit.html)
            render 'edit'
        end
    end

    private def post_params
        # Only take in a title and a body
        params.require(:post).permit(:title, :body)
    end
end
