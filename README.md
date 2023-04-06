So far:
  - Bootstrap components
  - Devise for user accounts and authentication
  - Displays post views
  - Can only create posts if authorized user
  - Fixed comment editing bugs
  - Dropdown and navbar reflect if a user is logged in or not
  - Stimulus with Turbo
  - Notice gem for notifications
  - [Ransack gem for search functionality] 04/06/23: have spent multiple hours attempting to
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
