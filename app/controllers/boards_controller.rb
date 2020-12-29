class BoardsController < ApplicationController
    def index
    end

    def show
      @board = Board.find(params[:id])
    end

    def new
      @board = current_user.boards.build
    end

    def create
      @board = current_user.boards.build
      if @board.save
        redirect_to board_path(@board)
      else
        flash.now[:errow] = '保存に失敗しました'
        render new
      end
    end
end