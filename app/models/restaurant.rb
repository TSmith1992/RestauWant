class Restaurant < ActiveRecord:: Base
    belongs_to :user
    has_many :jobs

    # def get_id
    #     user.id
    # end
end