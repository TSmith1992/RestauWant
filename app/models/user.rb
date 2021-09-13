class User < ActiveRecord:: Base
    belongs_to :hiringcheck
    has_many :restaurants
    has_many :userjobs
    has_many :jobs, through: :userjobs
end
