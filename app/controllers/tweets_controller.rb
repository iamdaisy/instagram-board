class TweetsController < ApplicationController

  # 유저가 login되있는지 안되있는지 체크부터 함(로그인 안되있으면 액션 허용 못하도록)
  before_action :authenticate_user!, except: [:index, :show]

  before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  def index
    @tweets = Tweet.order(id: :desc).page(params[:page]) #kaminari사용해서 page nation
                    #    :id => :desc (desc 옮션까지 넣겠다.)
  end

  def new
    @tweet = Tweet.new

  end

  def create
    # @tweet = Tweet.new(
    #   title: params[:tweet][:title],
    #   content: params[:tweet][:content]
    # )
    # @tweet.save
    Tweet.create(tweet_params()) # strong parameter


    redirect_to tweets_path
  end

  def show
  end

  def edit
  end

  def update
    @tweet.update(tweet_params())
    redirect_to tweet_path(@tweet)

  end

  def destroy
    @tweet.destroy
    redirect_to tweets_path
  end

  private
  def set_tweet()
    @tweet = Tweet.find(params[:id])
  end

  private
  def tweet_params()
     params.require(:tweet).permit(:title, :content, :user_id, :photo_url)
  #   params[:tweet][:title]
  #   params[:tweet][:content]   # white listing 내가 받을것만 명시하는것
  end

end
