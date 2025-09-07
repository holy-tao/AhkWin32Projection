#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the IP address type.
 * @see https://learn.microsoft.com/windows/win32/api/sessdirpublictypes/ne-sessdirpublictypes-tssd_addrv46type
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class TSSD_AddrV46Type{

    /**
     * The IP address is not valid.
     * @type {Integer (Int32)}
     */
    static TSSD_ADDR_UNDEFINED => 0

    /**
     * The address is in IPv4 format.
     * @type {Integer (Int32)}
     */
    static TSSD_ADDR_IPv4 => 4

    /**
     * The address is in IPv6 format.
     * @type {Integer (Int32)}
     */
    static TSSD_ADDR_IPv6 => 6
}
