import 'package:zomato_client/zomato_client.dart';

void main(List<String> arguments) async {
  final zomato = Zomato(key: '<YOUR-API-KEY>');

  // Get categories
  final categories = await zomato.getCategories();
  print(categories['categories']);
}
