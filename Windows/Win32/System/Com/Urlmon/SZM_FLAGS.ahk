#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
class SZM_FLAGS extends Win32Enum {

    /**
     * Native name: SZM_CREATE
     * @type {Integer (Int32)}
     */
    static CREATE => 0

    /**
     * Native name: SZM_DELETE
     * @type {Integer (Int32)}
     */
    static DELETE => 1
}
