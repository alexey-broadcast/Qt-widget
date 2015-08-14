#include <QApplication>
#include <iostream>
#include "widget.h"


int main(int argv, char** args)
{
	QApplication app(argv, args);

	Widget w;
	w.show();

	return app.exec();
}