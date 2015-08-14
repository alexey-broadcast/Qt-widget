#ifndef WIDGET_H
#define WIDGET_H

#include <QWidget>
#include "myclass.h"

namespace Ui
{
	class Widget;
};

class Widget: public QWidget
{
Q_OBJECT
public:
	explicit Widget(QWidget* = 0, Qt::WindowFlags = 0);
	~Widget();

private:
	Ui::Widget* ui;
	MyClass instance;
};

#endif