#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that describe a level of supported IP. The values reflect the [WWAN_IP_TYPE](/windows-hardware/drivers/ddi/content/wwan/ne-wwan-_wwan_ip_type) enumeration. You can use these values to determine which cellular profile to use (for example, to choose between IMS and SUPL).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.wwannetworkipkind
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class WwanNetworkIPKind extends Win32Enum{

    /**
     * Default support; indicates no specific level of support.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Indicates support for IPv4.
     * @type {Integer (Int32)}
     */
    static Ipv4 => 1

    /**
     * Indicates support for IPv6.
     * @type {Integer (Int32)}
     */
    static Ipv6 => 2

    /**
     * Indicates support for IPv4 with IPv6.
     * @type {Integer (Int32)}
     */
    static Ipv4v6 => 3

    /**
     * Indicates support for 464XLAT (which allows clients on IPv6-only networks to access IPv4-only Internet services).
     * @type {Integer (Int32)}
     */
    static Ipv4v6v4Xlat => 4
}
