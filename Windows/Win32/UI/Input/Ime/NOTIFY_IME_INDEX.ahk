#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class NOTIFY_IME_INDEX extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static CPS_CANCEL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CPS_COMPLETE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CPS_CONVERT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CPS_REVERT => 3
}
