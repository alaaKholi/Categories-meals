import 'package:flutter/material.dart';
import '../screens/meal_details_screen.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String imgUrl;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem({
    this.id,
    this.imgUrl,
    this.title,
    this.duration,
    this.complexity,
    this.affordability,
  });
  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Expensive';
        break;
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    //  final _mediaQuery = MediaQuery.of(context);
    return InkWell(
        onTap: () {
          Navigator.of(context)
              .pushNamed(MealDetailsScreen.routeName, arguments: {
            'id': id,
            'affordability': affordabilityText,
            'complexity': complexityText,
          });
        },
        child: Container(
          //  height: _mediaQuery.orientation == Orientation.portrait
          //    ? _mediaQuery.size.height * 0.4
          //  : _mediaQuery.size.height * 0.8,
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    spreadRadius: 3,
                    blurRadius: 6,
                    offset: Offset(1, 1))
              ],
              border: Border.all(color: Colors.white12)),
          child: Stack(
            fit: StackFit.expand,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network(
                  imgUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  // height: _mediaQuery.orientation == Orientation.portrait
                  //   ? _mediaQuery.size.height * 0.12
                  // : _mediaQuery.size.height * 0.25,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white.withOpacity(0.65),
                          spreadRadius: 3,
                          blurRadius: 16,
                          offset: Offset(1, 1))
                    ],
                  ),
                  child: Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FittedBox(
                          child: Text(
                            title,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        FittedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.schedule,
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text('$duration min'),
                                ],
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Icon(
                                    Icons.work,
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  FittedBox(
                                    child: Text(complexityText),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Icon(
                                    Icons.attach_money,
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  FittedBox(child: Text(affordabilityText)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
