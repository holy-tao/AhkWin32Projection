#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class ICMP4_TIME_EXCEED_CODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ICMP4_TIME_EXCEED_TRANSIT => 0

    /**
     * @type {Integer (Int32)}
     */
    static ICMP4_TIME_EXCEED_REASSEMBLY => 1
}
