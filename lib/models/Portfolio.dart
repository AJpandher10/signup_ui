class Portfolio {
  int age;
  String goals;
  int income ;
  bool maried;

  Portfolio() {
    age = 0;
    goals = "";
    income = 0;
    maried = false;
  }

  Portfolio.tobject(Map map) {
    age = map['age'];
    goals = map['goals'];
    income = map['income'];
    maried = map['maried'];
  }

  Map getMap() {
    Map<String, dynamic> map = Map();
    map['age'] = age;
    map['goals'] = goals;
    map['income'] = income;
    map['maried'] = maried;
    return map;
  }

  @override
  String toString() {
    return 'Portfolio{age: $age, goals: $goals, income: $income, maried: $maried}';
  }
}
