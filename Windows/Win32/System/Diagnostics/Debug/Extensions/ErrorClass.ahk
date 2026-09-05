#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
class ErrorClass extends Win32Enum {

    /**
     * Native name: ErrorClassWarning
     * @type {Integer (Int32)}
     */
    static Warning => 0

    /**
     * Native name: ErrorClassError
     * @type {Integer (Int32)}
     */
    static Error => 1
}
