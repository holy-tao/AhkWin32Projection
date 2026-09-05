#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
class JsDebugReadMemoryFlags extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: JsDebugAllowPartialRead
     * @type {Integer (Int32)}
     */
    static AllowPartialRead => 1
}
