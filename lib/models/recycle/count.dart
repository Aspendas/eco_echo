import 'package:shared_preferences/shared_preferences.dart';

class CounterStorage {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<int> readCounter() async {
    final prefs = await _prefs;
    return prefs.getInt('counter') ?? 0;
  }

  Future<void> incrementCounter(int increamentValue) async {
    final prefs = await _prefs;
    int counter = (prefs.getInt('counter') ?? 0) + increamentValue;
    await prefs.setInt('counter', counter);
  }

  Future<void> resetCounter() async {
    final prefs = await _prefs;
    await prefs.setInt('counter', 0);
  }
}
