#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
class EContextType extends Win32Enum {

    /**
     * Native name: eCurrentContext
     * @type {Integer (Int32)}
     */
    static CurrentContext => 0

    /**
     * Native name: eRestrictedContext
     * @type {Integer (Int32)}
     */
    static RestrictedContext => 1
}
