История изменений
==================

0.2.0
-----

* Исправлена работа генартора на Windows OS.
* Переход на использование [enb-bem-techs](http://ru.bem.info/tools/bem/enb-bem-techs/) при генерации проэктов на [ENB](https://github.com/enb-make/enb).
* Исправлена конфигурация шаблонизаторов на [ENB](https://github.com/enb-make/enb).
* Исправлена генерация файлов `.gitignore` и `bower.json`.
* Удалены технологии:
 * ie6.css
 * ie7.css
 * [Roole](https://github.com/curvedmark/roole)

0.1.1
-----

* Исправлена генерация конфига для технологии `node.js`.

0.1.0
-----

* Переход на использование [Stylus](https://github.com/LearnBoost/stylus) в качестве CSS-препроцессора по умолчанию в библиотеке [bem-components](http://ru.bem.info/libs/bem-components/current/).
* Переименована опция `no-deps` в `skip-install`.
* Отрефакторены вопросы к пользоателю:
 * Создан отдельный вопрос о шаблонизаторах для сборщика [bem-tools](http://ru.bem.info/tools/bem/bem-tools/).
 * Создан отдельный вопрос об [Автопрефиксере](https://github.com/postcss/autoprefixer).
* Исправлена генерация файла `bemjson.js`. Не имеет значия, какой сборщик вы используете, `bemjson.js` будет сгенерирован одинаковый в обоих случаях.
* Обновлены версии зависимостей и библиотек.
* Исправлены баги.
