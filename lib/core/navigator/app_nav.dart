import 'package:go_router/go_router.dart';
import 'package:news_app/home/view.dart';
import 'package:news_app/item_details/view.dart';
import 'package:news_app/models/news_home_model.dart';
import 'package:news_app/search/view.dart';
import 'package:news_app/search_results/view.dart';

class AppRoutes {
  static const String home = "/home";
  static const String search = "/search";
  static const String searchResults = "/searchResults";
  static const String itemDetails = "/itemDetails";
}

class RouterGenerator {
  static GoRouter goRoute = GoRouter(
      initialLocation: AppRoutes.home,
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          path: AppRoutes.home,
          name: AppRoutes.home,
          builder: (context, state) => const HomePageScreen(),
        ),
        GoRoute(
            name: AppRoutes.search,
            path: AppRoutes.search,
            builder: (context, state) => const SearchScreen()),
        GoRoute(
            name: AppRoutes.searchResults,
            path: AppRoutes.searchResults,
            builder: (context, state) {
              final query = state.extra as String;
              return SearchResultsScreen(query: query);
            }),
        GoRoute(
            name: AppRoutes.itemDetails,
            path: AppRoutes.itemDetails,
            builder: (context, state) => ItemDetailsScreen(
                  articles: state.extra as Articles,
                )),
      ]);
}
