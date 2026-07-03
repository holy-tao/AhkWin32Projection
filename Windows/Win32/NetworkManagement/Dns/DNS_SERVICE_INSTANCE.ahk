#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IP6_ADDRESS.ahk" { IP6_ADDRESS }

/**
 * Represents a DNS service running on the network.
 * @remarks
 * `pszInstanceName`. A string that represents the service name. This is a fully qualified domain name that begins with a service name, and ends with ".local". It takes the generalized form "\<ServiceName\>.\_\<ServiceType\>.\_\<TransportProtocol\>.local". For example, "MyMusicServer._http._tcp.local".
 * 
 * `pszHostName`. A string that represents the name of the host of the service.
 * 
 * `keys`. A pointer to an array of string values that represent the property keys.
 * 
 *  
 * `values`. A pointer to an array of string values that represent the corresponding property values.
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-dns_service_instance
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_SERVICE_INSTANCE {
    #StructPack 8

    /**
     * A string that represents the service name. This is a fully qualified domain name that begins with a service name, and ends with ".local". It takes the generalized form "\<ServiceName\>.\_\<ServiceType\>.\_\<TransportProtocol\>.local". For example, "MyMusicServer._http._tcp.local".
     */
    pszInstanceName : PWSTR

    /**
     * A string that represents the name of the host of the service.
     */
    pszHostName : PWSTR

    /**
     * A pointer to an **IP4_ADDRESS** structure that represents the service-associated IPv4 address.
     */
    ip4Address : IntPtr

    /**
     * A pointer to an [IP6_ADDRESS](/windows/win32/api/windns/ns-windns-ip6_address) structure that represents the service-associated IPv6 address.
     */
    ip6Address : IP6_ADDRESS.Ptr

    /**
     * A value that represents the port on which the service is running.
     */
    wPort : UInt16

    /**
     * A value that represents the service priority.
     */
    wPriority : UInt16

    /**
     * A value that represents the service weight.
     */
    wWeight : UInt16

    /**
     * The number of properties&mdash;defines the number of elements in the arrays of the `keys` and `values` parameters.
     */
    dwPropertyCount : UInt32

    keys : PWSTR.Ptr

    values : PWSTR.Ptr

    /**
     * A value that contains the interface index on which the service was discovered.
     */
    dwInterfaceIndex : UInt32

}
