So far:
  - **04/10/23:** noticed comments weren't visible, will need to do some reformatting later
  - Friendly gem for human readable URL slugs
  - Bootstrap components
  - Devise for user accounts and authentication
  - Displays Post views
  - Can only create Posts if authorized User
  - Fixed comment editing bugs
  - Dropdown and Navbar reflect whether a User is logged in
  - Stimulus with Turbo
  - Notice gem for notifications
  - [Ransack gem for search functionality] 
  - 04/06/23: have spent multiple hours attempting to
    troubleshoot the problems that I'm having with Ransack. 
    
    Getting this error returned:
    
      Ransack needs Post attributes explicitly allowlisted as
      searchable. Define a `ransackable_attributes` class method in your `Post`
      model, watching out for items you DON'T want searchable (for
      example, `encrypted_password`, `password_reset_token`, `owner` or
      other sensitive information).
      
    with suggestions on how to fix it. I've implemented numerous changes, have gone through 
    Ransack's documentation, etc., can't seem to find a fix and have spent too much time on
    it. Will attempt to implement another form or search, possibly with hotwire. Not sure yet.
    
    *Update* 04/07/23: didn't switch from ransack because I was able to implement a fix by adding         the  'ransackable_attributes' method. However, I ran into some problems with implementing           searchable entities. Searching isn't completely fixed (only works on titles currently) but         will be expanded later on
    
  - Admin page for viewing all Posts, Comments, Users
