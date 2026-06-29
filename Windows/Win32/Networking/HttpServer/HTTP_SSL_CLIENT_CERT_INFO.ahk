#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * Contains data about a Secure Sockets Layer (SSL) client certificate that can be used to determine whether the certificate is valid.
 * @remarks
 * An 
 * <b>HTTP_SSL_CLIENT_CERT_INFO</b> structure is pointed to by the <b>pClientCertInfo</b> member of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_ssl_info">HTTP_SSL_INFO</a> structure, and is used by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpreceiveclientcertificate">HttpReceiveClientCertificate</a> function to return data about the client certificate through the <i>pSslClientCertInfo</i> parameter.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_ssl_client_cert_info
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_SSL_CLIENT_CERT_INFO {
    #StructPack 8

    /**
     * Flags that indicate whether the certificate is valid. The possible values for this member are 
     * a <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/sspi-status-codes">SSPI Status Code</a> returned from SSPI or one of the following flags from the <b>dwError</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_chain_policy_status">CERT_CHAIN_POLICY_STATUS</a> structure:
     * 
     * <a id="CERT_E_EXPIRED"></a>
     * <a id="cert_e_expired"></a>
     */
    CertFlags : UInt32

    /**
     * The size, in bytes, of the certificate.
     */
    CertEncodedSize : UInt32

    /**
     * A pointer to the actual certificate.
     */
    pCertEncoded : IntPtr

    /**
     * A handle to an access token. If the HTTP_SERVICE_CONFIG_SSL_FLAG_USE_DS_MAPPER flag is set using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpsetserviceconfiguration">HttpSetServiceConfiguration</a> function, and the client certificate was successfully mapped to an operating-system user account, then this member contains the handle to a valid 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-tokens">access token</a>. When the 
     * <b>HTTP_SSL_CLIENT_CERT_INFO</b> structure is no longer required, release this token explicitly by closing the handle.
     */
    Token : HANDLE

    /**
     * Reserved.
     */
    CertDeniedByMapper : BOOLEAN

}
