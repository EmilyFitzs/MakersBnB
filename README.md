# MakersBnB

We have been tasked with building an AirBnB clone made up of a web application and databases that, when coded and integrated successfully, allows users to list spaces they have available, and to hire spaces for the night.

##### * DB setup & user stories below *


## Set up

To setup the database:

* Connect to psql
* Create the database using the psql command `CREATE DATABASE makersbnb;`
* Connect to the database using the psql command `\c makersbnb`;
* Run the query we have saved in the file create_properties_table.sql
* Populate your table with a row by running `INSERT INTO properties (name, description, price) values ('Villa One', 'Villa with 5 beds and 6 baths', '1080');`

To check you have everything set up ok, please take a look at the properties table inside the makersbnb database. You should see one row in there.  

To setup the test database:
* Connect to psql
* Create the database using the psql
command `CREATE DATABASE makersbnb_test;`;
* Connect to the database using the psql command `\c makersbnb_test`
* Run the query we have saved in the file create_properties_table.sql

* `bundle install`
* `rspec`

You should see 1 passing test.

## User Stories

```
As a user, 
So that I can use MakersBnb,
I would like to create an account
```

```
As a host,
So that I can rent out my property,
I would like to list a space
```

```
As a host,
So that I can make an income,
I would like to list multiple spaces.
```

```
As a host,
So that I can advertise my space,
I would like to name my space, provide a description, and price per night
```

```
As a host,
So that potential guests know when my space is available,
I want to display the dates it is free
```

```
As a guest,
So that I can book a space for a night,
I would like to submit a request to the host
```

```
As a host,
So that I can manage my space,
I would like to accept or refuse a guest request
```

```
As a host,
So that I can maximise capacity
A space is only ‘unavailable’ if the user has completed a booking
```

```
As a host,
So that I don’t let out my place when it is reserved,
Only available spaces should be shown
```

```
As a guest,
So that I can complete a booking,
I would like to confirm or deny a booking request
```