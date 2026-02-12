#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify IP protocols (numeric values).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnipprotocol
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class VpnIPProtocol extends Win32Enum{

    /**
     * Specifies no protocol.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Transmission Control Protocol (TCP)
     * @type {Integer (Int32)}
     */
    static Tcp => 6

    /**
     * User Datagram Protocol (UDP)
     * @type {Integer (Int32)}
     */
    static Udp => 17

    /**
     * Internet Control Message Protocol (ICMP)
     * @type {Integer (Int32)}
     */
    static Icmp => 1

    /**
     * Internet Protocol version 6 (IPv6) Internet Control Message Protocol (ICMP)
     * @type {Integer (Int32)}
     */
    static Ipv6Icmp => 58

    /**
     * Internet Group Management Protocol (IGMP)
     * @type {Integer (Int32)}
     */
    static Igmp => 2

    /**
     * Pragmatic General Multicast (PGM)
     * @type {Integer (Int32)}
     */
    static Pgm => 113
}
