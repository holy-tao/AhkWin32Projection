#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * The type of a [HostName](hostname.md) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.hostnametype
 * @namespace Windows.Networking
 * @version WindowsRuntime 1.4
 */
class HostNameType extends Win32Enum{

    /**
     * A domain name.
     * @type {Integer (Int32)}
     */
    static DomainName => 0

    /**
     * An IPv4 address.
     * @type {Integer (Int32)}
     */
    static Ipv4 => 1

    /**
     * An IPv6 address.
     * @type {Integer (Int32)}
     */
    static Ipv6 => 2

    /**
     * A Bluetooth address. This represents the hardware or media access control (MAC) address for a Bluetooth device.
     * @type {Integer (Int32)}
     */
    static Bluetooth => 3
}
