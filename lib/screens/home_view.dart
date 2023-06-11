import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/model/data_model.dart';

import 'package:news_app/screens/individual_article.dart';
import 'package:news_app/services/api_call.dart';

import '../constants/app_colors.dart';
import '../constants/app_font_style.dart';
import '../constants/app_strings.dart';

class HomeView extends StatefulWidget {
  @override
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  List<String> categories = [
    AppStrings.health,
    AppStrings.business,
    AppStrings.entertainment,
    AppStrings.technology,
    AppStrings.sports,
  ];
  News news = News();
  late TabController tabController;
  List<Article> article = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: categories.length, vsync: this);
    tabController.addListener(handleTabChange);
    fetchArticle();
  }

  fetchArticle() async {
    var result = await news.fetchArticleByCategory(categories[0]);
    setState(() {
      article = result;
      isLoading = false;
    });
  }

  void handleTabChange() async {
    isLoading = true;
    int tabIndex = tabController.index;
    String category = categories[tabIndex];
    article.clear();
    var result = await news.fetchArticleByCategory(category);
    setState(() {
      article = result;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categories.length,
      initialIndex: 0,
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: bottomNavigationBar(),
          appBar: _appbar(),
          body: _body(),
        ),
      ),
    );
  }

  BottomNavigationBar bottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: AppColors.appWhite,
      elevation: 0,
      currentIndex: 0,
      selectedItemColor: AppColors.appBlackDark,
      unselectedItemColor: AppColors.darkGray,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: AppStrings.home),
        BottomNavigationBarItem(
            icon: Icon(Icons.search), label: AppStrings.search),
        BottomNavigationBarItem(
            icon: Icon(Icons.person), label: AppStrings.profile),
      ],
    );
  }

  _body() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 14, right: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          discoverNews(),
          searchTextfield(),
          tabBar(),
          Expanded(
            child: tabBarView(),
          )
        ],
      ),
    );
  }

  tabBarView() {
    return TabBarView(
        children: categories
            .map((e) => isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: article.length,
                    itemBuilder: (context, index) {
                      return articleCard(
                          index, context, categories[tabController.index]);
                    }))
            .toList());
  }

  articleCard(int index, BuildContext context, category) {
    return Padding(
      padding: const EdgeInsets.only(),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ArticleView(category),
                  settings: RouteSettings(arguments: article[index])));
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              height: 80,
              width: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  article[index].urlToImage!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      article[index].title!,
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                      style: AppTypography.boldBodySubHeadline
                          .copyWith(color: AppColors.appBlackDark),
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.schedule,
                        size: 18,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                          article[index].publshedAt != null
                              ? '${DateTime.now().difference(article[index].publshedAt!).inHours} hours ago'
                              : 'N/A',
                          style: AppTypography.regularFootNote02),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  tabBar() {
    return TabBar(
        controller: tabController,
        labelPadding: const EdgeInsets.only(left: 10, right: 8, bottom: 3),
        isScrollable: true,
        indicatorColor: Colors.black,
        indicatorSize: TabBarIndicatorSize.label,
        tabs: categories
            .map((e) => Text(
                  e,
                  style: AppTypography.boldTitle03.copyWith(
                    color: AppColors.appBlackDark,
                  ),
                ))
            .toList());
  }

  discoverNews() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.discover,
          style: AppTypography.boldTitle01.copyWith(
            color: AppColors.appBlackDark,
          ),
        ),
        Text(
          AppStrings.news,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }

  searchTextfield() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: AppStrings.search,
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.darkGray,
          ),
          suffixIcon: RotatedBox(
            quarterTurns: 1,
            child: Icon(
              Icons.tune,
              color: AppColors.darkGray,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          fillColor: AppColors.lightGray13,
          filled: true,
        ),
      ),
    );
  }

  AppBar _appbar() {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.white, // <-- SEE HERE
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
          iconSize: 32,
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          )),
    );
  }
}
