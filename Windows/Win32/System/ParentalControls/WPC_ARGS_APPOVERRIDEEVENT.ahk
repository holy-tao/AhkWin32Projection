#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ParentalControls
 */
class WPC_ARGS_APPOVERRIDEEVENT extends Win32Enum {

    /**
     * Native name: WPC_ARGS_APPOVERRIDEEVENT_USERID
     * @type {Integer (Int32)}
     */
    static USERID => 0

    /**
     * Native name: WPC_ARGS_APPOVERRIDEEVENT_PATH
     * @type {Integer (Int32)}
     */
    static PATH => 1

    /**
     * Native name: WPC_ARGS_APPOVERRIDEEVENT_REASON
     * @type {Integer (Int32)}
     */
    static REASON => 2

    /**
     * Native name: WPC_ARGS_APPOVERRIDEEVENT_CARGS
     * @type {Integer (Int32)}
     */
    static CARGS => 3
}
