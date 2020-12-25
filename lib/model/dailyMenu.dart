/// Gives details of each dish in the dailymenus
class Dish {
  /// The ID of the dish
  final dishId;

  /// The name of the dish
  final String name;

  /// The price of the dish
  final price;

  Dish({this.dishId, this.name, this.price});

  factory Dish.fromJson(Map<String, dynamic> json) {
    return Dish(
        dishId: json['dish_id'], name: json['name'], price: json['price']);
  }
}

/// Lists all the dishes available in the dailymenu
class Dishes {
  /// List of dishes
  List<Dish> dishesList;

  Dishes({this.dishesList});

  factory Dishes.fromList(List<dynamic> dishes) {
    return Dishes(
      dishesList: dishes.map((e) => Dish.fromJson(e['dish'])).toList(),
    );
  }
}

/// Gives the description of each item in the DailyMenu List
class DailyMenu {
  /// ID of the Daily Menu Item
  final dailyMenuId;

  /// The start date for the menu
  final startDate;

  /// The name of the menu
  final String name;

  /// List Of dishes in the daily menu
  Dishes dishes;

  DailyMenu({this.dailyMenuId, this.dishes, this.name, this.startDate});

  factory DailyMenu.fromJson(Map<String, dynamic> json) {
    return DailyMenu(
      dailyMenuId: json['daily_menu_id'],
      startDate: json['start_date'],
      name: json['name'],
      dishes: Dishes.fromList(json['dishes']),
    );
  }
}

/// Gives the list of all items in the DailyMenu List
class DailyMenuList {
  /// List of DailyMenus for that particular restaurant
  List<DailyMenu> dailyMenus;

  DailyMenuList({this.dailyMenus});

  factory DailyMenuList.fromList(List<dynamic> dailyMenus) {
    return DailyMenuList(
      dailyMenus:
          dailyMenus.map((e) => DailyMenu.fromJson(e['daily_menu'])).toList(),
    );
  }
}
