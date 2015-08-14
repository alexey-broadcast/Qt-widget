#ifndef CLASS_H
#define CLASS_H

#include <QObject>

class MyClass : public QObject
{
Q_OBJECT
public:
	explicit MyClass(QString val, QObject *parent = 0);
	~MyClass();

	QString getValue() const;
private:
	QString value;
};

#endif