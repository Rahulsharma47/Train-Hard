import 'package:flutter/material.dart';

class WeightGainDietScreen extends StatelessWidget {
  final Color bloodRed = Color(0xFFB00000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildDayCard('Monday', [
            'Breakfast: Oatmeal with banana, almonds, and protein powder',
            'Snack: Greek yogurt with mixed berries and granola',
            'Lunch: Grilled chicken breast, brown rice, and roasted vegetables',
            'Snack: Whole grain toast with avocado and hard-boiled egg',
            'Dinner: Salmon fillet, sweet potato, and steamed broccoli',
            'Before bed: Casein protein shake with milk',
          ]),
          _buildDayCard('Tuesday', [
            'Breakfast: Whole grain pancakes with peanut butter and sliced banana',
            'Snack: Trail mix (nuts, dried fruits, and dark chocolate chips)',
            'Lunch: Lean beef burger on whole grain bun with side salad',
            'Snack: Protein smoothie (milk, protein powder, banana, and spinach)',
            'Dinner: Grilled steak, quinoa, and grilled zucchini',
            'Before bed: Cottage cheese with sliced almonds',
          ]),
          _buildDayCard('Wednesday', [
            'Breakfast: Scrambled eggs with cheese, whole grain toast, and avocado',
            'Snack: Apple slices with almond butter',
            'Lunch: Tuna salad sandwich on whole grain bread with carrot sticks',
            'Snack: Protein bar and a banana',
            'Dinner: Chicken stir-fry with mixed vegetables and brown rice',
            'Before bed: Greek yogurt with honey and walnuts',
          ]),
          _buildDayCard('Thursday', [
            'Breakfast: Protein smoothie bowl topped with granola and chia seeds',
            'Snack: Hummus with whole grain crackers and cherry tomatoes',
            'Lunch: Grilled chicken Caesar salad with whole grain croutons',
            'Snack: Hard-boiled eggs and an orange',
            'Dinner: Baked cod, roasted potatoes, and asparagus',
            'Before bed: Peanut butter on whole grain toast',
          ]),
          _buildDayCard('Friday', [
            'Breakfast: Whole grain bagel with cream cheese and smoked salmon',
            'Snack: Handful of mixed nuts and dried fruit',
            'Lunch: Turkey and avocado wrap with sweet potato fries',
            'Snack: Chocolate milk and a banana',
            'Dinner: Lean beef stir-fry with vegetables and noodles',
            'Before bed: Casein protein shake with almond milk',
          ]),
          _buildDayCard('Saturday', [
            'Breakfast: Breakfast burrito (eggs, cheese, bacon, and avocado)',
            'Snack: Protein smoothie (milk, protein powder, peanut butter, and banana)',
            'Lunch: Grilled chicken pesto pasta with sun-dried tomatoes',
            'Snack: Rice cakes with almond butter and banana slices',
            'Dinner: Grilled sirloin steak, baked potato, and grilled vegetables',
            'Before bed: Greek yogurt with granola and berries',
          ]),
          _buildDayCard('Sunday', [
            'Breakfast: French toast with mixed berries and maple syrup',
            'Snack: Protein bar and an apple',
            'Lunch: Grilled cheese sandwich with tomato soup',
            'Snack: Cottage cheese with pineapple chunks',
            'Dinner: Roast chicken, mashed potatoes, and steamed vegetables',
            'Before bed: Peanut butter and banana sandwich on whole grain bread',
          ]),
        ],
      ),
    );
  }

  Widget _buildDayCard(String day, List<String> meals) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              day,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            ...meals.map((meal) => Padding(
              padding: EdgeInsets.only(bottom: 4),
              child: Text('• $meal'),
            )),
          ],
        ),
      ),
    );
  }
}