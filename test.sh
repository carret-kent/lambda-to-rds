#!/bin/bash

docker-compose run --rm app index.handler '{"sample":"code", "test":"case"}'
