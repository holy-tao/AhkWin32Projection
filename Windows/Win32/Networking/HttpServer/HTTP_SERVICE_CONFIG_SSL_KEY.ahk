#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\WinSock\SOCKADDR.ahk" { SOCKADDR }

/**
 * Serves as the key by which a given Secure Sockets Layer (SSL) certificate record is identified.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_service_config_ssl_key
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_SERVICE_CONFIG_SSL_KEY {
    #StructPack 8

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/WinSock/sockaddr-2">sockaddr</a> structure that contains the Internet Protocol (IP) address with which this SSL certificate is associated.
     * 
     * If the <b>sin_addr</b> field in <b>IpPort</b> is set to 0.0.0.0, the certificate is applicable to all IPv4 and IPv6 addresses.
     *    If the <b>sin6_addr</b> field in <b>IpPort</b> is set to [::], the certificate is applicable to all IPv6 addresses.
     */
    pIpPort : SOCKADDR.Ptr

}
