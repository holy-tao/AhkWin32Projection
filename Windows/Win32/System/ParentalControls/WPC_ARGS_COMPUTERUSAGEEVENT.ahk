#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ParentalControls
 */
class WPC_ARGS_COMPUTERUSAGEEVENT extends Win32Enum {

    /**
     * Native name: WPC_ARGS_COMPUTERUSAGEEVENT_ID
     * @type {Integer (Int32)}
     */
    static ID => 0

    /**
     * Native name: WPC_ARGS_COMPUTERUSAGEEVENT_TIMEUSED
     * @type {Integer (Int32)}
     */
    static TIMEUSED => 1

    /**
     * Native name: WPC_ARGS_COMPUTERUSAGEEVENT_CARGS
     * @type {Integer (Int32)}
     */
    static CARGS => 2
}
