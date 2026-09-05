#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class SHGFP_TYPE extends Win32Enum {

    /**
     * Native name: SHGFP_TYPE_CURRENT
     * @type {Integer (Int32)}
     */
    static CURRENT => 0

    /**
     * Native name: SHGFP_TYPE_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 1
}
