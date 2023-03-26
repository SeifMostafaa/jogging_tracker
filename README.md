## Tech Stack
- Language: Ruby 3.1.2
- Framework: Rails 7.0.4.3
- DB: SQLite
- Authentication: Api Guard

## Prerequisites

- Ruby 3.1.2
- Rails 7.0.4.3

## Getting Started

- Fork Repo
- Install bundle by running ```bundle install```
- ```rails db:migrate```
- ```rails db:seed```
- ```rails s```



## API Reference

### Endpoints

#### POST /users/sign_up

* General: Creating new user
* Message body:
```
  {
      "email": "seif@swiftx.com",
      "password": "seif123456",
      "password_confirmation": "seif123456"
  }    
```
* Return:
  ```
  {
      "status": "success",
      "message": "Signed up successfully"
  }
   ```
* Make sure to use the token as Bearer authenticity token


#### POST /users/sign_in

* General: Logging an existing user
* Message body:
```
  {
      "email": "seif@swiftx.com",
      "password": "seif123456"
  }
```
* Return:
```
  {
      "status": "success",
      "message": "Signed in successfully"
  }
```
* Make sure to use the token as Bearer authenticity token

#### DELETE /users/sign_out

* General: Logging an existing user out of the system
* Return:
  ```
  {
    "status": "success",
    "message": "Signed out successfully"
  }
   ```
   
   

#### GET /api/users (Admin and Manager only role)

* General: Returns a list of users
* Return:
```
[
    {
        "id": 1,
        "name": "seif_admin",
        "email": "seif_admin@swiftx.com",
        "password_digest": "$2a$12$gtKErghNdRie7owmkfL.OuoOqgJTyKJjmW79xSBv2KC41WAo0bsVe",
        "created_at": "2023-03-26T20:21:49.074Z",
        "updated_at": "2023-03-26T20:21:49.074Z",
        "role": "admin"
    },
    {
        "id": 2,
        "name": "seif_manager",
        "email": "seif_manager@swiftx.com",
        "password_digest": "$2a$12$2PCYalgWYS0q15bHpxhmCOeIKuFwc4R3z.zhaH/G6LebZLknCAVrS",
        "created_at": "2023-03-26T20:21:49.292Z",
        "updated_at": "2023-03-26T20:48:12.010Z",
        "role": "user_manager"
    },
    {
        "id": 3,
        "name": "seif_user",
        "email": "seif_user@swiftx.com",
        "password_digest": "$2a$12$AJ/Is/OAw5cSYwbnW55bHuJc3UpC.AX5SpZF.w1x/tJbKHRuMA4xK",
        "created_at": "2023-03-26T20:21:49.501Z",
        "updated_at": "2023-03-26T20:21:49.501Z",
        "role": "normal_user"
    }
]
```

#### GET /api/users/:id (Admin and Manager only role)

* General: Get a specific user
* Return:
```
    {
        "id": 1,
        "name": "seif_admin",
        "email": "seif_admin@swiftx.com",
        "password_digest": "$2a$12$gtKErghNdRie7owmkfL.OuoOqgJTyKJjmW79xSBv2KC41WAo0bsVe",
        "created_at": "2023-03-26T20:21:49.074Z",
        "updated_at": "2023-03-26T20:21:49.074Z",
        "role": "admin"
    }
```



#### PATCH /api/users/:id (Admin and Manager only role)

* General: Update a specific user
* Return:
```
    {
        "id": 1,
        "name": "seif_admin",
        "email": "seif_admin@swiftx.com",
        "password_digest": "$2a$12$gtKErghNdRie7owmkfL.OuoOqgJTyKJjmW79xSBv2KC41WAo0bsVe",
        "created_at": "2023-03-26T20:21:49.074Z",
        "updated_at": "2023-03-26T20:21:49.074Z",
        "role": "admin"
    }
```
   
#### DELETE /api/users/:id (Admin and Manager only role)

* General: Delete a specific user
* Return:
```
    {
        "id": 1,
        "name": "seif_admin",
        "email": "seif_admin@swiftx.com",
        "password_digest": "$2a$12$gtKErghNdRie7owmkfL.OuoOqgJTyKJjmW79xSBv2KC41WAo0bsVe",
        "created_at": "2023-03-26T20:21:49.074Z",
        "updated_at": "2023-03-26T20:21:49.074Z",
        "role": "admin"
    }
```
   
#### GET /api/jogging_times

* General: Get all jogging times for all users for admin role, and all jogging times for the current user for normal and manager role
* Return:
```
[
    {
        "id": 1,
        "date": "2023-03-26",
        "distance": 10.0,
        "time": 1.0,
        "created_at": "2023-03-26T20:21:49.520Z",
        "updated_at": "2023-03-26T20:21:49.520Z"
    },
    {
        "id": 2,
        "date": "2023-03-26",
        "distance": 20.0,
        "time": 2.0,
        "created_at": "2023-03-26T20:21:49.531Z",
        "updated_at": "2023-03-26T20:21:49.531Z"
    },
    {
        "id": 3,
        "date": "2023-03-26",
        "distance": 30.0,
        "time": 3.0,
        "created_at": "2023-03-26T20:21:49.543Z",
        "updated_at": "2023-03-26T20:21:49.543Z"
    }
]
```
   
   
#### GET /api/jogging_times/:id

* General: Get specific jogging time for all users for admin role, and specific jogging time for the current user for normal and manager role
* Return:
```
{
    "id": 1,
    "date": "2023-03-26",
    "distance": 10.0,
    "time": 1.0,
    "created_at": "2023-03-26T20:21:49.520Z",
    "updated_at": "2023-03-26T20:21:49.520Z"
}
```
   
#### UPDATE /api/jogging_times/:id

* General: Update specific jogging time for all users for admin role, and specific jogging time for the current user for normal and manager role
* Return:
```
{
    "id": 1,
    "date": "2023-03-26",
    "distance": 10.0,
    "time": 1.0,
    "created_at": "2023-03-26T20:21:49.520Z",
    "updated_at": "2023-03-26T20:21:49.520Z"
}
 ```
   
   
#### DELETE /api/jogging_times/:id

* General: Delete specific jogging time for all users for admin role, and specific jogging time for the current user for normal and manager role
* Return:
```
{
    "id": 1,
    "date": "2023-03-26",
    "distance": 10.0,
    "time": 1.0,
    "created_at": "2023-03-26T20:21:49.520Z",
    "updated_at": "2023-03-26T20:21:49.520Z"
}
 ```
   
#### GET /api/weekly_report

* General: Get a weekly report with average speed, average distance, week starting day and week ending day
* Return:
```
{
    "average_speed": 10.0,
    "average_distance": 10.0,
    "current_week_started_at": "2023-03-20",
    "current_week_ends_at": "2023-03-26"
}
 ```
   
