#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Js
 */
class JsMemoryEventType extends Win32Enum {

    /**
     * Native name: JsMemoryAllocate
     * @type {Integer (Int32)}
     */
    static Allocate => 0

    /**
     * Native name: JsMemoryFree
     * @type {Integer (Int32)}
     */
    static Free => 1

    /**
     * Native name: JsMemoryFailure
     * @type {Integer (Int32)}
     */
    static Failure => 2
}
