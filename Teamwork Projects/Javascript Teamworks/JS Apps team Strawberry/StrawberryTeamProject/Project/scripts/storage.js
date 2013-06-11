﻿var storage = (function () {

    var save = function (key, value) {
        return localStorage.setObject(key, value);
    }

    var load = function (key) {
        return localStorage.getObject(key);
    }

    var clear = function () {
        localStorage.clear();
    }

    var remove = function (key) {
        localStorage.removeItem(key);
    }

    return {
        save: save,
        load: load,
        clear: clear,
        remove: remove,
    }
}())