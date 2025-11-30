#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class WBEM_GET_KEY_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WBEMPATH_TEXT => 1

    /**
     * @type {Integer (Int32)}
     */
    static WBEMPATH_QUOTEDTEXT => 2
}
