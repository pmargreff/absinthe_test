# AbsintheTest

To run profiling tests with docker:
- Build and run docker image with `docker-compose up`
- When server is up you can run `docker-compose exec absinthe_test mix test > ~/profiling.out` to run tests with profiling, it will give the output for query tests at `profiling.out` file in your home dir.
- Run server using `docker-compose exec absinthe_test mix phx.server`, it should be available at `http://localhost:4000`

