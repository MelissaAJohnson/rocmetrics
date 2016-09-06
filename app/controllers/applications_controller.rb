class ApplicationsController < ApplicationController
  def index
    @app = Application.all
  end

  def show
    @app = Application.find(params[:id])
    @events = @app.events.group_by(&:name)
  end

  def new
    @app = Application.new
  end

  def create
    @app = Application.new
    @app.name = params[:application][:name]
    @app.url = params[:application][:url]

    if @app.save
      flash[:notice] = "Application was saved successfully."
      redirect_to @app
    else
      flash.now[:alert] = "There was an error saving the application. Please try again."
      render :new
    end
  end

  def edit
    @app = Application.find(params[:id])
  end

  def update
    @app = Application.find(params[:id])
    @app.name = params[:application][:name]
    @app.url = params[:application][:url]

    if @app.save
      flash[:notice] = "Application was updated successfully."
      redirect_to @app
    else
      flash.now[:alert] = "There was an error saving the Application. Please try again."
      render :edit
    end
  end

  def destroy
    @app = Application.find(params[:id])
    if @app.destroy
      flash[:notice] = "\"#{@app.name}\" was successfully unregistered."
      redirect_to applications_path
    else
      flash.now[:alert] = "There was an error unregistering the application."
      render :show
    end
  end
end
