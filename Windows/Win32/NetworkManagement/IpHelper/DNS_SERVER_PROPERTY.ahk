#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DNS_DOH_SERVER_SETTINGS.ahk" { DNS_DOH_SERVER_SETTINGS }
#Import ".\DNS_SERVER_PROPERTY_TYPES.ahk" { DNS_SERVER_PROPERTY_TYPES }
#Import ".\DNS_SERVER_PROPERTY_TYPE.ahk" { DNS_SERVER_PROPERTY_TYPE }
#Import ".\DNS_DOT_SERVER_SETTINGS.ahk" { DNS_DOT_SERVER_SETTINGS }

/**
 * Describes a DNS server property, which is set in the [**DNS_INTERFACE_SETTINGS3**](/windows/win32/api/netioapi/ns-netioapi-dns_interface_settings3) structure, and configured through the [**SetInterfaceDnsSettings**](/windows/win32/api/netioapi/nf-netioapi-setinterfacednssettings) function.
 * @see https://learn.microsoft.com/windows/win32/api/netioapi/ns-netioapi-dns_server_property
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct DNS_SERVER_PROPERTY {
    #StructPack 8

    /**
     * Type: **[ULONG](/windows/win32/winprog/windows-data-types)**
     * 
     * Must be set to **DNS_INTERFACE_SETTINGS_VERSION1**.
     */
    Version : UInt32

    /**
     * Type: **[ULONG](/windows/win32/winprog/windows-data-types)**
     * 
     * Must be the index of the corresponding server present in the [**DNS_INTERFACE_SETTINGS3::NameServer**](/windows/win32/api/netioapi/ns-netioapi-dns_interface_settings3) or **::ProfileNameServer** member. For proper usage, see the *ServerProperties* and *ProfileServerProperties* members in the topic for the [**DNS_INTERFACE_SETTINGS3**](ns-netioapi-dns_interface_settings3.md) structure.
     */
    ServerIndex : UInt32

    /**
     * Type: **[DNS_SERVER_PROPERTY_TYPE](ne-netioapi-dns_server_property_type.md)**
     * 
     * Must be set to **DnsServerDohProperty**. Describes a DNS-over-HTTPS server property.
     */
    Type : DNS_SERVER_PROPERTY_TYPE

    /**
     * Type: **[DNS_SERVER_PROPERTY_TYPES](ns-netioapi-dns_server_property_types.md)**
     * 
     * If the *Type* member is set to **DnsServerDohProperty**, then the **DNS_SERVER_PROPERTY_TYPES::DohSettings** field must point to a valid **DNS_DOH_SERVER_SETTINGS** object.
     */
    Property : DNS_SERVER_PROPERTY_TYPES

}
