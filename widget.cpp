#include "widget.h"
#include "ui_widget.h"


Widget::Widget(QWidget* parent, Qt::WindowFlags flags):
	QWidget(parent, flags),
	ui(new Ui::Widget),
	instance("inst", this)
{
	ui->setupUi(this);
	ui->label->setText(instance.getValue());
}

Widget::~Widget() {}