#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ParentalControls
 * @version v4.0.30319
 */
class WPC_ARGS_COMPUTERUSAGEEVENT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_COMPUTERUSAGEEVENT_ID => 0

    /**
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_COMPUTERUSAGEEVENT_TIMEUSED => 1

    /**
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_COMPUTERUSAGEEVENT_CARGS => 2
}
