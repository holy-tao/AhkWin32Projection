#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
class LocalKind extends Win32Enum {

    /**
     * Native name: LocalArgument
     * @type {Integer (Int32)}
     */
    static Argument => 0

    /**
     * Native name: LocalVariable
     * @type {Integer (Int32)}
     */
    static Variable => 1
}
