#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Js
 */
class JsRuntimeVersion extends Win32Enum {

    /**
     * Native name: JsRuntimeVersion10
     * @type {Integer (Int32)}
     */
    static Version10 => 0

    /**
     * Native name: JsRuntimeVersion11
     * @type {Integer (Int32)}
     */
    static Version11 => 1

    /**
     * Native name: JsRuntimeVersionEdge
     * @type {Integer (Int32)}
     */
    static Edge => -1
}
