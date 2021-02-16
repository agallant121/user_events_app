# Event Receiving App

Hello! Below I will describe the steps to complete the `curl` calls based in the directions put forth to me. 
- We will use this format for the `POST` calls: 

`curl -X POST --header 'Content-Type: application/json' --data '{"event" : {"name" : "test button", "event_type" : "click", "at" : "2020-06-12T00:00:01", "button_color" : "red" }}' 'https://event-receiving-app.herokuapp.com/api/v1/user_events'`.

## Requests:
- Should only be made in the format sent using `key/value` pairs, whatever they may be, and not individual, random strings. 
- I was following this direction for that decision: `"The database should store the entire blob no matter what keys/values it contains."`

- I also setup an `index` call for all `user_events` if you'd like to see correctly posted calls be added. 
- Use this to see all user events: `curl 'https://event-receiving-app.herokuapp.com/api/v1/user_events'`.

- I also have a `show` call so you can append a `/5` or any valid id to see an individual `user_event`. 
- Example show: `curl https://event-receiving-app.herokuapp.com/api/v1/user_events/5`.

## Stats (BONUS)
- If you'd like to see the bonus question, `"endpoint for todays stats"`, use `curl 'https://event-receiving-app.herokuapp.com/api/v1/stats'`.
- I stuck with the `user_events` of `click` and `view`, like in the example. 

## Testing
- You will find I made a spec file for the post requests as well as and index and show requests. 
- I left comments on the `files changed` to try and guide you through my thinking.

## Object
- You will notice the `UserEvent` object has the `event_type` pulled out as an attribute. 
- I chose to do this so I could manipulate that information later on for the bonus question in an easier way.
- This decision is why I do not have something like `params.permit(xyz)` as a private method in the controller.
- I wanted to keep it simple and I think my refactoring in both my tests and controllers have made for an easy-to-follow read/understanding of my work.

## All links in one place:
- Main app to be posted to/see added objects: `https://event-receiving-app.herokuapp.com/api/v1/user_events`
- Index view to see individual objects: `https://event-receiving-app.herokuapp.com/api/v1/user_events/5`
- BONUS to see stats from last 24 hours: `https://event-receiving-app.herokuapp.com/api/v1/stats`
