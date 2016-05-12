# Coditor

[![NPM](https://img.shields.io/npm/v/coditor.svg)](https://www.npmjs.com/package/coditor)
[![Downloads](https://img.shields.io/npm/dm/coditor.svg)](http://npm-stat.com/charts.html?package=coditor)

coditor is a multi-tab code editor as a web component based on [riot.js](http://riotjs.com/) and [ace.js](https://ace.c9.io/#nav=about)

[try online](http://plnkr.co/edit/4rhHUTo2VQlzDaMIlAmu?p=preview)

### installation
`bower install coditor --save`

### How to use (Browser)

**a)** add coditor tag on the html body:

```html
<body>
    <!-- place the coditor tag anywhere inside the body -->
    <coditor></coditor>
</body>
```

**b)** add links scripts for ace.js and riot+compiler:

```html
<body>

    <!-- place the coditor tag anywhere inside the body -->
    <coditor></coditor>

    <script src="static/js/ace.js"></script>
    <script src="static/js/riot+compiler.min.js"></script>

    <!-- or -->
    <!--
    <script src="https://cdn.jsdelivr.net/ace/1.2.3/noconflict/ace.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/riot/2.4.0/riot+compiler.min.js"></script>
    -->

    <!-- script coditor tag-->
    <script src="bower_components/coditor/coditor.tag" type="riot/tag"></script>

</body>
```

**c)**  When you add coditor tag you can mount it on the page as follows:

```html
<body>

    <!-- place the coditor tag anywhere inside the body -->
    <coditor></coditor>

    <script src="static/js/ace.js"></script>
    <script src="static/js/riot+compiler.min.js"></script>
    <script src="bower_components/coditor/coditor.tag" type="riot/tag"></script>

    <!-- mount coditor -->
    <script>
         riot.mount('coditor', options);
     </script>
</body>
```

### Options

When you mount a tag of riot you must pass, in the second argument, options as a object that contain settings for coditor.

 - lang: Is a string. You must specified language programming that is support for ace.js. (javascript, java, php, c, c++, scala, etc).
 - tabs: Is an Array that containt objects. Each object represent a tab in coditor.
      - title [String]:  Tab title
      - checked [String] (optional) : 'checked'
      - editor [Object]:
	      - id [String]: Allow identify a editor into tab
	      - code [String] (optional): is a code or algorithm.

### Important

coditor manually  lets you add 10 tabs (manually was added into css style). But if you want to add more tabs, you must add css style manually in two places.
```css
.....
.....
....
.cc-tabs > .tab7:checked ~ ul .tab7,
.cc-tabs > .tab8:checked ~ ul .tab8,
.cc-tabs > .tab9:checked ~ ul .tab9,

you must add another line With the same syntax shown above.
....
....
```

```css
.....
.....
....
.cc-tabs-height-auto > .tab7:checked ~ ul .tab7,
.cc-tabs-height-auto > .tab8:checked ~ ul .tab8,
.cc-tabs-height-auto > .tab9:checked ~ ul .tab9,

.....
.....
....
```

Any ideas to changes this behavior?

### Examples

#### With a single tab

```html
<!doctype html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>coditor</title>
    </head>
    <body>

        <coditor></coditor>

        <script src="https://cdn.jsdelivr.net/ace/1.2.3/noconflict/ace.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/riot/2.4.0/riot+compiler.min.js"></script>
        <script src="bower_components/coditor/coditor.tag" type="riot/tag"></script>
        <script>
            riot.mount('coditor', {
                lang: 'javascript',
                tabs: [{
                    title: 'Tab 1',
                    checked: 'checked',
                    editor: {
                        id: 'test',
                        code: 'function(){\n\tconsole.log("coditor");\n}'
                    }
                }]
            });
        </script>
    </body>
</html>

```
**_Screenshot_**

![example1](https://raw.githubusercontent.com/davidenq/coditor/master/img/coditor1.png)

#### Multiple tabs.

```html
<!doctype html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>coditor</title>
    </head>
    <body>

        <coditor></coditor>

        <script src="https://cdn.jsdelivr.net/ace/1.2.3/noconflict/ace.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/riot/2.4.0/riot+compiler.min.js"></script>
        <script src="coditor/coditor.tag" type="riot/tag"></script>
        <script>
            riot.mount('coditor', {
                lang: 'java',
                tabs: [{
                    title: 'Tab 1',
                    checked: 'checked',
                    editor: {
                        id: 'test',
                        code: ''
                    }
                }, {
                    title: 'Tab 2',
                    editor: {
                        id: 'code',
                        code: 'public class Hello{\n\tpublic static void main(String[] args) {\n\t\tSystem.out.println("coditor")\n\t} \n}'
                    }
                }]
            });
        </script>
    </body>
</html>

```
**_Screenshot_**

![example2](https://raw.githubusercontent.com/davidenq/coditor/master/img/coditor2.png)

![example3](https://raw.githubusercontent.com/davidenq/coditor/master/img/coditor3.png)

### How to use (Server side)

```npm install coditor --save```
coditor is hosted also in npm. If you install coditor via npm, you must copy the coditor folder into node_module to bower_components or static folder or anywhere folder, because coditor is not support to render with riot in server side yet.

### Support

If you need help using coditor, or have found a bug, please create an issue on the [GitHub repo](https://github.com/davidenq/coditor/issues)
### License

MIT Licence


### Credits

The coditor css style used a design by Mahesh with several modifications. The original design is hosted in codepen [here] (http://codepen.io/maheshambure21/pen/VvxWLZ).
