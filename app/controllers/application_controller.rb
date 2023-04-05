class ApplicationController < ActionController::Base
    before_action :set_notifications, if: :current_user

    private 

    def set_notifications
        #checking notifications where our user was recipient, of those we want to grab 
        #the newest first, limiting by 9 ∴ we're only getting first 9
        notifications = Notification.where(recipient: current_user).newest_first.limit(9)
        @unread = notifications.unread
        @read = notifications.read
    end
end
