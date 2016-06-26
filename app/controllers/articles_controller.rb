class ArticlesController < ApplicationController
    
    # execute set_article method before executing actions
        before_action :set_article, only: [:edit, :update, :show, :destroy]
        
    #add index/listing action
    
    def index
        @articles = Article.all
        
    end
    
    
    def new
        @article = Article.new
        
    end
    
    def create
        
        @article = Article.new(article_params)
        @article.user = User.first
       
        if @article.save
            
           #do something
           
           flash[:success] = "Article was successfully created"
           
           redirect_to article_path(@article)
           
        else
        
            render 'new'
        
        end    
        
    end
    
    def show
      
        
    end  
    
    def destroy
    
    @article.destroy
    
    redirect_to articles_path
    flash[:danger]= "Article was successfully deleted!"
    end
    
    #create edit action to edit articles
    
    def edit
        
    
    end
    
    #create update action to submit update to database
    
    def update
        
        
        if @article.update(article_params)
           
            flash[:success] = "Your article has been successfully updated"
            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end
    
    
    
    
    private
    
        def article_params
            params.require(:article).permit(:title, :description)
        end    
    
    
    def set_article
        @article= Article.find(params[:id])
    end
    
end     