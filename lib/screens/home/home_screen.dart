import 'package:flutter/material.dart';
import 'package:foodie/constants.dart';
import 'package:foodie/demoData.dart';

import 'components/image_carousal.dart';
import 'components/restaurent_info_medium_card.dart';
import 'components/section_title.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //i am  use custom scrollbar
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            floating: true,
            title: Column(
              children: [
                Text(
                  "Delivery to".toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(color: kActiveColor),
                ),
                const Text(
                  "San Francisco",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  "filter",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
          //we can't use all widgets directly here
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            sliver: SliverToBoxAdapter(
              child: ImageCarousal(),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(defaultPadding),
            sliver: SliverToBoxAdapter(
              child: SectionTitle(
                title: "Feature partner",
                press: () {},
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(demoMediumCardData.length, (index) {
                  var restaurantData = demoMediumCardData[index];
                  return Padding(
                    padding: const EdgeInsets.only(left: defaultPadding),
                    child: RestaurantInfoMediumCard(
                      title: restaurantData['name'] ?? '', // Provide default value
                      location: restaurantData['location'] ?? '', // Provide default value
                      image: restaurantData['image'] ?? '', // Provide default value
                      deliveryTime: restaurantData['deliveryTime'] ?? 0, // Provide default value
                      rating: restaurantData['rating'] ?? 0.0, // Provide default value
                      press: () {},
                    ),
                  );
                }),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(defaultPadding),
            sliver: SliverToBoxAdapter(
              child: Image.asset("assets/images/Banner.png"),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(defaultPadding),
            sliver: SliverToBoxAdapter(
              child: SectionTitle(
                title: "Best Pick",
                press: () {},
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(demoMediumCardData.length, (index) {
                  var restaurantData = demoMediumCardData[index];
                  return Padding(
                    padding: const EdgeInsets.only(left: defaultPadding),
                    child: RestaurantInfoMediumCard(
                      title: restaurantData['name'] ?? '', // Provide default value
                      location: restaurantData['location'] ?? '', // Provide default value
                      image: restaurantData['image'] ?? '', // Provide default value
                      deliveryTime: restaurantData['deliveryTime'] ?? 0, // Provide default value
                      rating: restaurantData['rating'] ?? 0.0, // Provide default value
                      press: () {},
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

