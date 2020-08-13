import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class NavigationState {
  int tab;
  bool search;
  String searchQuery;

  NavigationState({
    this.tab = 0,
    this.search = false,
    this.searchQuery = '',
  });
}

class NavigationBloc extends BlocBase {
  final BehaviorSubject<bool> _search = BehaviorSubject<bool>.seeded(false);
  final BehaviorSubject<String> _searchQuery =
      BehaviorSubject<String>.seeded('');
  final BehaviorSubject<int> _tab = BehaviorSubject<int>.seeded(0);

  Stream<NavigationState> controller() => CombineLatestStream.combine3(
      _search,
      _searchQuery,
      _tab,
      (bool search, String searchQuery, int tab) =>
          NavigationState(search: search, searchQuery: searchQuery, tab: tab));

  void switchTab(int index) {
    _tab.sink.add(index);
    enableSearch(false);
  }

  void enableSearch(bool value) {
    _search.sink.add(value);
  }

  void setSearchQuery(String value) {
    _searchQuery.sink.add(value);
  }

  @override
  void dispose() {
    super.dispose();
    _search.drain();
    _search.close();
    _searchQuery.drain();
    _searchQuery.close();
    _tab.drain();
    _tab.close();
  }
}
