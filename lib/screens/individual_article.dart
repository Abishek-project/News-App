import 'package:flutter/material.dart';
import 'package:news_app/model/data_model.dart';

import '../constants/app_colors.dart';
import '../constants/app_font_style.dart';

// ignore: must_be_immutable
class ArticleView extends StatelessWidget {
  String? categoryTitle;
  ArticleView(this.categoryTitle, {super.key});
  static const routeName = '/article-view';

  @override
  Widget build(BuildContext context) {
    final article = ModalRoute.of(context)!.settings.arguments as Article;
    return SafeArea(
      child: Container(
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              article.urlToImage.toString(),
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.grey.withOpacity(0.6), BlendMode.dstATop),
          ),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: AppColors.appWhite,
                      size: 30,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 3, bottom: 3),
                          decoration: BoxDecoration(
                              color: Colors.white38,
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            categoryTitle.toString(),
                            style: AppTypography.boldTitle03.copyWith(
                              color: AppColors.appWhite,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 25),
                          child: Text(article.description.toString(),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5,
                              style: AppTypography.boldTitle01.copyWith(
                                color: AppColors.appWhite,
                              )),
                        )
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: AppColors.appBlackDark,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.person,
                                          color: AppColors.appWhite,
                                        ),
                                        Container(
                                          constraints: const BoxConstraints(
                                            maxWidth: 150,
                                          ),
                                          child: Text(
                                            article.author.toString(),
                                            overflow: TextOverflow.ellipsis,
                                            style: AppTypography
                                                .regularFootNote02
                                                .copyWith(
                                                    color: AppColors.appWhite),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.schedule,
                                        size: 18,
                                        color: Colors.grey[400],
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                          article.publshedAt != null
                                              ? '${DateTime.now().difference(article.publshedAt!).inHours} h'
                                              : 'N/A',
                                          style:
                                              AppTypography.regularFootNote02),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 25,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.visibility,
                                        size: 18,
                                        color: Colors.grey[400],
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text("378",
                                          style:
                                              AppTypography.regularFootNote02),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              article.title.toString(),
                              overflow: TextOverflow.clip,
                              maxLines: 1,
                              style: AppTypography.boldTitle01.copyWith(
                                color: AppColors.appBlackDark,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(article.content.toString(),
                                style: AppTypography.newMessage.copyWith(
                                  color: AppColors.appBlackDark,
                                )),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
