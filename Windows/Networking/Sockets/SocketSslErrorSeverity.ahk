#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * The category of error that occurs on an SSL connection.
 * @remarks
 * The SocketSslErrorSeverity enumeration indicates the category of error that occurs when an SSL connection to a server is established.
 * 
 * SSL server errors should only be ignored in advanced scenarios. Disregarding server certificate errors classified as either **Ignorable** or **Fatal** may result in the loss of privacy or integrity of the content passed over the SSL session.
 * 
 * Some organizations may use self-signed certificates for private use rather than registered the certificates with a trusted certificate authority. An SSL connection to these sites might be a case where an **Ignorable** error might be tolerated if the server's SSL certificate can be verified by other means.
 * 
 * To validate self-signed certificates effectively, an app must validate the public key of the certificate (using a certificate thumbprint or hash of the public key, for example). See the [Windows.Security.Cryptography.Certificates](../windows.security.cryptography.certificates/windows_security_cryptography_certificates.md) namespace for classes that support calculating certificate thumbprints and other validation operations.
 * 
 * If the public key cannot be validated, displaying other certificate details to users by default is not advisable. This may cause users to assume the information is valid when it may in fact be provided by an attacker.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.socketsslerrorseverity
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class SocketSslErrorSeverity extends Win32Enum{

    /**
     * No error occurs on the SSL connection.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Ignorable errors indicate that the SSL server’s certificate cannot be properly validated.
     * 
     * Disregarding **Ignorable** errors may result in the loss of privacy or integrity of the content passed over the SSL session. Reasons for encountering this severity level include:
     * + The certificate for the SSL server is expired.
     * + The certificate for the SSL server does match the SSL server’s domain name.
     * + The certificate for the SSL server was not issued by a trusted certification authority
     * @type {Integer (Int32)}
     */
    static Ignorable => 1

    /**
     * Fatal errors indicate the SSL server’s certificate cannot be validated. Reasons for encountering this severity level include:
     * + The certificate for the SSL server was revoked by the issuing certification authority.
     * + The signature for the SSL server's certificate or the content in the certificate is invalid
     *  • •
     * @type {Integer (Int32)}
     */
    static Fatal => 2
}
