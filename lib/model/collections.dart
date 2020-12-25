/// Gives details about each Collection in the Collections List.
class Collection {
  /// The ID of the collection
  final collectionId;

  /// The ResCount
  final resCount;

  /// The url for the image
  final imageUrl;

  /// Zomato URL
  final url;

  /// The title of the Collection
  final title;

  /// The description regarding the Collection
  final description;

  /// The URL to be shared
  final shareUrl;

  Collection(
      {this.collectionId,
      this.resCount,
      this.imageUrl,
      this.url,
      this.title,
      this.description,
      this.shareUrl});

  factory Collection.fromJson(Map<String, dynamic> data) {
    return Collection(
        collectionId: data['collection_id'],
        resCount: data['res_count'],
        imageUrl: data['image_url'],
        url: data['url'],
        title: data['title'],
        description: data['description'],
        shareUrl: data['share_url']);
  }
}

/// Gives the list of all collections available for each search
class Collections {
  /// List Of Collection Objects
  List<Collection> collections;

  Collections({this.collections});

  factory Collections.fromList(List<dynamic> collections) {
    return Collections(
      collections:
          collections.map((e) => Collection.fromJson(e['collection'])).toList(),
    );
  }
}
