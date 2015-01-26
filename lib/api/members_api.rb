class Members_API < Grape::API
  resource "members" do

    # ex) http://localhost:3000/api/v1/books
    desc "returns all members"
    get do
      Member.all
    end

    desc "return a member"
    params do
      requires :id, type: Integer
      optional :title, type: String
    end
    # http://localhost:3000/api/v1/books/{:id}
    get ':id' do
      Member.find(params[:id])
    end

    params do
      requires :name, type: String
      requires :password, type: String
    end
    post '/' do
      Member.create!({
        name: params[:name],
        password: params[:password]
      })
    end
  end
end


