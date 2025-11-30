#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_spbeginf
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class _SPBEGINF extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SPBEGINF_NORMAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static SPBEGINF_AUTOTIME => 2

    /**
     * @type {Integer (Int32)}
     */
    static SPBEGINF_NOPROGRESSBAR => 16

    /**
     * @type {Integer (Int32)}
     */
    static SPBEGINF_MARQUEEPROGRESS => 32

    /**
     * @type {Integer (Int32)}
     */
    static SPBEGINF_NOCANCELBUTTON => 64
}
