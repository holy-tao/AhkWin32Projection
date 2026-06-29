#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\WinSock\SOCKADDR_STORAGE.ahk" { SOCKADDR_STORAGE }
#Import "..\WinSock\ADDRESS_FAMILY.ahk" { ADDRESS_FAMILY }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * Serves as the key by which a given Secure Sockets Layer (SSL) Server Name Indication (SNI) certificate record is identified in the SSL SNI store.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_service_config_ssl_sni_key
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_SERVICE_CONFIG_SSL_SNI_KEY {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms740504(v=vs.85)">SOCKADDR_STORAGE</a> structure that contains the Internet Protocol version 4 (IPv4) address with which this SSL SNI certificate is associated. It must be set to the IPv4 wildcard address of type <b>SOCKADDR_IN</b> with <b>ss_family</b> set to <b>AF_INET</b> and <b>sin_addr</b> filled with zeros. <b>Port</b> can be any valid port.
     */
    IpPort : SOCKADDR_STORAGE

    /**
     * A pointer to a null-terminated Unicode UTF-16 string that represents the hostname.
     */
    Host : PWSTR

}
