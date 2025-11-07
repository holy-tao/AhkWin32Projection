#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the type of hosting expected for a namespace provider.
 * @remarks
 * 
 * This enumeration is supported on Windows Vistaand later.
 * 
 * On  Windows Vista and Windows Server 2008, the <b>NAPI_PROVIDER_TYPE</b> enumeration applies only to NS_EMAIL namespace providers. Windows Vista and Windows Server 2008 currently support only namespace providers of type <b>ProviderType_Application</b> providers. On  Windows Vista and Windows Server 2008, this value should always be set to <b>ProviderType_Application</b>.
 * 
 * The <b>NAPI_PROVIDER_TYPE</b> enumeration is used by the <a href="https://docs.microsoft.com/windows/desktop/api/nsemail/ns-nsemail-napi_provider_installation_blob">NAPI_PROVIDER_INSTALLATION_BLOB</a> structure to specify the provide type of  an NS_EMAIL namespace provider. Examples of a NS_EMAIL namespace provider of type <b>ProviderType_Application</b> would be instant messaging or email clients. An example of a NS_EMAIL namespace provider of type <b>ProviderType_Service</b> would be the Peer Name Resolution Protocol (PNRP) namespace provider. 
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wscinstallnamespaceex">WSCInstallNameSpaceEx</a> and <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wscinstallnamespaceex32">WSCInstallNameSpaceEx32</a> functions are used to install a namespace provider for the NS_EMAIL namespace using a <a href="https://docs.microsoft.com/windows/desktop/api/nsemail/ns-nsemail-napi_provider_installation_blob">NAPI_PROVIDER_INSTALLATION_BLOB</a> structure. 
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-wsaenumnamespaceprovidersexa">WSAEnumNameSpaceProvidersEx</a> and <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wscenumnamespaceprovidersex32">WSCEnumNameSpaceProvidersEx32</a> functions are used to enumerate namespace providers for the NS_EMAIL namespace and retrieve the <a href="https://docs.microsoft.com/windows/desktop/api/nsemail/ns-nsemail-napi_provider_installation_blob">NAPI_PROVIDER_INSTALLATION_BLOB</a> structure for  a provider.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//nsemail/ne-nsemail-napi_provider_type
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class NAPI_PROVIDER_TYPE{

    /**
     * The namespace provider is expected to be hosted by an application. There may be multiple namespace providers of type <b>ProviderType_Application</b> running at the same time on a local system. 
 * 
 * There may also be multiple instances of the same namespace provider running at the same time on a local system as long as the following conditions are met. Only one instance of the same namespace provider application can be running in a single user session at the same time on the local system. The Windows Sockets infrastructure will select the particular target instance of  a namespace provider based on the identity of the client and the user session where it is running. Clients running as user <b>MyUser</b> in a user session will only be able to contact an instance of the same namespace provider running as <b>MyUser</b> in the same session.
     * @type {Integer (Int32)}
     */
    static ProviderType_Application => 1

    /**
     * The namespace provider is expected to be hosted by a service. This hosting model is not currently supported.
     * @type {Integer (Int32)}
     */
    static ProviderType_Service => 2
}
