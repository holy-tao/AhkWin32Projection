#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the authentication type.
 * @see https://learn.microsoft.com/windows/win32/api/certcli/ne-certcli-x509enrollmentauthflags
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
class X509EnrollmentAuthFlags extends Win32Enum {

    /**
     * Reserved.
     * Native name: X509AuthNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Anonymous authentication.
     * Native name: X509AuthAnonymous
     * @type {Integer (Int32)}
     */
    static Anonymous => 1

    /**
     * Kerberos authentication.
     * Native name: X509AuthKerberos
     * @type {Integer (Int32)}
     */
    static Kerberos => 2

    /**
     * Plaintext user name and password authentication.
     * Native name: X509AuthUsername
     * @type {Integer (Int32)}
     */
    static Username => 4

    /**
     * A client authentication certificate (suitable for <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">Secure Sockets Layer protocol</a> (SSL) client authentication) that is installed locally and that has an associated private key.  This certificate is used by the server to verify the client's identity.
     * Native name: X509AuthCertificate
     * @type {Integer (Int32)}
     */
    static Certificate => 8
}
