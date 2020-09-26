# Welcome to TokenManager v1

This is a Rails 6 API to serve uniq tokens, has 5 endpoints and deployed on Heroku. To use this API, client/consumer needs to call it's relative endpoints.

## Technical Stack
- Ruby v2.7.1
- Rails v6.0.3
- MongoDB v3.6.3

## Development Setup

- Set up Ruby on Rails on linux based OS. For installation please follow this link [Ruby and Rails Installation Guide](https://gorails.com/setup/ubuntu/18.04). Here please use **RVM** for the development.
- Clone this repository into your system. [Clone GitHub Repository Guide](https://help.github.com/en/github/creating-cloning-and-archiving-repositories/cloning-a-repository)
- Open terminal and go to the project path.
- It will create one gemset for this project. Please install bundler first. For the installation of bundler please run this below command.
  > gem install bundler
- Install all gem by following below command.
  > bundle install
- Install MongoDB for database into this OS. Please follow this link [MongoDB Installation Guide](https://www.digitalocean.com/community/tutorials/how-to-install-mongodb-on-ubuntu-18-04).
- MongoDB Setup, to create TTL index run following command
  > rake db:create_indexes

- Start rails server with below command. It will run on port 3000.
    > rails s
- Now you can use API endpoints using Postman locally.

## API Documentation
  - API Endpoints Description
    - **POST create**: Endpoint to generate an unique token in the pool.
    - **GET assign**: Endpoint to assign unique token. On hitting this endpoint, it assigns available random token from the pool. It doesn't serve the same token again until it's freed or unblocked. If no free token is available in pool, it returns 404.
    - **PUT unblock**: Endpoint to unblock the token in the pool. Unblocked token can then be again served from assign endpoint.
    - **DELETE destroy**: Endpoint to delete the token in the pool.
    - **PUT keep_alive**: Endpoint to keep the tokens alive. All tokens should receive this endpoint within 5 minutes. If a token doesn't receive a keep-alive in last 5 mins, it will be deleted from pool automatically. By default each token will be freed/released automatically after 60s of use. To keep the token allocated to himself, client has to request to this endpoint.

  - Endpoint URLs:
    - **POST create**:  https://token-manager.herokuapp.com/v1/tokens
    - **GET assign**: https://token-manager.herokuapp.com/v1/tokens/assign
    - **PUT unblock**: https://token-manager.herokuapp.com/v1/tokens/<token_key>/unblock
    - **DELETE destroy**: https://token-manager.herokuapp.com/v1/tokens/<token_key>
    - **PUT keep_alive**: https://token-manager.herokuapp.com/v1/tokens/<token_key>/keep_alive

  - A public link to a static snapshot of Postman collection https://www.getpostman.com/collections/6e756842233c73601224

## Testing
- Rspec is used for unit testing and tesing the API endpoints. Below command will run all the specs.
    > rspec
- After running test suite one test coverage will be generated in the `index.html` in coverage inside the folder. For this test coverage *SimpleCov* has been used.
![test coverage](https://github.com/sanandasaha777/token_manager/blob/master/public/spec-coverage.png?raw=true)
