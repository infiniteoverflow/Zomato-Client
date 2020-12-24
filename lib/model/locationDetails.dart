import 'package:zomato_client/model/geocode.dart';

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

class MenuStatus {
  final delivery;
  final takeaway;

  MenuStatus({this.delivery, this.takeaway});

  factory MenuStatus.fromJson(Map<String, dynamic> json) {
    return MenuStatus(delivery: json['delivery'], takeaway: json['takeaway']);
  }
}

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

class Review {
  List<dynamic> reviews;

  Review({this.reviews});

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      reviews: json['review'],
    );
  }
}

class AllReviews {
  List<Review> reviews;

  AllReviews({this.reviews});

  factory AllReviews.fromJson(Map<String, dynamic> json) {
    List rr = json['reviews'];
    List<Review> r = rr.map((e) => Review.fromJson(e)).toList();
    return AllReviews(
      reviews: r,
    );
  }
}

class Restaurant {
  final R r;
  final String apiKey;
  final id;
  final String name;
  final String url;
  final RestaurantLocation restaurantLocation;
  final switchToOrderMenu;
  final cuisines;
  final timings;
  final averageCostForTwo;
  final priceRange;
  final currency;
  final highlights;
  final offers;
  final openTableSupport;
  final isZomatoBookRes;
  final mezzoProvider;
  final isBookFormWebView;
  final bookFormWebViewUrl;
  final bookAgainUrl;
  final thumb;
  final UserRating userRating;
  final allReviewsCount;
  final photosUrl;
  final photoCount;
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
  final phoneNumber;
  final AllReviews allReviews;
  final establishment;

  Restaurant(
      {this.r,
      this.apiKey,
      this.id,
      this.name,
      this.timings,
      this.highlights,
      this.allReviewsCount,
      this.photoCount,
      this.phoneNumber,
      this.allReviews,
      this.establishment,
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
        eventsUrl: json['events_url'],
        timings: json['timings'],
        allReviews: AllReviews.fromJson(json['all_reviews']),
        allReviewsCount: json['all_reviews_count'],
        establishment: json['establishment'],
        highlights: json['highlights'],
        phoneNumber: json['phone_numbers'],
        photoCount: json['photo_count']);
  }
}

class BestRatedRestaurants {
  List<Restaurant> restaurants;

  BestRatedRestaurants({this.restaurants});

  factory BestRatedRestaurants.fromList(List<dynamic> restaurants) {
    return BestRatedRestaurants(
        restaurants: restaurants
            .map((e) => Restaurant.fromJson(e['restaurant']))
            .toList());
  }
}

class LocationDetails {
  final popularity;
  final nightLifeIndex;
  final List<dynamic> nearbyRes;
  final List<dynamic> topCuisines;
  final popularityRes;
  final nightLifeRes;
  final subzone;
  final subzoneId;
  final city;
  final Location location;
  final numberOfRestaurants;
  final BestRatedRestaurants bestRatedRestaurants;

  LocationDetails(
      {this.popularity,
      this.nightLifeIndex,
      this.nearbyRes,
      this.topCuisines,
      this.popularityRes,
      this.nightLifeRes,
      this.subzone,
      this.subzoneId,
      this.city,
      this.location,
      this.numberOfRestaurants,
      this.bestRatedRestaurants});

  factory LocationDetails.fromJson(Map<String, dynamic> json) {
    return LocationDetails(
      popularity: json['popularity'],
      nightLifeIndex: json['nightlife_index'],
      nearbyRes: json['nearby_res'],
      topCuisines: json['top_cuisines'],
      popularityRes: json['popularity_res'],
      nightLifeRes: json['nightlife_res'],
      subzone: json['subzone'],
      subzoneId: json['subzone_id'],
      city: json['city'],
      location: Location.fromJson(json['location']),
      numberOfRestaurants: json['num_restaurant'],
      bestRatedRestaurants:
          BestRatedRestaurants.fromList(json['best_rated_restaurant']),
    );
  }
}
