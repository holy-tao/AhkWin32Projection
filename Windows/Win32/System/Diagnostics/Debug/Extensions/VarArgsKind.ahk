#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
class VarArgsKind extends Win32Enum {

    /**
     * Native name: VarArgsNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: VarArgsCStyle
     * @type {Integer (Int32)}
     */
    static ArgsCStyle => 1
}
