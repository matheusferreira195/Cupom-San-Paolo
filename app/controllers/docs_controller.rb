class DocsController < ApplicationController
  before_action :find_doc, only: [:show, :edit, :update, :destroy]

  def index
    @docs = Doc.where(user_id: current_user)
  end

  def show

  end

  def new
    @doc = current_user.docs.build
  end

  def create
    @doc = current_user.docs.build(doc_params)

    if @doc.save
      redirect_to @doc
    else
      render 'new'
    end

  end

  def edit
  end

  def update
    if @doc.update(doc_params)
      check = Doc.where(title: doc_params[:title]).count()
      if check > 1
        render 'erro'
      else
        render 'novo'
      end

    end
  end

  def destroy
    @doc.destroy
    redirect_to docs_path
  end

  private

    def find_doc
      @doc = Doc.find(params[:id])
    end

    def doc_params
      params.require(:doc).permit(:title, :content)
    end

end
