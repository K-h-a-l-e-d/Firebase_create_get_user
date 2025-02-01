# FireBase User Info

## Description
This is a Simple flutter application demonstrating the use of create and read operations on users in firebase firestore database

## Features
- Saving & displaying recently created users along with a list of all users in firestore database
  
## code explanation
- on pressing Save Data, user input is taken form textform fields controllers', and user data map is created then passed to firebase add functions which performs a create request to the db
- on pressing Display saved data button the current page navigates to UsersInfo page and get users request is performed in an init state in Users info page which fetches users from database, then they are displayed along with recently added user if there is any, otherwise a default Text will be displayed

## Application Screenshots: 
|![u1](https://github.com/user-attachments/assets/d094d56e-4d3e-449b-9296-6afe516da99d)|![u2](https://github.com/user-attachments/assets/eca6b1e3-1686-4e14-82e5-df7e0aaa93d2)|
|-|-|

![u3](https://github.com/user-attachments/assets/70b50847-712f-4059-9a9b-aab20141fd8b)![u4](https://github.com/user-attachments/assets/b23670cd-4deb-4ff5-b7d8-51a22fd134d8)
