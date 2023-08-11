import 'package:algolia/algolia.dart';

class AlgoliaSearchProvider {
  final Algolia _algoliaClient;

  AlgoliaSearchProvider()
      : _algoliaClient = Algolia.init(
          applicationId: EnvironmentConfig.ALGOLIA_APP_ID,
          apiKey: EnvironmentConfig.ALGOLIA_API_KEY,
        );

  Future<List<AlgoliaObjectSnapshot>> search(String query, {int page = 0}) async {
    try {
      final algoliaQuery = _algoliaClient.instance.index(EnvironmentConfig.ALGOLIA_INDEX_NAME).query(query);
      final response = await query.getObjects();
      return response.hits;
    } catch (e) {
      throw Exception('Failed to perform search due to the following error: $e');
    }
  }
}