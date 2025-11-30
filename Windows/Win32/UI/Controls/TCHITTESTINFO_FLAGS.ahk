#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class TCHITTESTINFO_FLAGS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static TCHT_NOWHERE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TCHT_ONITEM => 6

    /**
     * @type {Integer (UInt32)}
     */
    static TCHT_ONITEMICON => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TCHT_ONITEMLABEL => 4
}
