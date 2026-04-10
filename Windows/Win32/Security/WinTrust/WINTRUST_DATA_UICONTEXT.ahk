#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
class WINTRUST_DATA_UICONTEXT extends Win32Enum {

    /**
     * @type {Integer (UInt32)}
     */
    static WTD_UICONTEXT_EXECUTE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WTD_UICONTEXT_INSTALL => 1
}
