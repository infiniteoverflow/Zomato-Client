class Category {
  int id;
  String name;

  Category({this.id, this.name});

  factory Category.fromJson(Map<String, dynamic> data) {
    return Category(id: data['id'], name: data['name']);
  }
}

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
