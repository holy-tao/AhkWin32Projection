#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
class TUNNEL_SUB_TYPE extends Win32Enum {

    /**
     * Native name: TUNNEL_SUB_TYPE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: TUNNEL_SUB_TYPE_CP
     * @type {Integer (Int32)}
     */
    static CP => 1

    /**
     * Native name: TUNNEL_SUB_TYPE_IPTLS
     * @type {Integer (Int32)}
     */
    static IPTLS => 2

    /**
     * Native name: TUNNEL_SUB_TYPE_HA
     * @type {Integer (Int32)}
     */
    static HA => 3
}
