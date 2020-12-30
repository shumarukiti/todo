class BoardsController < ApplicationController
    def index
      @boards = Board.all
    end

    def show
      @board = Board.find(params[:id])
    end

    def new
      @board = current_user.boards.build
    end

    def create
      @board = current_user.boards.build(board_params)
      if @board.save
        redirect_to board_path(@board)
      else
        flash.now[:errow] = '保存に失敗しました'
        render new
      end
    end

    def edit
      @board = current_user.boards.find(params[:id])
    end

    def update
      @board = current_user.boards.find(params[:id])
      if @board.update(board_params)
        redirect_to board_path(@board), notice: '更新できました'
      else
        flash.now[:error] = '更新できませんでした'
      end
    end

    def destroy
      board = current_user.boards.find(params[:id])
      board.destroy!
      redirect_to boards_path
    end

    private
    def board_params
      params.require(:board).permit(:name, :overview)
    end
end