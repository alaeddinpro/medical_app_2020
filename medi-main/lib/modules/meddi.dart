class Note {

  int _id;
  String _title;
  int _min;
  int _max;
  int _dosage;
  int _min1;
  int _max1;
  int _dosage1;
  int _min2;
  int _max2;
  int _dosage2;

  Note(this._title,this._min,this._max,this._dosage,this._min1,this._max1,this._dosage1,this._min2,this._max2,this._dosage2);

  Note.withId(this._id, this._title,this._min,this._max,this._dosage,this._min1,this._max1,this._dosage1,this._min2,this._max2,this._dosage2);

  int get id => _id;
  String get title => _title;
  int get min => _min;
  int get max => _max;
  int get dosage => _dosage;
  int get min1 => _min1;
  int get max1 => _max1;
  int get dosage1 => _dosage1;
  int get min2 => _min2;
  int get max2 => _max2;
  int get dosage2 => _dosage2;

  set title(String newTitle) {
    if (newTitle.length <= 255) {
      this._title = newTitle;
    }
  }

  set min(int newMin) {
      this._min = newMin;
  }
  set max(int newMax) {
    this._max = newMax;
  }
  set dosage(int newDosage) {
    this._dosage = newDosage;
  }
  set min1(int newMin1) {
    this._min1 = newMin1;
  }
  set max1(int newMax1) {
    this._max1 = newMax1;
  }
  set dosage1(int newDosage1) {
    this._dosage1 = newDosage1;
  }
  set min2(int newMin2) {
    this._min2 = newMin2;
  }
  set max2(int newMax2) {
    this._max2 = newMax2;
  }
  set dosage2(int newDosage2) {
    this._dosage2 = newDosage2;
  }
  // Convert a Note object into a Map object
  Map<String, dynamic> toMap() {

    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['title'] = _title;
    map['min'] = _min;
    map['max'] = _max;
    map['dosage'] = _dosage;
    map['min1'] = _min1;
    map['max1'] = _max1;
    map['dosage1'] = _dosage1;
    map['min2'] = _min2;
    map['max2'] = _max2;
    map['dosage2'] = _dosage2;
    return map;
  }

  // Extract a Note object from a Map object
  Note.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._title = map['title'];
    this._min = map['min'];
    this._max = map['max'];
    this._dosage = map['dosage'];
    this._min1 = map['min1'];
    this._max1 = map['max1'];
    this._dosage1 = map['dosage1'];
    this._min2 = map['min2'];
    this._max2 = map['max2'];
    this._dosage2 = map['dosage2'];
  }
}



