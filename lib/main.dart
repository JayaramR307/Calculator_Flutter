import 'package:flutter/material.dart';

void main() => runApp(Calculator());
class Calculator extends StatefulWidget{
  @override
  CalculatorState createState() =>CalculatorState();
  }

class CalculatorState extends State<Calculator> {
  double num1=0.0;
  double num2=0.0;
  String output='0';
  String _output='0';
  bool flag;
  String operand;
  String a='';
  buttonPressed(String buttonText){
      if(buttonText=='AC')
        {
          a='';
          _output='0';
          output='0';
          num1=0;
          num2=0;
        }
      else if(buttonText=='C')
      {
        _output='0';
      }
      else if(buttonText=='+/-')
      {
        _output='-'+_output;
        output='0';
        num1=0;
        num2=0;
      }
      else if(buttonText=='/' || buttonText=='+' || buttonText=='-' || buttonText=='x')
      {
        if (flag==false){
          num2=double.parse(output);
          if(operand=='+')
            {
              _output=(num1+num2).toString();
            }
          else if(operand=='-')
          {
            _output=(num1-num2).toString();
          }
          else if(operand=='x')
          {
            _output=(num1*num2).toString()
            ;
          }else if(operand=='/')
          {
            _output=(num1/num2).toString();
          }
          num1=0;num2=0;

        }
        num1 =double.parse(output);
        if(buttonText=='x')
          {
            a=a+'x';
          }
        else
        {
          a=a+buttonText;
        }
        operand=buttonText;
        _output='0';

      }
      else if(buttonText=='.'){
        if(_output.contains('.'))
          {
            print("Contains Decimal");
          }
        else
          {
            _output=_output+buttonText;
            a=a+buttonText;
          }
      }
      else if(buttonText=='='){
            num2=double.parse(output);
            if(operand=='+')
            {
              _output=(num1+num2).toString();
            }
            else if(operand=='-')
            {
              _output=(num1-num2).toString();
            }
            else if(operand=='x')
            {
              _output=(num1*num2).toString();
            }else if(operand=='/')
            {
              _output=(num1/num2).toString();
            }
            num1=0;num2=0;
      }
      else{
        _output=_output+buttonText;
        a=a+buttonText;
      }
      setState((){
output=double.parse(_output).toString();
      });
  }
  Widget button(String txt ,int val){
    Color col;
    return Expanded(
      child: FlatButton(padding:EdgeInsets.all(20),color: (val==2)?Colors.blueAccent:Colors.black,
          onPressed: ()=> buttonPressed(txt), child: Text(txt,style: TextStyle(color: Colors.white,fontSize: 30,)
          )),
    );
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculator'),backgroundColor: Colors.blue,
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.black,
                  child: Text(a,textAlign: TextAlign.end,style: TextStyle(color: Colors.white,fontSize: 50,),),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.black,
                  child: Text(output,textAlign: TextAlign.end,style: TextStyle(color: Colors.white,fontSize: 50,),),
                ),
              ),
              Row(
                children: <Widget>[
                  button('AC',1),
                  button( 'C',1),
                  button( '+/-',1
                  ),
                  button('/', 2),
                ],
              ),
              Row(
                children: <Widget>[
                  button('7',1),
                  button('8',1),
                  button('9',1),
                  button('x',2),
                ],
              ),
              Row(
                children: <Widget>[
                  button('4',1),
                  button('5',1),
                  button('6',1),
                  button('-',2),
                ],
              ),
              Row(
                children: <Widget>[
                  button('1',1),
                  button('2',1),
                  button('3',1),
                  button('+',2),
                ],
              ),
              Row(
                children: <Widget>[
                  button('.',1),
                  button('0',1),
                  button('00',1),
                  button('=',2),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/*class button extends StatelessWidget {
  button({this.txt,this.val}){
    if(val==2)
      {
        col=Colors.blueAccent;
      }
    else{
      col=Colors.black;
    }
  }
  final String txt;
  final int val;
  Color col;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton(padding:EdgeInsets.all(20),color: col,
      onPressed: (){

      }, child: Text(txt,style: TextStyle(color: Colors.white,fontSize: 30,)
      )),
    );
  }
}*/
