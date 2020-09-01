import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../widgets/custom_drawer.dart';
import '../models/meal.dart';

class FavoritesScreen extends StatelessWidget {
  static const routeName = '/favorite_meals';
  final List<Meal> favoriteMeals;

  FavoritesScreen({this.favoriteMeals});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Favorites'),
        ),
        drawer: CustomDrawer(),
        body: favoriteMeals.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 3,
                    child: Image.network(
                      'https://crm.profaj.com/assets/img/noresult.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        'You have no favorites yet - start adding some!',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87.withOpacity(0.8)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              )
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 500,
                  childAspectRatio: 3 / 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                itemCount: favoriteMeals.length,
                itemBuilder: (context, index) {
                  return MealItem(
                    id: favoriteMeals[index].id,
                    title: favoriteMeals[index].title,
                    imgUrl: favoriteMeals[index].imageUrl,
                    duration: favoriteMeals[index].duration,
                    affordability: favoriteMeals[index].affordability,
                    complexity: favoriteMeals[index].complexity,
                  );
                },
              )
        /* : ListView.builder(
              itemBuilder: (ctx, index) {
                return MealItem(
                  id: favoriteMeals[index].id,
                  title: favoriteMeals[index].title,
                  imgUrl: favoriteMeals[index].imageUrl,
                  duration: favoriteMeals[index].duration,
                  affordability: favoriteMeals[index].affordability,
                  complexity: favoriteMeals[index].complexity,
                );
              },
              itemCount: favoriteMeals.length,
            ),*/
        );
  }
}
