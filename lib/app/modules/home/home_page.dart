import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:to_do_list/app/modules/home/home_controller.dart';
import 'package:to_do_list/app/modules/home/pages/add_movie/add_movie_page.dart';
import 'package:to_do_list/app/shared/styles/colors.dart';

import 'components/card_movie_widget.dart';
import 'pages/details/details_page.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  late FocusNode myFocusNode;

  @override
  void initState() {
    controller.loadMovies();
    myFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFf3f7fc),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * .8,
              child: Observer(
                builder: (context) => controller.searchTerm.isNotEmpty
                    ? controller.searchResult.isEmpty
                        ? Center(
                            child: Text(
                              "Nenhum item corresponde a busca.",
                              style: TextStyle(fontSize: 16),
                            ),
                          )
                        : ListView.separated(
                            shrinkWrap: true,
                            itemCount: controller.searchResult.length,
                            separatorBuilder: (context, index) => SizedBox(
                              height: 10,
                            ),
                            itemBuilder: (context, index) => AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 1000),
                              child: SlideAnimation(
                                horizontalOffset: 50.0,
                                child: FadeInAnimation(
                                  child: CardMovieWidget(
                                    title: controller.searchResult[index].title,
                                    note: controller.searchResult[index].note,
                                    type: controller.searchResult[index].type,
                                    expanded: controller.expandedItemIndex == index ? true : false,
                                    description: controller.searchResult[index].description,
                                    onTap: () => controller.expandItem(index),
                                    onDismissed: (direction) {
                                      print(direction);
                                      if (direction == DismissDirection.horizontal) {}
                                      controller.removeMovie(index);
                                    },
                                    onDelete: () => controller.removeMovie(index),
                                    onTapDetails: () {},
                                  ),
                                ),
                              ),
                            ),
                          )
                    : ListView.separated(
                        padding: EdgeInsets.only(bottom: 80, top: 15),
                        shrinkWrap: true,
                        itemCount: controller.movies.length,
                        separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                        itemBuilder: (context, index) {
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 250),
                            child: SlideAnimation(
                              horizontalOffset: 50.0,
                              child: FadeInAnimation(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: OpenContainer(
                                    transitionType: ContainerTransitionType.fadeThrough,
                                    closedElevation: 0,
                                    closedShape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    transitionDuration: Duration(milliseconds: 300),
                                    openBuilder: (context, action) => DetailsPage(
                                      movie: controller.movies[index],
                                    ),
                                    closedBuilder: (context, action) => Observer(
                                      builder: (context) => CardMovieWidget(
                                        title: controller.movies[index].title,
                                        note: controller.movies[index].note,
                                        type: controller.movies[index].type,
                                        description: controller.movies[index].description,
                                        expanded: controller.expandedItemIndex == index ? true : false,
                                        onTap: () => controller.expandItem(index),
                                        onDismissed: (direction) {
                                          print(direction);
                                          if (direction == DismissDirection.horizontal) {}
                                          controller.removeMovie(index);
                                        },
                                        onDelete: () {
                                          return controller.removeMovie(index);
                                        },
                                        onTapDetails: () => action(),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * .2,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  offset: Offset(0, 5),
                  blurRadius: 10,
                ),
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.maxFinite,
                      height: 50,
                      child: Stack(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        alignment: Alignment.center,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: CircleAvatar(
                              backgroundImage: AssetImage('assets/avatar.png'),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            child: GestureDetector(
                              child: AnimatedCrossFade(
                                firstChild: Icon(Icons.search_rounded),
                                secondChild: Icon(Icons.close),
                                duration: Duration(milliseconds: 300),
                                crossFadeState: !controller.expandedSearchBar ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                              ),
                              onTap: () {
                                //showOverlay(context);
                                if (!controller.expandedSearchBar) {
                                  myFocusNode.requestFocus();
                                } else {
                                  FocusScope.of(context).unfocus();
                                  controller.clearSearch();
                                }
                                return controller.setExpandedSearchBar();
                              },
                            ),
                          ),
                          Positioned(
                            right: 20,
                            child: Observer(
                              builder: (_) => AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                width: controller.expandedSearchBar ? MediaQuery.of(context).size.width * .7 : 0,
                                height: 50,
                                child: Container(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: "Digite sua pesquisa",
                                    ),
                                    focusNode: myFocusNode,
                                    controller: controller.searchEditController,
                                    onChanged: (value) => controller.onSearch(value),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Progresso',
                      style: TextStyle(
                        color: Colors.grey.shade700,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Filmes e Series',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Observer(
                          builder: (context) => Text(
                            controller.searchTerm.isEmpty ? '${controller.movies.length}' : '${controller.searchResult.length}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: kMainColor,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: OpenContainer(
        transitionType: ContainerTransitionType.fade,
        transitionDuration: Duration(milliseconds: 500),
        closedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        closedBuilder: (context, action) => GestureDetector(
          onTap: () => action(),
          child: Container(
            color: kMainColor,
            height: 60,
            width: 60,
            child: Center(
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ),
        openBuilder: (context, action) => AddMoviePage(),
        tappable: false,
      ),
    );
  }
}
