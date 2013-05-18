process-monitor-rails
===

A standalone rails application to monitor system processes and track a process' use of system resources.

Author
---

Luke Campbell 

License
---

       Copyright 2013 Lucas Campbell

       Licensed under the Apache License, Version 2.0 (the "License");
       you may not use this file except in compliance with the License.
       You may obtain a copy of the License at

           http://www.apache.org/licenses/LICENSE-2.0

       Unless required by applicable law or agreed to in writing, software
       distributed under the License is distributed on an "AS IS" BASIS,
       WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
       See the License for the specific language governing permissions and
       limitations under the License.

Installation
---

1. Get RVM: https://rvm.io/rubies/named/
2. Switch to ruby version 1.9.3+
3. Get redis
For OS-X give homebrew a whirl:
```
brew install redis
```

Brew should give you instructions to launch redis.


4. Go to your preferred development directory.  
5. `git clone https://github.com/lukecampbell/process-monitor-rails.git`
6. [Optional] But I suggest making a gemset for this project
```
rvm gemset create process-monitor
rvm use 1.9.3@process-monitor
```
7. `bundle install`
8. Setup your database `cp config/database.example.yml config/database.yml` and setup your adaptors.  You need a standalone database like PostgreSQL or MySQL to support multiple workers.
9. Launch the workers (to monitor) `foreman start -c worker=10`
10. Launch rails `rails s`


