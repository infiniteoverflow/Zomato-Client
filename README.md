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
  zomato.getCuisines(cityId: 1,asObject: true).then((value) => print(value.cuisines[0].cuisineId));
```

*Note : The `asObject` parameter in each method describes whether the method should return data in pure json format or as a dart object which can be used to access each individual components of the api response.*
