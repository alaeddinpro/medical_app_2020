class PatMap {
  int _id;
  String _nom;
  String _prenom;
  int _age;
  double _taill;
  double _poids;
  String _date;
  int _priority;

  PatMap(this._nom, this._prenom, this._age, this._taill, this._poids, this._priority);

  PatMap.withId(this._id, this._nom, this._prenom, this._age, this._taill, this._poids, this._priority,);

  int get id => _id;
  String get nom => _nom;
  String get prenom => _prenom;
  int get age => _age;
  double get taill => _taill;
  double get poids => _poids;
  int get priority => _priority;

  set id(int id) {
    this._id= id;
  }

  set nom(String nom) {
    this._nom = nom;
  }

  set prenom(String prenom) {
    this._prenom = prenom;
  }

  set age(int age) {
    this._age = age;
  }

  set taill(double taill) {
    this._taill = taill;
  }

  set poids(double poids) {
    this._poids = poids;
  }

  set priority(int priority) {
    this._priority = priority;
  }

  // Convert a Note object into a Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_id!= null) {
      map['id'] = _id;
    }
    map['nom'] = _nom;
    map['prenom'] = _prenom;
    map['age'] = _age;
    map['taill'] = _taill;
    map['poids'] = _poids;
    map['priority'] = _priority;

    return map;
  }

  // Extract a Note object from a Map object
  PatMap.fromMapObject(Map<String, dynamic> map) {
    this._id= map['id'];
    this._nom = map['nom'];
    this._prenom = map['prenom'];
    this._age = map['age'];
    this._taill = map['taill'];
    this._poids = map['poids'];
    this._priority = map['priority'];
  }
}
