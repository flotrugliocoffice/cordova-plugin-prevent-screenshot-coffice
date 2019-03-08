var screenshot = {
  enable: function (successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, 'screenshotName', 'enable', []);
  },
  disable: function (successCallback, errorCallback) {
    cordova.exec(successCallback, errorCallback, 'screenshotName', 'disable', []);
  }
}

cordova.addConstructor(function () {
  if (!window.plugins) {window.plugins = {};}

  window.plugins.preventscreenshot = screenshot;
  return window.plugins.preventscreenshot;
});