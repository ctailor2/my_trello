class Boards < Base
  resource :boards do
    before do
      authenticate!
    end

    desc 'create board'
    params do
      requires :board, type: Hash do
        requires :name, type: String
      end
    end
    post '' do
      present current_user.boards.create!(declared(params).board)
    end

    desc 'get all boards'
    get '' do
      present current_user.boards
    end
  end
end

