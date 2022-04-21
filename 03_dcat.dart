/*
 * @Author: your name
 * @Date: 2022-04-21 08:09:54
 * @LastEditTime: 2022-04-21 08:45:14
 * @LastEditors: Please set LastEditors
 * @Description: 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 * @FilePath: /HelloDart_1/03_dcat.dart
 */
import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';

const lineNumber = 'line-number';

void main(List<String> args){
  exitCode = 0;

  final parser = ArgParser();
  parser.addFlag(lineNumber,negetable: false, abbr: 'n');

  ArgParser argResults = parser.parse(args);
  final paths = argResults.rest;

  dcat(paths,showLineNumbers: argResults[lineNumber] as bool);
  
  print('done');
}