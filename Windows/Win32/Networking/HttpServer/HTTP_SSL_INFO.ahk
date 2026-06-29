#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HTTP_SSL_CLIENT_CERT_INFO.ahk" { HTTP_SSL_CLIENT_CERT_INFO }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains data for a connection that uses Secure Sockets Layer (SSL), obtained through the SSL handshake.
 * @remarks
 * An 
 * <b>HTTP_SSL_INFO</b> structure can be pointed to by the <b>pSslInfo</b> member of an 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa364545(v=vs.85)">HTTP_REQUEST</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_ssl_info
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_SSL_INFO {
    #StructPack 8

    /**
     * The size, in bytes, of the public key used to sign the server certificate.
     */
    ServerCertKeySize : UInt16

    /**
     * The size, in bytes, of the cipher key used to encrypt the current session.
     */
    ConnectionKeySize : UInt16

    /**
     * The size, in bytes, of the string pointed to by the <b>pServerCertIssuer</b> member not including the terminating null character.
     */
    ServerCertIssuerSize : UInt32

    /**
     * The size, in bytes, of the string pointed to by the <b>pServerCertSubject</b> member not including the terminating null character.
     */
    ServerCertSubjectSize : UInt32

    /**
     * A pointer to a null-terminated string of octets that specifies the name of the entity that issued the certificate.
     */
    pServerCertIssuer : PSTR

    /**
     * A pointer to a null-terminated string of octets that specifies the name of the entity to which the certificate belongs.
     */
    pServerCertSubject : PSTR

    /**
     * A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_ssl_client_cert_info">HTTP_SSL_CLIENT_CERT_INFO</a> structure that specifies the client certificate.
     */
    pClientCertInfo : HTTP_SSL_CLIENT_CERT_INFO.Ptr

    /**
     * If non-zero, indicates that the client certificate is already present locally.
     */
    SslClientCertNegotiated : UInt32

}
