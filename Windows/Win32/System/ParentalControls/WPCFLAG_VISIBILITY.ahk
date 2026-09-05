#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ParentalControls
 */
class WPCFLAG_VISIBILITY extends Win32Enum {

    /**
     * Native name: WPCFLAG_WPC_VISIBLE
     * @type {Integer (Int32)}
     */
    static WPC_VISIBLE => 0

    /**
     * Native name: WPCFLAG_WPC_HIDDEN
     * @type {Integer (Int32)}
     */
    static WPC_HIDDEN => 1
}
