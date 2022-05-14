import 'dart:math';

//数字、集合、字符串等
void dart_core()
{
  print('\n');
  print('*'*40);
  print('数字、集合、字符串等');
  print('*'*40);

  //数字
  assert(int.parse('42') == 42);
  assert(int.parse('0x42') == 66);
  assert(double.parse('0.50') == 0.5);

  assert(num.parse('42') is int);
  assert(num.parse('0x42') is int);
  assert(num.parse('0.50') is double);

  //通过添加radix参数，指定整数的进制基数
  assert(int.parse('42',radix : 16) == 66);

  //将整型或双精度浮点类型转换为字符串
  assert(42.toString() == '42');
  assert(123.456.toString() == '123.456');
  assert(123.456.toStringAsFixed(2) == '123.46');
  assert(123.456.toStringAsPrecision(2) == '1.2e+2');
  assert(double.parse('1.2e+2') == 120.0);

  //字符和正则表达式
  //在字符串中搜索
  assert('Never odd or even'.contains('odd'));
  assert('Never odd or even'.startsWith('Never'));
  assert('Never odd or even'.endsWith('even'));
  assert('Never odd or even'.indexOf('odd') == 6);

  //从字符串中提取数据
  assert('Never odd or even'.substring(6,9) == 'odd');

  //用空格隔开一个字符串
  var parts = 'progressive web apps'.split(' ');
  assert(parts.length == 3);
  assert(parts[0] == 'progressive');
  assert('Never odd or even'[0] == 'N');
  for(final char in 'hello'.split('')){
    print(char);
  }
  var codeUnitList = 'Never odd or even'.codeUnits.toList();
  assert(codeUnitList[0] == 78);

  //首字母大小写转换
  assert('web apps'.toUpperCase() == 'WEB APPS');
  assert('WEB APPS'.toLowerCase() == 'web apps');

  //Trimming和空字符串
  assert(' hello '.trim() == 'hello');
  assert(''.isEmpty);
  assert('  '.isNotEmpty);

  //替换部分字符串
  var greetingTemplate = 'Hello, NAME!';
  var greeting = greetingTemplate.replaceAll(RegExp('NAME'),'Bob');
  assert(greeting != greetingTemplate);

  //构建一个字符串
  var sb = StringBuffer();
  sb
    ..write('Use a StringBuffer for')
    ..writeAll(['efficient','string','creation'],' ')
    ..write('.');
  
  var fullstring = sb.toString();
  assert(fullstring == 'Use a StringBuffer for efficient string creation.');
  var numbers = RegExp(r'\d+');
  var allCharacters = 'llamas live fifteen to twenty years';
  var someDigits = 'llamas live 15 to 20 years';
  assert(!allCharacters.contains(numbers));
  assert(someDigits.contains(numbers));
}

void the_lists(){
  var grains = <String>[];
  assert(grains.isEmpty);

  //构造一个列表
  var fruits = ['apples','oranges'];
  fruits.add('kiwis');
  fruits.addAll(['grapes','bananas']);
  assert(fruits.length == 5);
  var appleIndex = fruits.indexOf('apples');
  fruits.removeAt(appleIndex);
  assert(fruits.length == 4);
  fruits.clear();
  assert(fruits.isEmpty);

  var vegetables = List.filled(99,'broccoli');
  assert(vegetables.every((v) => v == 'broccoli'));
  fruits = ['bananas','apples','oranges'];
  //给列表排序
  fruits.sort((a,b) => a.compareTo(b));
  assert(fruits[0] == 'apples');
  fruits = <String>[];
  fruits.add('apples');
  var fruit = fruits[0];
  assert(fruit is String);
}

//集合
void the_sets(){
  //构造一个空的集合
  var ingredients = <String>{};
  //向集合里添加元素
  ingredients.addAll(['gold','titanium','xenon']);
  assert(ingredients.length == 3);
  //添加一个重复的元素没有什么用
  ingredients.add('gold');
  assert(ingredients.length == 3);
  //移除元素
  ingredients.remove('gold');
  assert(ingredients.length == 2);
  //也可以用构造函数构造一个集合
  var atomicNumbers = Set.from([79,22,54]);
  assert(atomicNumbers.length == 3);

  ingredients = Set<String>();
  ingredients.addAll(['gold','titanium','xenon']);
  
  //求两个集合的交
  var nobleGases = Set.from(['xenon','argon']);
  var intersection = ingredients.intersection(nobleGases);
  assert(intersection.length == 1);
  assert(intersection.contains('xenon'));
}

void the_maps(){
  //maps经常被看做键值对
  var hawaiianBeaches = {
    'Oahu':['Waikiki','Kailua','Waimanalo'],
    'Big Island':['Wailea Bay','Pololu Beach'],
    'Kauai':['Hanalei','Poipu']
  };
  var searchTerms = Map();
  //规定键和值的类型
  var nobleGases = Map<int,String>();
  nobleGases = {54:'xenon'};//惰性气体
  assert(nobleGases[54] == 'xenon');
  assert(nobleGases.containsKey(54));
  nobleGases.remove(54);
  assert(!nobleGases.containsKey(54));

  //获取所有的键
  var keys = hawaiianBeaches.keys;
  assert(keys.length == 3);
  assert(Set.from(keys).contains('Oahu'));

  //获取所有的值
  var values = hawaiianBeaches.values;
  assert(values.length == 3);
  assert(values.any((v) => v.contains('Waikiki')));

  assert(hawaiianBeaches.containsKey('Oahu'));
  assert(!hawaiianBeaches.containsKey('Florida'));

  var teamAssignments = <String,String>{};
  String pickToughestKid(){
    return "pickToughestKid";
  }

  teamAssignments.putIfAbsent('Catcher',()=>pickToughestKid());
  assert(teamAssignments['Catcher'] != null);
}

void the_public_methods(){
  var coffees = <String>[];
  var teas = ['green','black','chamomile','earl grey'];
  assert(coffees.isEmpty);
  assert(teas.isNotEmpty);

  teas = ['green','black','chamomile','earl grey'];
  teas.forEach((tea) => print('I drink $tea'));

  var hawaiianBeaches = {
  'Oahu':['Waikiki','Kailua','Waimanalo'],
  'Big Island':['Wailea Bay','Pololu Beach'],
  'Kauai':['Hanalei','Poipu']
  };
  hawaiianBeaches.forEach((k,v){
    print('I want to visit $k and swim at $v');
  });

  var loudTeas = teas.map((tea) => tea.toUpperCase());
  loudTeas.forEach(print);
  var loudTeas_str = loudTeas = teas.map((tea) => tea.toUpperCase()).toList();
  print(loudTeas_str);

  bool isDecaffeinated(String teaName) => teaName == 'chamomile';
  //用where（）找出返回TRUE的唯一一个元素
  var decaffeinatedTeas = teas.where((tea) => isDecaffeinated(tea));
  //用any()检查集合中是否至少有一个元素满足函数
  assert(teas.any(isDecaffeinated));
  assert(!teas.every(isDecaffeinated));
}

void collections(){
  print('\n');
  print('*'*40);
  print('集合');
  print('*'*40);

  the_lists();
  the_sets();
  the_maps();
  the_public_methods();
}

//时间与日期
void dates_and_times(){
  print('\n');
  print('*'*40);
  print('时间和日期');
  print('*'*40);

  var now = DateTime.now();
  var y2k = DateTime(2000);
  y2k = DateTime(2000,1,2);
  y2k = DateTime.utc(2000);
  y2k = DateTime.fromMillisecondsSinceEpoch(946684800000, isUtc: true);
  y2k = DateTime.parse('2000-01-01T00:00:00Z');
  y2k = DateTime.utc(2000);
  assert(y2k.millisecondsSinceEpoch == 946684800000);
  var unixEpoch = DateTime.utc(1970);
  assert(unixEpoch.millisecondsSinceEpoch == 0);
  y2k = DateTime.utc(2000);
  var y2001 = y2k.add(const Duration(days:366));
  assert(y2001.year == 2001);

  var december2000 = y2001.subtract(const Duration(days:30));
  assert(december2000.year == 2000);
  assert(december2000.month == 12);

  var duration = y2001.difference(y2k);
  assert(duration.inDays == 366);
}

//数学与随机数
void math_and_random(){
  print('\n');
  print('*'*40);
  print('数学与随机数');
  print('*'*40);

  assert(cos(pi) == -1.0);
  var degrees = 30;
  var radians = degrees * (pi / 180);
  var sinOf30degrees = sin(radians);
  assert((sinOf30degrees - 0.5).abs() < 0.01);

  assert(max(1,1000) == 1000);
  assert(min(1,-1000) == -1000);

  print(e);
  print(pi);
  print(sqrt2);

  var random = Random();
  var value1 = random.nextDouble();
  print('nextDouble: $value1');
  var value2 = random.nextInt(10);
  print('nextInt:$value2');
  var value3 = random.nextBool();
  print('nextbool:$value3');
}

void main(List<String> args){
  dart_core();
  collections();
  dates_and_times();
  math_and_random();
  print('done.');
} 