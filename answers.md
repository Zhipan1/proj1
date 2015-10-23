# Q0: Why is this error being thrown?

Pokemon class doen't exist yet

# Q1: How are the random Pokemon appearing? What is the common factor between all the possible Pokemon that appear?

randomly selecting from an array of trainerless pokemon

# Question 2a: What does the following line in the help text do? Be specific about what "capture_path(id: @pokemon)" is doing. If you're having trouble, look at the Help section in the README.

redirect you to /capture?id=5 which is routed to the capture method in pokemond

# Question 3: What would you name your own Pokemon?

Donald Trump

# Question 4: What did you pass into the redirect_to? If it is a path, what did that path need? If it is not a path, why is it okay not to have a path here?

redirect_to :back takes you back to where you came from. The path is in the url already.

# Question 5: Explain how putting this line "flash[:error] = @pokemon.errors.full_messages.to_sentence" shows error messages on your form.

if @pokemon is not valid, then there exists errors. full_messages.to_sentences translates those erros into human readable form, which is then stored in flash[:error] to be show on the next page load.

# Give us feedback on the project and decal below!

OMG LOVE THIS PROJECT. LEARNED SO MUCH!

# Extra credit: Link your Heroku deployed app
https://enigmatic-tundra-3391.herokuapp.com
