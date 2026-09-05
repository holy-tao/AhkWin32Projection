#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell.Common
 */
class STRRET_TYPE extends Win32Enum {

    /**
     * Native name: STRRET_WSTR
     * @type {Integer (Int32)}
     */
    static WSTR => 0

    /**
     * Native name: STRRET_OFFSET
     * @type {Integer (Int32)}
     */
    static OFFSET => 1

    /**
     * Native name: STRRET_CSTR
     * @type {Integer (Int32)}
     */
    static CSTR => 2
}
