class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles' do
    @articles=Article.all
    erb :index
  end

  get '/articles/new' do
    erb :new
  end

  get '/articles/:id' do
    @article=Article.find(params[:id])
    erb :show
  end

  post '/articles' do
    attrs = params
    @article=Article.create(attrs)

    redirect to "/articles/#{@article.id}"

  end


  get '/articles/:id/edit' do
    id = params[:id]
    @article=Article.find_by(id: id)
    erb :edit
  end

  patch '/articles/:id' do
    @article=Article.find(params[:id])
    @article.update(title: params[:title], content: params[:content])

    redirect to "/articles/#{@article.id}"
  end

  delete '/articles/:id' do
    id = params[:id]
    Article.destroy(id)
    redirect to "/articles"
  end

end






