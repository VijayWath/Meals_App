# Meals_App
There is one certain Animation that is not working 
below is the code for that animation ,
If anyone can fix it , please let me know

 icon: AnimatedSwitcher(
                transitionBuilder: (child, animation) {
                  return RotationTransition(
                    turns: Tween<double>(begin: 0.5, end: 1).animate(animation),
                    child: child,
                  );
                },
                duration: Duration(microseconds: 300),
                child: Icon(
                  isFavorite ? Icons.star : Icons.star_border,
                  key: ValueKey(isFavorite),
                ),
              ),
            ),
            
Location : meals/screens/meal_details.dart
