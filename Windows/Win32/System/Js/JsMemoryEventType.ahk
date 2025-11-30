#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Js
 * @version v4.0.30319
 */
class JsMemoryEventType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static JsMemoryAllocate => 0

    /**
     * @type {Integer (Int32)}
     */
    static JsMemoryFree => 1

    /**
     * @type {Integer (Int32)}
     */
    static JsMemoryFailure => 2
}
