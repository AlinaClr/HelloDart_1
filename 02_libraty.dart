/*
 * @Author: your name
 * @Date: 2022-04-21 10:55:25
 * @LastEditTime: 2022-04-21 10:56:57
 * @LastEditors: your name
 * @Description: 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 * @FilePath: /HelloDart_1/02_libraty.dart
 */
void dart_core()
{
  //控制台答应
  tea = 'longjin';
  print('I drink $tea');
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
  assert('Never odd or even'.startWith('Never'));
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
  assert('WEB APPS'.tolowerCase() == 'web apps');
  //Trimming和空字符串
  assert(' hello '.trim() == 'hello');
  assert(''.isEmpty);
  assert('  '.isNotEmpty);
}