#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PNRP_EXTENDED_PAYLOAD_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PNRP_EXTENDED_PAYLOAD_TYPE_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static PNRP_EXTENDED_PAYLOAD_TYPE_BINARY => 1

    /**
     * @type {Integer (Int32)}
     */
    static PNRP_EXTENDED_PAYLOAD_TYPE_STRING => 2
}
