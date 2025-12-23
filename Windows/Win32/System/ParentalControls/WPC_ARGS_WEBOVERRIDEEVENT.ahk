#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ParentalControls
 * @version v4.0.30319
 */
class WPC_ARGS_WEBOVERRIDEEVENT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_WEBOVERRIDEEVENT_USERID => 0

    /**
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_WEBOVERRIDEEVENT_URL => 1

    /**
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_WEBOVERRIDEEVENT_REASON => 2

    /**
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_WEBOVERRIDEEVENT_CARGS => 3
}
