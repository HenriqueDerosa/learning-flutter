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
  final BehaviorSubject<NavigationState> _controller =
      BehaviorSubject<NavigationState>.seeded(new NavigationState(
    search: false,
    searchQuery: '',
    tab: 0,
  ));

  Stream<NavigationState> get stream => _controller.stream;
  NavigationState get state => _controller.value;

  void switchTab(int index) {
    if (state == null) {
      _controller.sink.add(new NavigationState(
        search: false,
        searchQuery: '',
        tab: index,
      ));
      return;
    }
    _controller.sink.add(new NavigationState(
      search: state.search,
      searchQuery: state.searchQuery,
      tab: index,
    ));
  }

  void enableSearch(bool value) {
    if (state == null) {
      _controller.sink.add(new NavigationState(
        search: value,
        searchQuery: '',
        tab: 0,
      ));
      return;
    }
    _controller.sink.add(new NavigationState(
      search: !state.search,
      searchQuery: state.searchQuery,
      tab: state.tab,
    ));
  }

  void setSearchQuery(String value) {
    if (state == null) {
      _controller.sink.add(new NavigationState(
        search: false,
        searchQuery: value,
        tab: 0,
      ));
      return;
    }
    _controller.sink.add(new NavigationState(
      search: state.search,
      searchQuery: value,
      tab: state.tab,
    ));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.close();
  }
}
