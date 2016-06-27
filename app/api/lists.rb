class Lists < Base
  before do
    authenticate!
  end

  namespace :boards do
    route_param :board_id do
      resource :lists do
        desc 'create list'
        params do
          requires :list, type: Hash do
            requires :name, type: String
          end
        end
        post do
          board = current_user.boards.find(params[:board_id])
          present board.lists.create(declared(params).list)
        end
      end
    end
  end
end

