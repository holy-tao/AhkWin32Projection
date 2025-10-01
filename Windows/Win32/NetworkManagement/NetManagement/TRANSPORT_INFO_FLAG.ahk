#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class TRANSPORT_INFO_FLAG{

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
