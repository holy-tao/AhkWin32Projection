#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class WINSOCK_SOCKET_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SOCK_STREAM => 1

    /**
     * @type {Integer (Int32)}
     */
    static SOCK_DGRAM => 2

    /**
     * @type {Integer (Int32)}
     */
    static SOCK_RAW => 3

    /**
     * @type {Integer (Int32)}
     */
    static SOCK_RDM => 4

    /**
     * @type {Integer (Int32)}
     */
    static SOCK_SEQPACKET => 5
}
