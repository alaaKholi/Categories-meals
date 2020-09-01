import 'dart:io';

import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/meal_details';
  final Function toggleFavorite;
  final Function isFavorite;

  MealDetailsScreen({this.toggleFavorite, this.isFavorite});

  @override
  Widget build(BuildContext context) {
    final mealData =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final selectedMeal =
        DUMMY_MEALS.firstWhere((meal) => meal.id == mealData['id']);
    final mealId = mealData['id'];
    final complexity = mealData['complexity'];
    final affordability = mealData['affordability'];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  selectedMeal.imageUrl,
                  height: MediaQuery.of(context).size.height * 0.45,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.45,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Colors.black87.withOpacity(0.001),
                            Colors.black87.withOpacity(0.15),
                            Colors.black87.withOpacity(0.4),
                            Colors.black87.withOpacity(0.55),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.3, 0.45, 0.65, 0.8])),
                ),
                Positioned(
                  top: 10,
                  right: 20,
                  left: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        // icon: Icon(Platform.isIOS
                        //   ? Icons.arrow_back_ios
                        // : Icons.arrow_back),
                        icon: Icon(Icons.arrow_back),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      IconButton(
                        icon: Icon(Icons.share),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 0,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${selectedMeal.duration} min',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Text(
                              selectedMeal.title,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: IconButton(
                                icon: Icon(
                                  isFavorite(mealId)
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  toggleFavorite(mealId);
                                },
                              ))
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _buildWrapper(complexity),
                  _buildWrapper(affordability),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ingredients',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                    ),
                  ),
                  Column(
                    children: selectedMeal.ingredients.map((e) {
                      return ListTile(
                        title: Text(e),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Steps',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                      child: Column(
                    children: List.generate(
                      selectedMeal.steps.length,
                      (int index) {
                        return Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                radius: 25,
                                backgroundColor: Theme.of(context).primaryColor,
                                child: Text(
                                  '#${index + 1}',
                                  textScaleFactor: 1.5,
                                ),
                              ),
                              title: Text('${selectedMeal.steps[index]}'),
                            ),
                            SizedBox(
                              height: 20,
                              child: Divider(
                                color: Colors.grey[300],
                                thickness: 0.5,
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  )
                      /*ListView.separated(
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 20,
                          child: Divider(
                            color: Colors.grey[300],
                            thickness: 0.5,
                          ),
                        );
                      },
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            radius: 25,
                            backgroundColor: Theme.of(context).primaryColor,
                            child: Text(
                              '#${index + 1}',
                              textScaleFactor: 1.5,
                            ),
                          ),
                          title: Text('${selectedMeal.steps[index]}'),
                        );
                      },
                      itemCount: selectedMeal.steps.length,
                    ),*/
                      )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildWrapper(String childText) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.blue[50],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        '#$childText',
        textScaleFactor: 1.2,
        style: TextStyle(
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
