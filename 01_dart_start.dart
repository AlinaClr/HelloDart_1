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

void main(List<String> args){
    variables();
    var year = 2010;
    var flybyObjects = ['Jupiter','Saturn','Uranus','Neptune'];
    control_flow(year, flybyObjects);
    var result = fibonacci(20);
    print(result);
}

