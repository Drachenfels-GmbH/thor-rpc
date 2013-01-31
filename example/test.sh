#!/bin/bash

curl -H "Content-Type: application/json" \
-d '{ "jsonrpc": "2.0", "method": "foobar", "id":0 }' \
  http://localhost:9292/simple

curl -H "Content-Type: application/json" \
-d '{ "jsonrpc": "2.0", "method": "fooarg", "params": [4711], "id":0 }' \
  http://localhost:9292/simple

# should return
# {"jsonrpc":"2.0","result":"useless method","id":0}
# {"jsonrpc":"2.0","result":"fooarg 4711","id":0}