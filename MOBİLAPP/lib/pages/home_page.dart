import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/components/my_cake_tile.dart';
import 'package:untitled1/components/my_current_location.dart';
import 'package:untitled1/components/my_description_box.dart';
import 'package:untitled1/components/my_drawer.dart';
import 'package:untitled1/components/my_sliver_app_bar.dart';
import 'package:untitled1/components/my_tab_bar.dart';
import 'package:untitled1/models/cake.dart';

import '../models/restaurant.dart';
import 'cake_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  //tab controller
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =TabController(length: CakeCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

//sort out and return a list of cake items that belong to a specific category
  List<Cake> _filterMenuByCategory(CakeCategory category, List<Cake> fullMenu) {
    return fullMenu.where((cake) => cake.category==category).toList();
  }

  //return list of cakes in given category
  List<Widget> getCakeInThisCategory(List<Cake>fullMenu){
   return CakeCategory.values.map((category) {

     //get category menu
     List<Cake> categoryMenu = _filterMenuByCategory(category, fullMenu);

     return ListView.builder(
       itemCount: categoryMenu.length,
       physics: const NeverScrollableScrollPhysics(),
       padding: EdgeInsets.zero,
       itemBuilder: (context, index){
         //get individual cake
         final cake=categoryMenu[index];

         //return cake tile UI
         return CakeTile(
             cake: cake,
             onTap: () =>Navigator.push(
                 context,
                 MaterialPageRoute(
                     builder: (context) => CakePage(cake:cake),
                 ),
             ),
         );
       },
     );
   }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      drawer: const MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
              title:MyTabBar(tabController: _tabController),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                    indent: 25,
                    endIndent: 25,
                    color: Theme.of(context).colorScheme.secondary,
                  ),


                  // switch
                  const MyCurrentLocation(),

                  //description box
                  const MyDescriptionBox()



              ],
              ),
          ),
        ],
        body:Consumer<Restaurant>(
          builder: (context, restaurant, child) => TabBarView(
          controller: _tabController,
          children: getCakeInThisCategory(restaurant.menu),
        ),
        ) ,
      ),
    );
  }
}
