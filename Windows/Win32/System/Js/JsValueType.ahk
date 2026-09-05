#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Js
 */
class JsValueType extends Win32Enum {

    /**
     * Native name: JsUndefined
     * @type {Integer (Int32)}
     */
    static Undefined => 0

    /**
     * Native name: JsNull
     * @type {Integer (Int32)}
     */
    static Null => 1

    /**
     * Native name: JsNumber
     * @type {Integer (Int32)}
     */
    static Number => 2

    /**
     * Native name: JsString
     * @type {Integer (Int32)}
     */
    static String => 3

    /**
     * Native name: JsBoolean
     * @type {Integer (Int32)}
     */
    static Boolean => 4

    /**
     * Native name: JsObject
     * @type {Integer (Int32)}
     */
    static Object => 5

    /**
     * Native name: JsFunction
     * @type {Integer (Int32)}
     */
    static Function => 6

    /**
     * Native name: JsError
     * @type {Integer (Int32)}
     */
    static Error => 7

    /**
     * Native name: JsArray
     * @type {Integer (Int32)}
     */
    static Array => 8
}
