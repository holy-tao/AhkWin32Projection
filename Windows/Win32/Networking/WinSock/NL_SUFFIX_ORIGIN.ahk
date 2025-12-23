#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The IP_SUFFIX_ORIGIN enumeration specifies the origin of an IPv4 or IPv6 address suffix, and is used with the IP_ADAPTER_UNICAST_ADDRESS structure.
 * @remarks
 * The <b>IP_SUFFIX_ORIGIN</b> enumeration is used in the <b>SuffixOrigin</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/iptypes/ns-iptypes-ip_adapter_unicast_address_lh">IP_ADAPTER_UNICAST_ADDRESS</a>  structure.
 * 
 * On the Microsoft Windows Software Development Kit (SDK) released for Windows Vista and later, the organization of header files has changed and the <b>IP_SUFFIX_ORIGIN</b> enumeration is defined in the <i>Nldef.h</i> header file which is automatically included by the <i>Iptypes.h</i> header file. In order to use the <b>IP_SUFFIX_ORIGIN</b> enumeration, the <i>Winsock2.h</i> header file must be included before the <i>Iptypes.h</i> header file.
 * @see https://learn.microsoft.com/windows/win32/api/nldef/ne-nldef-nl_suffix_origin
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class NL_SUFFIX_ORIGIN extends Win32Enum{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static NlsoOther => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static NlsoManual => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static NlsoWellKnown => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static NlsoDhcp => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static NlsoLinkLayerAddress => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static NlsoRandom => 5

    /**
     * The IP address suffix was provided by a source other than those defined in this enumeration.
     * @type {Integer (Int32)}
     */
    static IpSuffixOriginOther => 0

    /**
     * The IP address suffix was manually specified.
     * @type {Integer (Int32)}
     */
    static IpSuffixOriginManual => 1

    /**
     * The IP address suffix is from a well-known source.
     * @type {Integer (Int32)}
     */
    static IpSuffixOriginWellKnown => 2

    /**
     * The IP address suffix was provided by DHCP settings.
     * @type {Integer (Int32)}
     */
    static IpSuffixOriginDhcp => 3

    /**
     * The IP address suffix was obtained from the link-layer address.
     * @type {Integer (Int32)}
     */
    static IpSuffixOriginLinkLayerAddress => 4

    /**
     * The IP address suffix was obtained from a random source.
     * @type {Integer (Int32)}
     */
    static IpSuffixOriginRandom => 5

    /**
     * The IP address suffix should be unchanged. This value is used when setting the properties for a unicast IP interface when the value for the IP suffix origin should be left unchanged.
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  This enumeration value is only available on Windows Vista and later.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static IpSuffixOriginUnchanged => 16
}
