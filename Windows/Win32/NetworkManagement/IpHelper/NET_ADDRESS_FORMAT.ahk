#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The NET_ADDRESS_FORMAT enumeration specifies the format of a network address returned by the ParseNetworkString function.
 * @remarks
 * 
 * The <b>NET_ADDRESS_FORMAT</b> enumeration is defined on Windows Vista and later. 
 * 
 * The [NET_ADDRESS_INFO](/windows/desktop/api/iphlpapi/ns-iphlpapi-net_address_info) structure returned by the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-parsenetworkstring">ParseNetworkString</a> function.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//iphlpapi/ne-iphlpapi-net_address_format
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class NET_ADDRESS_FORMAT extends Win32Enum{

    /**
     * The format of the network address is unspecified.
     * @type {Integer (Int32)}
     */
    static NET_ADDRESS_FORMAT_UNSPECIFIED => 0

    /**
     * The format of the network address is a DNS name.
     * @type {Integer (Int32)}
     */
    static NET_ADDRESS_DNS_NAME => 1

    /**
     * The format of the network address is a string in Internet standard dotted-decimal notation for IPv4.
     * @type {Integer (Int32)}
     */
    static NET_ADDRESS_IPV4 => 2

    /**
     * The format of the network address is a string in Internet standard hexadecimal encoding for IPv6.
     * @type {Integer (Int32)}
     */
    static NET_ADDRESS_IPV6 => 3
}
