#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a DNS service running on the network.
 * @remarks
 * 
  * `pszInstanceName`. A string that represents the service name. This is a fully qualified domain name that begins with a service name, and ends with ".local". It takes the generalized form "\<ServiceName\>.\_\<ServiceType\>.\_\<TransportProtocol\>.local". For example, "MyMusicServer._http._tcp.local".
  * 
  * `pszHostName`. A string that represents the name of the host of the service.
  * 
  * `keys`. A pointer to an array of string values that represent the property keys.
  * 
  *  
  * `values`. A pointer to an array of string values that represent the corresponding property values.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//windns/ns-windns-dns_service_instance
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_SERVICE_INSTANCE extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * A string that represents the service name. This is a fully qualified domain name that begins with a service name, and ends with ".local". It takes the generalized form "\<ServiceName\>.\_\<ServiceType\>.\_\<TransportProtocol\>.local". For example, "MyMusicServer._http._tcp.local".
     * @type {Pointer<Char>}
     */
    pszInstanceName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A string that represents the name of the host of the service.
     * @type {Pointer<Char>}
     */
    pszHostName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to an **IP4_ADDRESS** structure that represents the service-associated IPv4 address.
     * @type {Pointer<UInt32>}
     */
    ip4Address {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A pointer to an [IP6_ADDRESS](/windows/desktop/api/windns/ns-windns-ip6_address_1) structure that represents the service-associated IPv6 address.
     * @type {Pointer<IP6_ADDRESS>}
     */
    ip6Address {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A value that represents the port on which the service is running.
     * @type {Integer}
     */
    wPort {
        get => NumGet(this, 32, "ushort")
        set => NumPut("ushort", value, this, 32)
    }

    /**
     * A value that represents the service priority.
     * @type {Integer}
     */
    wPriority {
        get => NumGet(this, 34, "ushort")
        set => NumPut("ushort", value, this, 34)
    }

    /**
     * A value that represents the service weight.
     * @type {Integer}
     */
    wWeight {
        get => NumGet(this, 36, "ushort")
        set => NumPut("ushort", value, this, 36)
    }

    /**
     * The number of properties&mdash;defines the number of elements in the arrays of the `keys` and `values` parameters.
     * @type {Integer}
     */
    dwPropertyCount {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Pointer<Char>}
     */
    keys {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<Char>}
     */
    values {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * A value that contains the interface index on which the service was discovered.
     * @type {Integer}
     */
    dwInterfaceIndex {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }
}
