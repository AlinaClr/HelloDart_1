void variables(){
    var name = 'Voyager I';
    var year = 1977;
    var antennaDiameter = 3.7;
    var flybyObjects = ['Jupiter','Saturn','Uranus','Neptune'];
    var image = {
       'tags' : ['saturn'],
       'url' : '//path/to/saturn.jap'
    };

    print(
        'name is $name,year is $year,antennaDiameter is $antennaDiameter,flybyObjects is $flybyObjects,image is $image'
    );
}

void control_flow(var year,var flybyObjects){
  if (year >= 2001){
    print('21 st century');
  }else if(year >= 1901){
    print('20th century');
  }

  for(final object in flybyObjects){
    print(object);
  }
  
  for(int month = 1;month <= 12;month++){
    print(month);
  }

  while(year < 2016){
    year += 1;
  }
}

int fibonacci(int n){
  if(n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

class Spacecraft{
  String name;
  DateTime? launchDate;

  int? get launchYear => launchDate?.year;

  Spacecraft(this.name,this.launchDate){
    //TODO : init.
  }

  Spacecraft.unlaunched(String name) : this(name,null);

  void describe(){
    print('Spacecraft: $name');

    var launchDate = this.launchDate;
    if(launchDate != null){
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    }else{
      print('Unlaunched');
    }
  }
}

//扩展类
class Orbiter extends Spacecraft{
  double altitude;

  Orbiter(String name,DateTime launchDate,this.altitude)
     : super(name,launchDate);

  //重写父类方法
  @override
  void describe(){
    super.describe();
    print('altitude is $altitude km');
  }
}

void inheritance(){
  var obt = Orbiter('天宫号',DateTime(2021,4,29),389.2);
  obt.describe();
}

//Minxin语法，注入
mixin Piloted{
  int astronauts = 1;

  void describeCrew(){
    print('Number of astronauts: $astronauts');
  }
}

void mixins(){
  var plt = PilotedCraft('神舟一号',DateTime(1999,11,20));
  plt.describe();
  plt.describeCrew();
}

void main(List<String> args){
    variables();
    var year = 2010;
    var flybyObjects = ['Jupiter','Saturn','Uranus','Neptune'];
    control_flow(year, flybyObjects);
    var result = fibonacci(20);
    print(result);
    var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
    voyager.describe();

    var voyager3 = Spacecraft.unlaunched('Voyager III');
    voyager3.describe();
}
