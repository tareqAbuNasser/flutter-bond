import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bond/core/search_providers/algolia_search_provider.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final AlgoliaSearchProvider _algoliaSearchProvider = AlgoliaSearchProvider();

  SearchCubit() : super(SearchInitial());

  Future<void> search(String query, {int page = 0}) async {
    try {
      emit(SearchLoading());
      final results = await _algoliaSearchProvider.search(query, page: page);
      emit(SearchLoaded(results));
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }
}
