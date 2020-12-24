/// Gives details for each Category like id and name.
class Category {
  int id;
  String name;

  Category({this.id, this.name});

  factory Category.fromJson(Map<String, dynamic> data) {
    return Category(id: data['id'], name: data['name']);
  }
}

/// Gives the list of all Categories.
class Categories {
  List<Category> categories;

  Categories({this.categories});

  factory Categories.fromList(List<dynamic> categoryList) {
    return Categories(
      categories:
          categoryList.map((e) => Category.fromJson(e['categories'])).toList(),
    );
  }
}
