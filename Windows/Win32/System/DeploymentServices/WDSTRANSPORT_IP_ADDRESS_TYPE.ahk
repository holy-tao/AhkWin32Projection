#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the type of IP address.
 * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/ne-wdstptmgmt-wdstransport_ip_address_type
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class WDSTRANSPORT_IP_ADDRESS_TYPE extends Win32Enum{

    /**
     * Default value that indicates that the IP address type has not yet been determined.
     * @type {Integer (Int32)}
     */
    static WdsTptIpAddressUnknown => 0

    /**
     * Indicates an IPv4 address.
     * @type {Integer (Int32)}
     */
    static WdsTptIpAddressIpv4 => 1

    /**
     * Indicates an IPv6 address.
     * @type {Integer (Int32)}
     */
    static WdsTptIpAddressIpv6 => 2
}
