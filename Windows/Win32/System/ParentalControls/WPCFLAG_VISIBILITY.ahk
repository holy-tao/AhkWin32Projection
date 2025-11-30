#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ParentalControls
 * @version v4.0.30319
 */
class WPCFLAG_VISIBILITY extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WPCFLAG_WPC_VISIBLE => 0

    /**
     * @type {Integer (Int32)}
     */
    static WPCFLAG_WPC_HIDDEN => 1
}
