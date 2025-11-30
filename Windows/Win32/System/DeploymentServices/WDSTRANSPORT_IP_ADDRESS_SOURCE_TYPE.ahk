#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the source from which the WDS multicast provider obtains a multicast address for a new session.
 * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/ne-wdstptmgmt-wdstransport_ip_address_source_type
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class WDSTRANSPORT_IP_ADDRESS_SOURCE_TYPE extends Win32Enum{

    /**
     * Default value that indicates that the IP address source is not known.
     * @type {Integer (Int32)}
     */
    static WdsTptIpAddressSourceUnknown => 0

    /**
     * Indicates that the server should use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/madcap/madcap-start-page">Multicast Address Dynamic Client Allocation Protocol</a> (MADCAP) to obtain a multicast IP address. MADCAP is a protocol that enables applications to obtain, renew, and release multicast addresses, and its functionality is often included in DHCP servers, such as the Microsoft DHCP Server role.
     * @type {Integer (Int32)}
     */
    static WdsTptIpAddressSourceDhcp => 1

    /**
     * Indicates that the server should automatically select an available address from a multicast address range manually configured by the administrator.
     * @type {Integer (Int32)}
     */
    static WdsTptIpAddressSourceRange => 2
}
