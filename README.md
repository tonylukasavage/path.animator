*kind of* maintained by [@jasonkneen](https://twitter.com/#!/jasonkneen)

# path.animator

A simple Appcelerator Titanium iOS module for adding CABasicAnimation rotations to standard Titanium Views.

## Why?

iOS transforms are specified as matrices. These matrices are the result of trigonometric calculations, which results in a limitation in the range of values you can specify for rotation values. For example, on iOS, the transforms can't make distinction between a rotation of 180 degrees or 0 degrees. The matrix values are the same. 

Android does not have this limitation. This is not a result of how Titanium implements these features, it is a limitation of iOS. A quick google search will show that native developers have issues with this as well.

In order to work around iOS's limitations, this module uses the more powerful CABasicAnimation class to perform more advanced animations. The only one we will be leveraging in this module, as this module is specific to the [pathmenu.js](https://github.com/tonylukasavage/pathmenu.js) project, is the ability to support rotations greater than 180 degrees, just like Android can already do.

## How?

Check out the [example/app.js](https://github.com/tonylukasavage/path.animator/blob/master/example/app.js) for usage. In case you are too lazy to look...

```javascript
var window = Ti.UI.createWindow({
    backgroundColor:'white'
});

var my_module = require('path.animator');
var foo = my_module.createView({
  	backgroundColor: '#f00',
  	width: 100,
  	height: 100
});

var image = Ti.UI.createImageView({
	image: 'http://appcodingeasy.com/cms.design/images/appcelerator.png',
  	width: 100,
  	height: 100
});
foo.add(image);


foo.addEventListener('click', function() {
	foo.rotate({
		angle: 360,
		duration: 3000,
		delay: 1000,
		repeat:10,
		//timingFunction: Ti.UI.iOS.ANIMATION_CURVE_EASE_OUT
	});
});
 
window.add(foo);
window.open();
```

Be sure to add the module entry in tiapp.xml in your own project:

```xml
<modules>
    <module platform="iphone" version="1.0">path.animator</module>
</modules>
```

## Problems?

Leave an issue in the [Issues section](https://github.com/tonylukasavage/path.animator/issues) of this project. Be as specific as possible. Please include the following information:

* Titanium SDK version
* Target platform (better be iOS!)
* Any relevant code
* A test case

**HINT:** If you provide a repeatable test case, your issue goes right to the top of my todo list.
