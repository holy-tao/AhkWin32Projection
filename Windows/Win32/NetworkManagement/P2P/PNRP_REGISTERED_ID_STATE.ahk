#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PNRP_REGISTERED_ID_STATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PNRP_REGISTERED_ID_STATE_OK => 1

    /**
     * @type {Integer (Int32)}
     */
    static PNRP_REGISTERED_ID_STATE_PROBLEM => 2
}
