#include "myclass.h"

MyClass::MyClass(QString val, QObject *parent):
	QObject(parent)
{
	value = val;
}



MyClass::~MyClass() 
{}



QString MyClass::getValue() const
{
	return value;
}