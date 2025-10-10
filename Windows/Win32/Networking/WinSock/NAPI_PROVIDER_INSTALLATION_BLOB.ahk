#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the information required to install a namespace provider for the NS_EMAIL namespace.
 * @remarks
 * 
  * This structure is supported on Windows Vistaand later.
  * 
  * The 
  * <b>NAPI_PROVIDER_INSTALLATION_BLOB</b> structure contains the information required to install a namespace provider for the NS_EMAIL namespace. There may be multiple namespace providers for the NS_EMAIL namespace install on a local system.
  * 
  * Each namespace provider registered in the NS_EMAIL namespace can support multiple domains. As a result, there may be multiple <a href="https://docs.microsoft.com/windows/desktop/api/nsemail/ns-nsemail-napi_domain_description_blob">NAPI_DOMAIN_DESCRIPTION_BLOB</a> structures in the <b>NAPI_PROVIDER_INSTALLATION_BLOB</b> structure for an NS_EMAIL namespace provider. The list of supported domains is specified in the provider registration blob as a list of <b>NAPI_DOMAIN_DESCRIPTION_BLOB</b> structures. Each supported domain specification contains a <a href="https://docs.microsoft.com/windows/desktop/api/nsemail/ne-nsemail-napi_provider_level">NAPI_PROVIDER_LEVEL</a> value in the <b>AuthLevel</b> member of the <b>NAPI_DOMAIN_DESCRIPTION_BLOB</b> that describes the level of authority provided by the provider for that domain. 
  * 
  * Namespace providers are called in the following order to resolve or register an address in a domain. If a namespace provider registered as the primary provider for the domain, then this primary provider is called first. There are two cases depending on whether authoritative results are requested in the namespace query. The default for a query is to request authoritative results.
  * 
  *  When authoritative results are requested in the query, then namespace providers are called as follows. If the primary provider is unavailable or is unable to resolve or register the address, then the first  secondary provider in the Winsock catalog is called. If the secondary provider is unavailable or is unable to resolve or register the address, then the next secondary provider in the Winsock catalog is called. If all of the secondary providers are unavailable or are unable to resolve or register the address, then the first wildcard provider in the Winsock catalog is called. If the first wildcard provider is unavailable or is unable to resolve or register the address, then the next wildcard provider in the Winsock catalog is called.
  * 
  *  When non-authoritative results are requested in the query, then namespace providers are called as follows. The primary provider, all secondary providers, and all wildcard providers are called and results from all of the queries are returned.  The primary provider is called first. Secondary providers are called next, based on the order in the Winsock catalog. Wildcard providers are called next, based on the order in the Winsock catalog. The results that are returned are based on the order of the queries.
  * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wscinstallnamespaceex">WSCInstallNameSpaceEx</a> and <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wscinstallnamespaceex32">WSCInstallNameSpaceEx32</a> functions are used to install a namespace provider for the NS_EMAIL namespace using a <b>NAPI_PROVIDER_INSTALLATION_BLOB</b> structure.  
  * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-wsaenumnamespaceprovidersexa">WSAEnumNameSpaceProvidersEx</a> and <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wscenumnamespaceprovidersex32">WSCEnumNameSpaceProvidersEx32</a> functions are used to enumerate all namespace providers (including NS_EMAIL namespace providers) and to retrieve the <b>NAPI_PROVIDER_INSTALLATION_BLOB</b> structure for  a provider if the provider registered a blob upon installation.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//nsemail/ns-nsemail-napi_provider_installation_blob
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class NAPI_PROVIDER_INSTALLATION_BLOB extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The version number of the NS_EMAIL namespace provider. This member is specific to the namespace provider.
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The type of namespace provider for the NS_EMAIL namespace. This member can be one of the values from the <a href="https://docs.microsoft.com/windows/desktop/api/nsemail/ne-nsemail-napi_provider_type">NAPI_PROVIDER_TYPE</a> enumeration type defined in the <i>Nsemail.h</i> header file.
     * @type {Integer}
     */
    dwProviderType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * A Boolean value that indicates if this NS_EMAIL namespace provider supports wildcard names. If this member is nonzero, then an NS_EMAIL provider claims to be potentially able to resolve or register any name that does not belong to any domains the provider is specifically registered for as primary or secondary. If this member is nonzero, then the NS_EMAIL provider may be called to resolve or register any address, if  no primary or secondary provider for the domain is available. 
     * 
     * There may be multiple providers that claim to be able to resolve any address (the <b>fSupportsWildCard</b> set to nonzero). If there are namespace providers with this value that also registered as a wildcard provider, the providers are called in the order that they appear in the Winsock namespace catalog.
     * @type {Integer}
     */
    fSupportsWildCard {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of <a href="https://docs.microsoft.com/windows/desktop/api/nsemail/ns-nsemail-napi_domain_description_blob">NAPI_DOMAIN_DESCRIPTION_BLOB</a> structures the starting at the <b>OffsetFirstDomain</b> member used to describe domains that are supported by this NS_EMAIL namespace provider.
     * @type {Integer}
     */
    cDomains {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The offset,  in bytes, to the first of multiple <a href="https://docs.microsoft.com/windows/desktop/api/nsemail/ns-nsemail-napi_domain_description_blob">NAPI_DOMAIN_DESCRIPTION_BLOB</a> structures used to describe domains that are supported by this NS_EMAIL namespace provider. This offset must be aligned on a minimum of a four-byte boundary.
     * @type {Integer}
     */
    OffsetFirstDomain {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
