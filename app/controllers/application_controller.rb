class ApplicationController < ActionController::Base
    before_action :set_notifications, if: :current_user
    #set_query is being set here since we want search functionality 
    #through out the application and not just on one page
    before_action :set_query

    def set_query
        @query = Post.ransack(params[:q])
    end

    def set_search
        @query = Post.search(params[:q])
    end

    private 


   
    

    def set_notifications
        #checking notifications where our user was recipient, of those we want to grab 
        #the newest first, limiting by 9 ∴ we're only getting first 9
        notifications = Notification.where(recipient: current_user).newest_first.limit(9)
        @unread = notifications.unread
        @read = notifications.read
    end
end
