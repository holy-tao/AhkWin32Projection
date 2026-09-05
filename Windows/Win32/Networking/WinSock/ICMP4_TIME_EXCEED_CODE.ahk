#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
class ICMP4_TIME_EXCEED_CODE extends Win32Enum {

    /**
     * Native name: ICMP4_TIME_EXCEED_TRANSIT
     * @type {Integer (Int32)}
     */
    static TRANSIT => 0

    /**
     * Native name: ICMP4_TIME_EXCEED_REASSEMBLY
     * @type {Integer (Int32)}
     */
    static REASSEMBLY => 1
}
