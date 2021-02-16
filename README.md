# Event Receiving App

Hello! Below I will describe the steps to complete the `curl` calls based in the directions put forth to me. 
- We will use this format for the `POST` calls: `curl -X POST --header 'Content-Type: application/json' --data '{"event" : {"name" : "test button", "event_type" : "click", "at" : "2020-06-12T00:00:01", "button_color" : "red" }}' 'https://event-receiving-app.herokuapp.com/api/v1/user_events'`.

- Requests should only be made in the format sent using `key/value` pairs, whatever they may be, and not individual, random strings. 
- I was following this direction for that decision: "The database should store the entire blob no matter what keys/values it contains."

- I also setup an `index` call for all `user_events` if you'd like to see correctly curled calls be added. 
- Use this to see all user events: `curl 'https://event-receiving-app.herokuapp.com/api/v1/user_events'`.



