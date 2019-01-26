#ifndef ApplicationUI_HPP_
#define ApplicationUI_HPP_

#include <QObject>

namespace bb {
	namespace cascades {
		class Application;
		class LocaleHandler;
	}
}

class QTranslator;

/*!
 * @brief Application object
 *
 *
 */

class ApplicationUI: public QObject {
Q_OBJECT
public:
	ApplicationUI(bb::cascades::Application *app);
	virtual ~ApplicationUI() {
	}
public:
	Q_INVOKABLE void copyText(QString text);
	Q_INVOKABLE QString getText();
private slots:
	void onSystemLanguageChanged();
private:
	QTranslator* m_pTranslator;
	bb::cascades::LocaleHandler* m_pLocaleHandler;
};


#endif /* ApplicationUI_HPP_ */
