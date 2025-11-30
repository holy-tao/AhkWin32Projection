#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.WinTrust
 * @version v4.0.30319
 */
class WINTRUST_DATA_UICHOICE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static WTD_UI_ALL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WTD_UI_NONE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WTD_UI_NOBAD => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WTD_UI_NOGOOD => 4
}
