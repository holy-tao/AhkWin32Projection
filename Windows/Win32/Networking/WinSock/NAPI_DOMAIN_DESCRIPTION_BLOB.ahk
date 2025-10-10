#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a domain handled by a namespace provider for the NS_EMAIL namespace.
 * @remarks
 * 
  * This structure is supported on Windows Vistaand later.
  * 
  * The 
  * <b>NAPI_DOMAIN_DESCRIPTION_BLOB</b> structure describes a domain handled by a namespace provider for the NS_EMAIL namespace. A typical domain name represented by the <b>OffsetThisDomainName</b> member in this structure might be msn.com or yahoo.com.
  * 
  * Each namespace provider registered in the NS_EMAIL namespace can support multiple domains. The list of supported domains is specified in the provider registration blob as a list of <b>NAPI_DOMAIN_DESCRIPTION_BLOB</b> structures. Each supported domain specification contains a <a href="https://docs.microsoft.com/windows/desktop/api/nsemail/ne-nsemail-napi_provider_level">NAPI_PROVIDER_LEVEL</a> value in the <b>AuthLevel</b> member of the <b>NAPI_DOMAIN_DESCRIPTION_BLOB</b> that describes the type of support provided by the provider for that domain. 
  * 
  * The <b>NAPI_DOMAIN_DESCRIPTION_BLOB</b> structure is a member of the <a href="https://docs.microsoft.com/windows/desktop/api/nsemail/ns-nsemail-napi_provider_installation_blob">NAPI_PROVIDER_INSTALLATION_BLOB</a> structure used to describe and register a NS_EMAIL namespace provider. There may be multiple <b>NAPI_DOMAIN_DESCRIPTION_BLOB</b> structures in the <b>NAPI_PROVIDER_INSTALLATION_BLOB</b> structure for an NS_EMAIL namespace provider.
  * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wscinstallnamespaceex">WSCInstallNameSpaceEx</a> and <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wscinstallnamespaceex32">WSCInstallNameSpaceEx32</a> functions are used to install a namespace provider for the NS_EMAIL namespace using a <a href="https://docs.microsoft.com/windows/desktop/api/nsemail/ns-nsemail-napi_provider_installation_blob">NAPI_PROVIDER_INSTALLATION_BLOB</a> structure. 
  * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-wsaenumnamespaceprovidersexa">WSAEnumNameSpaceProvidersEx</a> and <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wscenumnamespaceprovidersex32">WSCEnumNameSpaceProvidersEx32</a> functions are used to enumerate all namespace providers (including NS_EMAIL namespace providers) and to retrieve the <a href="https://docs.microsoft.com/windows/desktop/api/nsemail/ns-nsemail-napi_provider_installation_blob">NAPI_PROVIDER_INSTALLATION_BLOB</a> structure for  a provider if the provider registered a blob upon installation.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//nsemail/ns-nsemail-napi_domain_description_blob
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class NAPI_DOMAIN_DESCRIPTION_BLOB extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The authority level of the namespace provider for this domain. This member can be one of the values from the <a href="https://docs.microsoft.com/windows/desktop/api/nsemail/ne-nsemail-napi_provider_level">NAPI_PROVIDER_LEVEL</a> enumeration type defined in the <i>Nsemail.h</i> header file.
     * @type {Integer}
     */
    AuthLevel {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The length, in Unicode characters, of the Unicode string that contains the domain name represented by the <b>OffsetThisDomainName</b> member. The <b>NULL</b> terminator is not counted when calculating the length.
     * @type {Integer}
     */
    cchDomainName {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The offset, in bytes, to the next <b>NAPI_DOMAIN_DESCRIPTION_BLOB</b> structure in the <a href="https://docs.microsoft.com/windows/desktop/api/nsemail/ns-nsemail-napi_provider_installation_blob">NAPI_PROVIDER_INSTALLATION_BLOB</a> structure.
     * @type {Integer}
     */
    OffsetNextDomainDescription {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The offset, in bytes, to a Unicode string that contains a domain name handled by this namespace provider for the NS_EMAIL namespace. The domain name must be at least <b>cchDomainName</b> Unicode characters in length. <b>NULL</b>-termination of the Unicode string that contains the domain name is recommended, but not required. This offset must be aligned on a minimum of a two-byte boundary.
     * @type {Integer}
     */
    OffsetThisDomainName {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
