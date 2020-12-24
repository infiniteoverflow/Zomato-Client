/// Gives location details of each search
class Location {
  final entityType;
  final entityId;
  final title;
  final lat;
  final long;
  final cityId;
  final cityName;
  final countryId;
  final countryName;

  Location(
      {this.entityType,
      this.entityId,
      this.title,
      this.lat,
      this.long,
      this.cityId,
      this.cityName,
      this.countryId,
      this.countryName});

  factory Location.fromJson(Map<String, dynamic> jsonData) {
    return Location(
        entityId: jsonData['entity_type'],
        entityType: jsonData['entity_id'],
        title: jsonData['title'],
        lat: jsonData['latitude'],
        long: jsonData['longitude'],
        cityId: jsonData['city_id'],
        cityName: jsonData['city_name'],
        countryId: jsonData['country_id'],
        countryName: jsonData['country_name']);
  }
}

/// Gives details of Popularity of each search
class Popularity {
  final popularity;
  final nightlifeIndex;
  final nearbyRes;
  final topCuisines;
  final popularityRes;
  final nightlifeRes;
  final subzone;
  final subzoneId;
  final city;

  Popularity(
      {this.popularity,
      this.nightlifeIndex,
      this.nearbyRes,
      this.topCuisines,
      this.popularityRes,
      this.nightlifeRes,
      this.subzone,
      this.subzoneId,
      this.city});

  factory Popularity.fromJson(Map<String, dynamic> data) {
    return Popularity(
        popularity: data['popularity'],
        nightlifeIndex: data['nightlife_index'],
        nearbyRes: data['nearby_res'],
        topCuisines: data['top_cuisines'],
        popularityRes: data['popularity_res'],
        nightlifeRes: data['nightlife_res'],
        subzone: data['subzone'],
        subzoneId: data['subzone_id'],
        city: data['city']);
  }
}

/// Gives the status of the Menu
class MenuStatus {
  final delivery;
  final takeaway;

  MenuStatus({this.delivery, this.takeaway});

  factory MenuStatus.fromJson(Map<String, dynamic> json) {
    return MenuStatus(delivery: json['delivery'], takeaway: json['takeaway']);
  }
}

/// Details of the Restaurant
class R {
  final resId;
  final isGroceryStore;
  MenuStatus menuStatus;

  R({this.resId, this.isGroceryStore, this.menuStatus});

  factory R.fromJson(Map<String, dynamic> json) {
    return R(
        resId: json['res_id'],
        isGroceryStore: json['is_grocery_store'],
        menuStatus: MenuStatus.fromJson(json['has_menu_status']));
  }
}

/// Gives location details of each Restaurant returned in the API Response.
class RestaurantLocation {
  final address;
  final locality;
  final city;
  final cityId;
  final latitude;
  final longitude;
  final zipcode;
  final countryId;
  final localityVerbose;

  RestaurantLocation(
      {this.address,
      this.locality,
      this.city,
      this.cityId,
      this.latitude,
      this.longitude,
      this.zipcode,
      this.countryId,
      this.localityVerbose});

  factory RestaurantLocation.fromJson(Map<String, dynamic> json) {
    return RestaurantLocation(
      address: json['address'],
      locality: json['locality'],
      city: json['city'],
      cityId: json['city_id'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      zipcode: json['zipcode'],
      countryId: json['country_id'],
      localityVerbose: json['locality_verbose'],
    );
  }
}

/// Returns the Rating Object of that particular Restaurant
class RatingObject {
  final titleText;
  final bgColorType;
  final bgColorTint;

  RatingObject({this.titleText, this.bgColorType, this.bgColorTint});

  factory RatingObject.fromJson(Map<String, dynamic> json) {
    return RatingObject(
        titleText: json['title']['text'],
        bgColorType: json['bg_color']['type'],
        bgColorTint: json['bg_color']['tint']);
  }
}

/// Gives Details about the rating given by a particular User.
class UserRating {
  final aggregateRating;
  final ratingText;
  final ratingColor;
  final RatingObject ratingObject;
  final votes;

  UserRating(
      {this.aggregateRating,
      this.ratingText,
      this.ratingColor,
      this.ratingObject,
      this.votes});

  factory UserRating.fromJson(Map<String, dynamic> json) {
    return UserRating(
        aggregateRating: json['aggregate_rating'],
        ratingText: json['aggregate_rating'],
        ratingColor: json['rating_color'],
        votes: json['votes'],
        ratingObject: RatingObject.fromJson(json['rating_obj']));
  }
}

/// Complete Details regarding each Restaurant.
class Restaurant {
  final R r;
  final String apiKey;
  final id;
  final String name;
  final String url;
  final RestaurantLocation restaurantLocation;
  final switchToOrderMenu;
  final cuisines;
  final averageCostForTwo;
  final priceRange;
  final currency;
  final offers;
  final openTableSupport;
  final isZomatoBookRes;
  final mezzoProvider;
  final isBookFormWebView;
  final bookFormWebViewUrl;
  final bookAgainUrl;
  final thumb;
  final UserRating userRating;
  final photosUrl;
  final menuUrl;
  final featuredImage;
  final medioProvider;
  final hasOnlineDelivery;
  final isDeliveringNow;
  final storeType;
  final includeBogoOffers;
  final deeplink;
  final isTableReservationSupported;
  final hasTableBooking;
  final eventsUrl;

  Restaurant(
      {this.r,
      this.apiKey,
      this.id,
      this.name,
      this.url,
      this.restaurantLocation,
      this.switchToOrderMenu,
      this.cuisines,
      this.averageCostForTwo,
      this.priceRange,
      this.currency,
      this.offers,
      this.openTableSupport,
      this.isZomatoBookRes,
      this.mezzoProvider,
      this.isBookFormWebView,
      this.bookFormWebViewUrl,
      this.bookAgainUrl,
      this.thumb,
      this.userRating,
      this.photosUrl,
      this.menuUrl,
      this.featuredImage,
      this.medioProvider,
      this.hasOnlineDelivery,
      this.isDeliveringNow,
      this.storeType,
      this.includeBogoOffers,
      this.deeplink,
      this.isTableReservationSupported,
      this.hasTableBooking,
      this.eventsUrl});

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
        r: R.fromJson(json['R']),
        apiKey: json['apikey'],
        id: json['id'],
        name: json['name'],
        url: json['url'],
        restaurantLocation: RestaurantLocation.fromJson(json['location']),
        switchToOrderMenu: json['switch_to_order_menu'],
        cuisines: json['cuisines'],
        averageCostForTwo: json['average_cost_for_two'],
        priceRange: json['price_range'],
        currency: json['currency'],
        offers: json['offers'],
        openTableSupport: json['opentable_support'],
        isZomatoBookRes: json['is_zomato_book_res'],
        mezzoProvider: json['mezzo_provider'],
        isBookFormWebView: json['is_book_form_web_view'],
        bookFormWebViewUrl: json['book_form_web_view_url'],
        bookAgainUrl: json['book_again_url'],
        thumb: json['thumb'],
        userRating: UserRating.fromJson(json['user_rating']),
        photosUrl: json['photos_url'],
        menuUrl: json['menu_url'],
        featuredImage: json['featured_image'],
        medioProvider: json['medio_provider'],
        hasOnlineDelivery: json['has_online_delivery'],
        isDeliveringNow: json['is_delivering_now'],
        storeType: json['store_type'],
        includeBogoOffers: json['include_bogo_offers'],
        deeplink: json['deeplink'],
        isTableReservationSupported: json['is_table_reservation_supported'],
        hasTableBooking: json['has_table_booking'],
        eventsUrl: json['events_url']);
  }
}

/// Gives details about all nearby restaurants
class NearbyRestaurants {
  List<Restaurant> restaurants;

  NearbyRestaurants({this.restaurants});

  factory NearbyRestaurants.fromList(List<dynamic> restaurants) {
    return NearbyRestaurants(
      restaurants:
          restaurants.map((e) => Restaurant.fromJson(e['restaurant'])).toList(),
    );
  }
}

/// Returns response for the GeoCode API as an Object
class GeoCode {
  Location location;
  Popularity popularity;
  final link;
  NearbyRestaurants nearbyRestaurants;

  GeoCode({this.location, this.popularity, this.link, this.nearbyRestaurants});

  factory GeoCode.fromJson(Map<String, dynamic> json) {
    return GeoCode(
      location: Location.fromJson(json['location']),
      popularity: Popularity.fromJson(json['popularity']),
      link: json['link'],
      nearbyRestaurants: NearbyRestaurants.fromList(json['nearby_restaurants']),
    );
  }
}
