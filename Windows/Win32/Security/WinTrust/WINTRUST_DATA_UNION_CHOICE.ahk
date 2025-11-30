#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.WinTrust
 * @version v4.0.30319
 */
class WINTRUST_DATA_UNION_CHOICE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static WTD_CHOICE_FILE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WTD_CHOICE_CATALOG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WTD_CHOICE_BLOB => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WTD_CHOICE_SIGNER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WTD_CHOICE_CERT => 5
}
