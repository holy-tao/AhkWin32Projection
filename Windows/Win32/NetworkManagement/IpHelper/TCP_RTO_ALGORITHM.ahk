#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
class TCP_RTO_ALGORITHM extends Win32Enum {

    /**
     * Native name: TcpRtoAlgorithmOther
     * @type {Integer (Int32)}
     */
    static Other => 1

    /**
     * Native name: TcpRtoAlgorithmConstant
     * @type {Integer (Int32)}
     */
    static Constant => 2

    /**
     * Native name: TcpRtoAlgorithmRsre
     * @type {Integer (Int32)}
     */
    static Rsre => 3

    /**
     * Native name: TcpRtoAlgorithmVanj
     * @type {Integer (Int32)}
     */
    static Vanj => 4

    /**
     * @type {Integer (Int32)}
     */
    static MIB_TCP_RTO_OTHER => 1

    /**
     * @type {Integer (Int32)}
     */
    static MIB_TCP_RTO_CONSTANT => 2

    /**
     * @type {Integer (Int32)}
     */
    static MIB_TCP_RTO_RSRE => 3

    /**
     * @type {Integer (Int32)}
     */
    static MIB_TCP_RTO_VANJ => 4
}
