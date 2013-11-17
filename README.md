##IMG's Ruby on Rails Bootcamp Guide
=======

###Quick Links
-------
####Ruby Links
* [LearnXinY for Ruby](http://learnxinyminutes.com/docs/ruby/)
* [LearnXinY for Ruby Environment/Setup](http://learnxinyminutes.com/docs/ruby-ecosystem/)
* [Ruby Documentation](https://www.ruby-lang.org/en/documentation/)

####Rails Links
* [Rails Book](http://ruby.railstutorial.org/ruby-on-rails-tutorial-book) Really good introduction to Rails and backend web development in general. Today we are effectively completing Chapters 1 & 2.
* [Rails Guides](http://guides.rubyonrails.org/)
* [Rails Documentation](http://api.rubyonrails.org/)

####Other Gems (i.e. Packages) & Useful Tools
* [RVM](https://rvm.io/) Ruby Version Manager, installs and switches between rubies. RVM also has the concept of gemsets to isolate projects' environments completely.
* [RubyGems](http://guides.rubygems.org/) Software used to manage what Ruby Packages/Libraries (called gems) are installed.
* [Bundler](http://bundler.io/) Gem dependency resolver.
* [Git](http://git-scm.com/book) Version control software.
* [Heroku](https://www.heroku.com/) A cloud application platform that makes it really easy to deploy applications. Deployin basic apps for testing is free.

####Nitrous.io
A cloud development environment, i.e. you program from any browser or terminal on a server located somewhere else.

* [Nitrous.io](https://www.nitrous.io)
* [Nitrous.io sign-up referral link to get N20, which can be turned in for extra ram or space](https://www.nitrous.io/join/qC8ddqET1Ak)

We're using this for two reasons:

1. Getting Ruby and Rails setup properly on Windows is a non-trivial task and this gives an Ubuntu box with a lot of stuff we need already installed 
2. This way all the setup we do today doesn't just apply to the lab computer you happen to be on.

If you would like to setup ruby on your own machine I recommend reading through [this guide](http://ruby.railstutorial.org/ruby-on-rails-tutorial-book#sec-up_and_running), which offers various recommendations for Linux, Mac, and Windows machines, 

###Ruby/Rails Setup
-------
We're going to use a Nitrous.io Ruby box, which should come pre installed with Ruby, RVM, and RubyGems. If you want to do this on your own machine, look into [this section of the Rails book.](http://ruby.railstutorial.org/ruby-on-rails-tutorial-book#sec-up_and_running)

1. [Create a Nitrous.io account](https://www.nitrous.io/join/qC8ddqET1Ak)
2. Build a Ruby Box on the East Coast (you can adjust the settings later)
3. After it provisions the box it should pop up the IDE. In Rails programming a lot of work is done in the terminal, so some useful Nitrous shortcuts are:
  * Swap full screen terminal: Ctrl Shift F
  * Swap cursor focus from terminal to ide: Ctrl Shift C
5. Check the Ruby version, it should be 2.0.0psomething
    
    <pre>ruby -v</pre>

4. RVM is a nice way to swap between different versions of Ruby. It should be installed, to check in the terminal run:

    <pre>rvm -v</pre>

  This should output: rvm, followed by the version number and some other stuff.
  
  If you ever get lost in terminal, try running help or --help
  
    <pre>rvm help
  rvm gemset help</pre>
  
  This will tell you what commands and parameters are available.
6. 

###Getting Started with Ruby
-------

###Ruby Exercise
-------

###Getting Started with Rails
-------

###Rails Exercise
-------

1. Create a new directory for the app with: make directory

    <pre>mkdir name_of_your_app</pre>

2. Move into that directory with: change directory

    <pre>cd name_of_your_app</pre>
    
3. Create a new rails app

    <pre>rails new</pre>
    
4. Take a look at what this generated for us with: list (ls) all (-a) in a list format (-l)

    <pre>ls -al</pre>
    
5. Update the gemfile
6. While we haven't written any new code yet, rails gives us a very basic app to start with. To run this app type:

    <pre>rails server</pre>
    
    or
    
    <pre>rails s</pre>
    
  This will take a few seconds, but it should eventually output something like:
  
    <pre>=> Rails 4.0.1 application starting in development on http://0.0.0.0:3000</pre>
  
  This tells you what port it is running on, in my case that's Port 3000. To preview the app, in Nitrous click on the Preview menu-item and select the appropriate port. This will open up a new tab with the default page of the application.

7. To make a data model with create, read, update, and delete functionality we can use rails generate scaffold command. For a simple User model we want a unique Id (an integer), a username (a string), and an email (a string). Rails gives us a unique id by default so the final command would be:

    <pre>rails generate scaffold User name:string email:string</pre>
    
8. This gives us a lot of code and pages, but to make it work we must update (migrate) the database to reflect the new model. To do this use rake, a gem that should already be installed as a rails dependency.
    
    <pre>rake db:migrate</pre>
    
9. Now try running the app again, at the end of the url type /users . From here we can create a new user, edit existing ones, show a users individual page, and delete the user.

10. That's cool, but what can these users do? Let's make a post resource, it should have a unique id (again provided), content (a string), and a user_id (integer) that connects to the user that created it.

    <pre>rails generate scaffold Post content:string user_id:integer</pre>
    
    And again migrate the database.
    
    <pre>rake db:migrate</pre>
    
11. Now we have users and posts, but they aren't connected. To connect them we set the user model so that it has_many posts, and that the posts belongs_to a user.

    Modify app/models/user.rb to
    <pre>class User < ActiveRecord::Base
      has_many :microposts
    end</pre>
    
    Modify app/models/post.rb to
    <pre>class Post < ActiveRecord::Base
      belongs_to :user
    end</pre>

12. This changed the way the model works internally (for instance in the rails console you can now query a user_name.post and get the posts), but there is nothing forcing a post to have a user. To do this we need to validate the users existence before creation. Rails has the functionality to make this really easily:

    Add this line to the Post model class, in app/models/post.rb
    <pre>validates :user, presence: true</pre>
    
    The user is represented internally as a symbol (for performance reasons), presence is an attribute of the user. So now before a post is created it checks to make sure the user associated with it still exists.

14. To make this easier to visualize and get some experience with editing views, lets add a column to the index of User and Post to show their id, something scaffolding doesn't show by default. 

    Browse to app/views/users/index.html.erb and add a table header:
    <pre><th>id</th></pre>
    Above the name and email table headers. Then add the data below:

13. To experiment with rails validation let's limit each post to no more than 100 characters.

    Add this to your Post model:
    <pre>validates :content, length: { maximum: 100 }</pre>