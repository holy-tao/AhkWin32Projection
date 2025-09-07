#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * Contains data about a Secure Sockets Layer (SSL) client certificate that can be used to determine whether the certificate is valid.
 * @remarks
 * An 
  * <b>HTTP_SSL_CLIENT_CERT_INFO</b> structure is pointed to by the <b>pClientCertInfo</b> member of the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_ssl_info">HTTP_SSL_INFO</a> structure, and is used by the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpreceiveclientcertificate">HttpReceiveClientCertificate</a> function to return data about the client certificate through the <i>pSslClientCertInfo</i> parameter.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_ssl_client_cert_info
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_SSL_CLIENT_CERT_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Flags that indicate whether the certificate is valid. The possible values for this member are 
     * a <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/sspi-status-codes">SSPI Status Code</a> returned from SSPI or one of the following flags from the <b>dwError</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_chain_policy_status">CERT_CHAIN_POLICY_STATUS</a> structure:
     * 
     * <a id="CERT_E_EXPIRED"></a>
     * <a id="cert_e_expired"></a>
     * @type {Integer}
     */
    CertFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size, in bytes, of the certificate.
     * @type {Integer}
     */
    CertEncodedSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A pointer to the actual certificate.
     * @type {Pointer<Byte>}
     */
    pCertEncoded {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A handle to an access token. If the HTTP_SERVICE_CONFIG_SSL_FLAG_USE_DS_MAPPER flag is set using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpsetserviceconfiguration">HttpSetServiceConfiguration</a> function, and the client certificate was successfully mapped to an operating-system user account, then this member contains the handle to a valid 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-tokens">access token</a>. When the 
     * <b>HTTP_SSL_CLIENT_CERT_INFO</b> structure is no longer required, release this token explicitly by closing the handle.
     * @type {HANDLE}
     */
    Token{
        get {
            if(!this.HasProp("__Token"))
                this.__Token := HANDLE(this.ptr + 16)
            return this.__Token
        }
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    CertDeniedByMapper {
        get => NumGet(this, 24, "char")
        set => NumPut("char", value, this, 24)
    }
}
