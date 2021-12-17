# High Score

Simple API web app that store user's scores built in Rails.

## Commands

### Prerequisites

```
# Clone this repository
cd high_score
bundle install
rails db:setup

# Start web app
rails s
```

## Routes

```
  scores
    GET   /scores       scores#index    Query score list with customised query
    POST  /scores       scores#create   Create a score record
    GET   /scores/:id   scores#show     Query score record
    DELETE /scores/:id  scores#destroy  Delete score record
  users
    GET   /users        users#index     Query user list 
    GET   /users/:id    users#show      Query user record
```