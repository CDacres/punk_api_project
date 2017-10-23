# Punk API Web Service

A Service Object Model for Punk API.

### Technology used

The API Service was built using Ruby, with the following gems:

* httparty
* json
* rpsec

### Installation

To run the program locally, simply clone/download the git repository.

### Using the product

In the termnial change directory to **api_project**

Open punk_object.rb in a text editor.

#### Find a beer with a known id

To get information for a specific beer with a known id, in the punk_object.rb file underneath the class (line 58) add the following code:

```
beer = BeersService.new
p beer.get_single_beer("id")

```
Then in the terminal run the file with: **ruby punk_object.rb**

#### Find a random beer

To get information for a random beer, in the punk_object.rb file underneath the class (line 58) add the following code:

```
beer = BeersService.new
p beer.get_random_beer

```
Then in the terminal run the file with: **ruby punk_object.rb**

#### Search beers

To search for information on beers which meet certain search criteria, in the punk_object.rb file underneath the class (line 58) add the following code:

```
beer.check_params_valid({search_criteria})
beer.add_params_to_url
p beer.get_beer_search_results

```

Where *{search_criteria}* is a hash containing the following possible key-value pairs:

