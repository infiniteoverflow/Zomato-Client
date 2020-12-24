class Dish {
  final dishId;
  final String name;
  final price;

  Dish({this.dishId, this.name, this.price});

  factory Dish.fromJson(Map<String, dynamic> json) {
    return Dish(
        dishId: json['dish_id'], name: json['name'], price: json['price']);
  }
}

class Dishes {
  List<Dish> dishesList;

  Dishes({this.dishesList});

  factory Dishes.fromList(List<dynamic> dishes) {
    return Dishes(
      dishesList: dishes.map((e) => Dish.fromJson(e['dish'])).toList(),
    );
  }
}

class DailyMenu {
  final dailyMenuId;
  final startDate;
  final String name;
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

class DailyMenuList {
  List<DailyMenu> dailyMenus;

  DailyMenuList({this.dailyMenus});

  factory DailyMenuList.fromList(List<dynamic> dailyMenus) {
    return DailyMenuList(
      dailyMenus:
          dailyMenus.map((e) => DailyMenu.fromJson(e['daily_menu'])).toList(),
    );
  }
}
