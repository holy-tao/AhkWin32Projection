#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class TRANSPORT_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UseTransportType_None => 0

    /**
     * @type {Integer (Int32)}
     */
    static UseTransportType_Wsk => 1

    /**
     * @type {Integer (Int32)}
     */
    static UseTransportType_Quic => 2
}
