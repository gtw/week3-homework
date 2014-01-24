Dice::Application.routes.draw do

  get("/start", {:controller => "dice", :action => "start"})
  get("/first_roll", {:controller => "dice", :action => "first_roll"})
  get("/in_progress", {:controller => "dice", :action => "roll_with_goal_set"})

end
