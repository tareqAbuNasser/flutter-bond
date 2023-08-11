import 'package:algolia/algolia.dart';

class AlgoliaSearchProvider {
  final Algolia _algoliaClient;

  AlgoliaSearchProvider()
      : _algoliaClient = Algolia.init(
          applicationId: 'YourApplicationId',
          apiKey: 'YourApiKey',
        );

  Future<List<AlgoliaObjectSnapshot>> search(String query, {int page = 0}) async {
    try {
      final query = _algoliaClient.instance.index('YourIndexName').query(query);
      final response = await query.getObjects();
      return response.hits;
    } catch (e) {
      throw Exception('Failed to perform search: $e');
    }
  }
}
