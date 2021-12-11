import 'dart:core';
import 'dart:math';
import 'package:calculadora_idade/enum/animais.dart';

String FuncaoCalculo(Animal tipoAnimal,int mes,int ano){
  final int anoAtual = new DateTime.now().year;
  final int indexMesAtual =new DateTime.now().month;
  double idadeCalculada =  (anoAtual-ano)*12.0+(mes-indexMesAtual).abs() ;
  switch(tipoAnimal){
    case Animal.cachorro:
      return ((16*log(idadeCalculada/12)+31).toInt()).toString();
    case Animal.gato:
      if(idadeCalculada<= 1){
        return ((15*idadeCalculada/12.0).toInt()).toString();
      }
      else if(idadeCalculada <= 2){
        return ((10.0/12.0*(idadeCalculada-12.0)+15).toInt()).toString();
      }
      else{
        return (((idadeCalculada-24)*4.0/12.0+25).toInt()).toString();
      }
  }
}