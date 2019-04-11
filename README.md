# cordova-plugin-prevent-screenshot-coffice

This is a cordova plugin to enable/disable screenshots in android and ios 

## Supported Platforms

- Android API all versions
- IOS all versions

## Installation

Cordova local build:
    cordova plugin add <GIT URL PATH>




## Usage in javascript

```js
document.addEventListener("deviceready", onDeviceReady, false);
// Enable
function onDeviceReady() {
  window.plugins.preventscreenshot.enable(successCallback, errorCallback);
}
// Disable
function onDeviceReady() {
  window.plugins.preventscreenshot.disable(successCallback, errorCallback);
}

function successCallback(result) {
  console.log(result); // true - enabled, false - disabled
}

function errorCallback(error) {
  console.log(error);
}


document.addEventListener("onTookScreenshot",function(){
// Receive notification when screenshot is ready;
});

document.addEventListener("onGoingBackground",function(){
// Receive notification when control center or app going in background.
});

```



## Usage in typescript

```ts

// Enable
  (<any>window).plugins.preventscreenshot.enable((a) => this.successCallback(a), (b) => this.errorCallback(b));

// Disable
  (<any>window).plugins.preventscreenshot.disable((a) => this.successCallback(a), (b) => this.errorCallback(b));

  successCallback(result) {
    console.log(result); // true - enabled, false - disabled
  }

  errorCallback(error) {
    console.log(error);
  }

```
