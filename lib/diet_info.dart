import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'weight_loss_diet_screen.dart'; // Import your diet screens
import 'weight_gain_diet_screen.dart';

class DietInfoScreen extends StatefulWidget {
  @override
  _DietInfoScreenState createState() => _DietInfoScreenState();
}

class _DietInfoScreenState extends State<DietInfoScreen> {
  String? _dietGoal;
  String? _activityLevel;
  String? _mealPreference;
  int _mealsPerDay = 3;
  int _waterIntake = 2000;
  String? _dietaryRestrictions;

  final Color bloodRed = Color(0xFFB00000);

  final List<Map<String, dynamic>> _dietGoals = [
    {'icon': FontAwesomeIcons.weightScale, 'label': 'Lose Fat'},
    {'icon': FontAwesomeIcons.dumbbell, 'label': 'Gain Muscle'},
    {'icon': FontAwesomeIcons.appleWhole, 'label': 'Maintain Health'},
  ];

  final List<Map<String, dynamic>> _activityLevels = [
    {'icon': FontAwesomeIcons.personWalking, 'label': 'Sedentary'},
    {'icon': FontAwesomeIcons.personRunning, 'label': 'Moderate'},
    {'icon': FontAwesomeIcons.personBiking, 'label': 'Very Active'},
  ];

  final List<Map<String, dynamic>> _mealPreferences = [
    {'icon': FontAwesomeIcons.bowlRice, 'label': 'Balanced'},
    {'icon': FontAwesomeIcons.egg, 'label': 'High Protein'},
    {'icon': FontAwesomeIcons.leaf, 'label': 'Plant-based'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(16, 40, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Diet Profile',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 20),
              _buildSectionTitle('What is your diet goal?'),
              _buildRadioGroup(_dietGoals, (value) => setState(() => _dietGoal = value)),
              _buildSectionTitle('What is your activity level?'),
              _buildRadioGroup(_activityLevels, (value) => setState(() => _activityLevel = value)),
              _buildSectionTitle('What is your meal preference?'),
              _buildRadioGroup(_mealPreferences, (value) => setState(() => _mealPreference = value)),
              _buildInputField('Meals per day', (value) => setState(() => _mealsPerDay = int.tryParse(value) ?? 3)),
              _buildInputField('Daily water intake (ml)', (value) => setState(() => _waterIntake = int.tryParse(value) ?? 2000)),
              _buildInputField('Dietary restrictions', (value) => setState(() => _dietaryRestrictions = value)),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  child: Text(
                    'Generate Diet Plan',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: bloodRed,
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: _generateDietPlan, // Call the function to handle navigation
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  Widget _buildRadioGroup(List<Map<String, dynamic>> options, Function(String) onChanged) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: options.map((option) {
        bool isSelected = _dietGoal == option['label'] || _activityLevel == option['label'] || _mealPreference == option['label'];
        return GestureDetector(
          onTap: () => onChanged(option['label']),
          child: Container(
            width: (MediaQuery.of(context).size.width - 52) / 3,
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: isSelected ? bloodRed : Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FaIcon(
                  option['icon'],
                  size: 24,
                  color: isSelected ? Colors.white : bloodRed,
                ),
                SizedBox(height: 8),
                Text(
                  option['label'],
                  style: TextStyle(
                    color: isSelected ? Colors.white : bloodRed,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildInputField(String label, Function(String) onChanged) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          Expanded(
            flex: 3,
            child: TextField(
              keyboardType: label.contains('restrictions') ? TextInputType.text : TextInputType.number,
              style: TextStyle(color: bloodRed),
              cursorColor: bloodRed,
              decoration: InputDecoration(
                labelText: label,
                labelStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: bloodRed, width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                hoverColor: bloodRed.withOpacity(0.1),
                fillColor: bloodRed.withOpacity(0.1),
                filled: true,
              ),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }

  void _generateDietPlan() {
    if (_dietGoal == 'Lose Fat') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WeightLossDietScreen()),
      );
    } else if (_dietGoal == 'Gain Muscle') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WeightGainDietScreen()),
      );
    } else {
      // Default or other cases, you can handle them as needed
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select a valid diet goal.')),
      );
    }
  }
}
