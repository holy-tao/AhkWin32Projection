#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the set of valid types for an IP address.
 * @remarks
 * 
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_IPADDRESS_TYPE</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_IPADDRESS_TYPE</b> enumeration constant.</div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ne-vds-vds_ipaddress_type
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_IPADDRESS_TYPE extends Win32Enum{

    /**
     * The address is a text address that is either a DNS address, an IPv4 dotted address, or an IPv6 hex 
     *       address.
     * @type {Integer (Int32)}
     */
    static VDS_IPT_TEXT => 0

    /**
     * The address is an IPv4 address in binary format.
     * @type {Integer (Int32)}
     */
    static VDS_IPT_IPV4 => 1

    /**
     * The address is an IPv6 address in binary format.
     * @type {Integer (Int32)}
     */
    static VDS_IPT_IPV6 => 2

    /**
     * The address is empty.
     * @type {Integer (Int32)}
     */
    static VDS_IPT_EMPTY => 3
}
