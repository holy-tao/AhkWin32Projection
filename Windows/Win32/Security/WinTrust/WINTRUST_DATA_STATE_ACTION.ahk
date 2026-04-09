#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
class WINTRUST_DATA_STATE_ACTION extends Win32Enum {

    /**
     * @type {Integer (UInt32)}
     */
    static WTD_STATEACTION_IGNORE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WTD_STATEACTION_VERIFY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WTD_STATEACTION_CLOSE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WTD_STATEACTION_AUTO_CACHE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WTD_STATEACTION_AUTO_CACHE_FLUSH => 4
}
