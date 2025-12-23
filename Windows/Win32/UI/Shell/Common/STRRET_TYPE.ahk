#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell.Common
 * @version v4.0.30319
 */
class STRRET_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static STRRET_WSTR => 0

    /**
     * @type {Integer (Int32)}
     */
    static STRRET_OFFSET => 1

    /**
     * @type {Integer (Int32)}
     */
    static STRRET_CSTR => 2
}
