#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains data for a connection that uses Secure Sockets Layer (SSL), obtained through the SSL handshake.
 * @remarks
 * An 
  * <b>HTTP_SSL_INFO</b> structure can be pointed to by the <b>pSslInfo</b> member of an 
  * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa364545(v=vs.85)">HTTP_REQUEST</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_ssl_info
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_SSL_INFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The size, in bytes, of the public key used to sign the server certificate.
     * @type {Integer}
     */
    ServerCertKeySize {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * The size, in bytes, of the cipher key used to encrypt the current session.
     * @type {Integer}
     */
    ConnectionKeySize {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * The size, in bytes, of the string pointed to by the <b>pServerCertIssuer</b> member not including the terminating null character.
     * @type {Integer}
     */
    ServerCertIssuerSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The size, in bytes, of the string pointed to by the <b>pServerCertSubject</b> member not including the terminating null character.
     * @type {Integer}
     */
    ServerCertSubjectSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A pointer to a null-terminated string of octets that specifies the name of the entity that issued the certificate.
     * @type {Pointer<Ptr>}
     */
    pServerCertIssuer {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A pointer to a null-terminated string of octets that specifies the name of the entity to which the certificate belongs.
     * @type {Pointer<Ptr>}
     */
    pServerCertSubject {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_ssl_client_cert_info">HTTP_SSL_CLIENT_CERT_INFO</a> structure that specifies the client certificate.
     * @type {Pointer<HTTP_SSL_CLIENT_CERT_INFO>}
     */
    pClientCertInfo {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * If non-zero, indicates that the client certificate is already present locally.
     * @type {Integer}
     */
    SslClientCertNegotiated {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
