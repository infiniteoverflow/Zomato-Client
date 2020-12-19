
class Collection {
  final collectionId;
  final resCount;
  final imageUrl;
  final url;
  final title;
  final description;
  final shareUrl;

  Collection({this.collectionId, this.resCount, this.imageUrl, 
  this.url, this.title, this.description, this.shareUrl});

  factory Collection.fromJson(Map<String,dynamic> data) {
    return Collection(
      collectionId: data['collection_id'],
      resCount: data['res_count'],
      imageUrl: data['image_url'],
      url: data['url'],
      title: data['title'],
      description: data['description'],
      shareUrl: data['share_url']
    );
  }
}

class Collections {
  List<Collection> collections;

  Collections({this.collections});

  factory Collections.fromList(List<dynamic> collections) {
    return Collections(
      collections: collections.map((e) => Collection.fromJson(e['collection'])).toList(),
    );
  }
}