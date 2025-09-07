#Requires AutoHotkey v2.0.0 64-bit

/**
 * The IP_PREFIX_ORIGIN enumeration specifies the origin of an IPv4 or IPv6 address prefix, and is used with the IP_ADAPTER_UNICAST_ADDRESS structure.
 * @remarks
 * The <b>IP_PREFIX_ORIGIN</b> enumeration is used in the <b>PrefixOrigin</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/iptypes/ns-iptypes-ip_adapter_unicast_address_lh">IP_ADAPTER_UNICAST_ADDRESS</a>  structure.
  * 
  * On the Microsoft Windows Software Development Kit (SDK) released for Windows Vista and later, the organization of header files has changed and the <b>IP_PREFIX_ORIGIN</b> enumeration is defined in the <i>Nldef.h</i> header file which is automatically included by the <i>Iptypes.h</i> header file. In order to use the <b>IP_PREFIX_ORIGIN</b> enumeration, the <i>Winsock2.h</i> header file must be included before the <i>Iptypes.h</i> header file.
 * @see https://learn.microsoft.com/windows/win32/api/nldef/ne-nldef-nl_prefix_origin
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class NL_PREFIX_ORIGIN{

    /**
     * The IP prefix was provided by a source other than those defined in this enumeration.
     * @type {Integer (Int32)}
     */
    static IpPrefixOriginOther => 0

    /**
     * The IP address prefix was manually specified.
     * @type {Integer (Int32)}
     */
    static IpPrefixOriginManual => 1

    /**
     * The IP address prefix is from a well known source.
     * @type {Integer (Int32)}
     */
    static IpPrefixOriginWellKnown => 2

    /**
     * The IP address prefix was provided by DHCP settings.
     * @type {Integer (Int32)}
     */
    static IpPrefixOriginDhcp => 3

    /**
     * The IP address prefix was obtained through a router advertisement (RA).
     * @type {Integer (Int32)}
     */
    static IpPrefixOriginRouterAdvertisement => 4

    /**
     * The IP address prefix should be unchanged. This value is used when setting the properties for a unicast IP interface when the value for the IP prefix origin should be left unchanged.
 * 
 * 
 * 
 * <div class="alert"><b>Note</b>  This enumeration value is only available on Windows Vista and later.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static IpPrefixOriginUnchanged => 16
}
