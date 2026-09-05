#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
class PNRP_EXTENDED_PAYLOAD_TYPE extends Win32Enum {

    /**
     * Native name: PNRP_EXTENDED_PAYLOAD_TYPE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: PNRP_EXTENDED_PAYLOAD_TYPE_BINARY
     * @type {Integer (Int32)}
     */
    static BINARY => 1

    /**
     * Native name: PNRP_EXTENDED_PAYLOAD_TYPE_STRING
     * @type {Integer (Int32)}
     */
    static STRING => 2
}
