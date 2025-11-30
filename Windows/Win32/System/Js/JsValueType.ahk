#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Js
 * @version v4.0.30319
 */
class JsValueType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static JsUndefined => 0

    /**
     * @type {Integer (Int32)}
     */
    static JsNull => 1

    /**
     * @type {Integer (Int32)}
     */
    static JsNumber => 2

    /**
     * @type {Integer (Int32)}
     */
    static JsString => 3

    /**
     * @type {Integer (Int32)}
     */
    static JsBoolean => 4

    /**
     * @type {Integer (Int32)}
     */
    static JsObject => 5

    /**
     * @type {Integer (Int32)}
     */
    static JsFunction => 6

    /**
     * @type {Integer (Int32)}
     */
    static JsError => 7

    /**
     * @type {Integer (Int32)}
     */
    static JsArray => 8
}
