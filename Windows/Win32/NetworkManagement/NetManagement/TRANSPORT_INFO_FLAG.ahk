#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
class TRANSPORT_INFO_FLAG extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static NoneFlag => 0

    /**
     * @type {Integer (Int32)}
     */
    static TcpPortSetFlag => 1

    /**
     * @type {Integer (Int32)}
     */
    static QuicPortSetFlag => 2

    /**
     * @type {Integer (Int32)}
     */
    static RdmaPortSetFlag => 4
}
