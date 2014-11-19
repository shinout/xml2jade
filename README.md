xml2jade
==========
simple converter
converts xml to jade


installation
----------------
```bash
$ npm install xml2jade
```

usage
-------------
```js
xml2jade = require("xml2jade");
jadeTxt = xml2jade.run("xmlfile.xml")
```

```js
jadeTxt = xml2jade.parse("<Tag1>xxxx</Tag1>")
```

```bash
$ xml2jade xmlfile.xml
```
