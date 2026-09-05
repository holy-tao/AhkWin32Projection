#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
class PNRP_REGISTERED_ID_STATE extends Win32Enum {

    /**
     * Native name: PNRP_REGISTERED_ID_STATE_OK
     * @type {Integer (Int32)}
     */
    static OK => 1

    /**
     * Native name: PNRP_REGISTERED_ID_STATE_PROBLEM
     * @type {Integer (Int32)}
     */
    static PROBLEM => 2
}
