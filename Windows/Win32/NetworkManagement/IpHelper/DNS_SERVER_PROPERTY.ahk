#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DNS_SERVER_PROPERTY_TYPES.ahk

/**
 * Describes a DNS server property, which is set in the [**DNS_INTERFACE_SETTINGS3**](/windows/win32/api/netioapi/ns-netioapi-dns_interface_settings3) structure, and configured through the [**SetInterfaceDnsSettings**](/windows/win32/api/netioapi/nf-netioapi-setinterfacednssettings) function.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/netioapi/ns-netioapi-dns_server_property
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class DNS_SERVER_PROPERTY extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: **[ULONG](/windows/win32/winprog/windows-data-types)**
     * 
     * Must be set to **DNS_INTERFACE_SETTINGS_VERSION1**.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: **[ULONG](/windows/win32/winprog/windows-data-types)**
     * 
     * Must be the index of the corresponding server present in the [**DNS_INTERFACE_SETTINGS3::NameServer**](/windows/win32/api/netioapi/ns-netioapi-dns_interface_settings3) or **::ProfileNameServer** member. For proper usage, see the *ServerProperties* and *ProfileServerProperties* members in the topic for the [**DNS_INTERFACE_SETTINGS3**](ns-netioapi-dns_interface_settings3.md) structure.
     * @type {Integer}
     */
    ServerIndex {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: **[DNS_SERVER_PROPERTY_TYPE](ne-netioapi-dns_server_property_type.md)**
     * 
     * Must be set to **DnsServerDohProperty**. Describes a DNS-over-HTTPS server property.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: **[DNS_SERVER_PROPERTY_TYPES](ns-netioapi-dns_server_property_types.md)**
     * 
     * If the *Type* member is set to **DnsServerDohProperty**, then the **DNS_SERVER_PROPERTY_TYPES::DohSettings** field must point to a valid **DNS_DOH_SERVER_SETTINGS** object.
     * @type {DNS_SERVER_PROPERTY_TYPES}
     */
    Property{
        get {
            if(!this.HasProp("__Property"))
                this.__Property := DNS_SERVER_PROPERTY_TYPES(this.ptr + 16)
            return this.__Property
        }
    }
}
