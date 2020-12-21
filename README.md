# zomato_client

A Dart Client for Zomato API.

![](https://github.com/infiniteoverflow/Zomato-Client/blob/main/%20banner.png)

Through this dart package we reduce the developers work in writing Future methods and http requests to fetch the api and parse the json data. The developer can either retrieve the data in Json format or as a Dart Object.

## How to use the Zomato Client

1. Specify the key as the parameter

```dart
  Zomato zomato = Zomato(key: '<your zomato api key>');
```

2. Use the object to access various methods

```dart
  zomato.getCuisines(cityId: 1,asObject: true).then((value){
    Cuisines cuisines = value;
    print(cuisines.cuisines[0].cuisineId);
  });
```

*Note : The `asObject` parameter in each method describes whether the method should return data in pure json format or as a dart object which can be used to access each individual components of the api response.*

## Methods in the class

- `getCategories()` : Get a list of categories. List of all restaurants categorized under a particular restaurant type can be obtained using /Search API with Category ID as inputs

- `getCityDetails()` : Find the Zomato ID and other details for a city . You can obtain the Zomato City ID in one of the following ways:
  - City Name in the Search Query - Returns list of cities matching the query
  - Using coordinates - Identifies the city details based on the coordinates of any location inside a city
If you already know the Zomato City ID, this API can be used to get other details of the city.

-  `getCollections()` : Returns Zomato Restaurant Collections in a City. The location/City input can be provided in the following ways:
    - Using Zomato City ID
    - Using coordinates of any location within a city.   
List of all restaurants listed in any particular Zomato Collection can be obtained using the '/search' API with Collection ID and Zomato City ID as the input
  
- `getCuisines()` : Get a list of all cuisines of restaurants listed in a city. The location/city input can be provided in the following ways:
  - Using Zomato City ID
  - Using coordinates of any location within a city.   
List of all restaurants serving a particular cuisine can be obtained using '/search' API with cuisine ID and location details.

- `getEstablishment()` : Get a list of restaurant types in a city. The location/City input can be provided in the following ways -
  - Using Zomato City ID
  - Using coordinates of any location within a city.  
List of all restaurants categorized under a particular restaurant type can obtained using /Search API with Establishment ID and location details as inputs. 

- `getGeocode()` : Get Foodie and Nightlife Index, list of popular cuisines and nearby restaurants around the given coordinates.

## Return datatype of each module in the class Zomato 

Method name | `asObject = false` | `asObject = true`| Error |
:-----------:|:-------------------:|:----------------:|:-------
getCategories() | Map<String,dynamic> | Categories | 
getCityDetails() | Map<String,dynamic> | CitiesResponse | 
getCollections() | Map<String,dynamic> | Collections | String
getCuisines() | Map<String,dynamic> | Cuisines | String
getEstablishment() | Map<String,dynamic> | Establishments | String
getGeocode() | Map<String,dynamic> | GeoCode | String

*Note : You can use the `.` operator to know which all attributes are available for each returned datatype when `asObject=true`.*

## How to use a particular module

```dart
  Zomato zomato = Zomato(key: '<your zomato api key>');
  zomato.getCategories(asObject: true).then((value){
    Categories categories = value;
    print(categories.categories[0].name);
  });
```

If you love this package , please leave a :star: .

If you feel there is something missing , please feel free to raise an issue and i will get back to you on it as soon as i can.
