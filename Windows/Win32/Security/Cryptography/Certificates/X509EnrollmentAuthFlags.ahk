#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the authentication type.
 * @see https://docs.microsoft.com/windows/win32/api//certcli/ne-certcli-x509enrollmentauthflags
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class X509EnrollmentAuthFlags extends Win32Enum{

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static X509AuthNone => 0

    /**
     * Anonymous authentication.
     * @type {Integer (Int32)}
     */
    static X509AuthAnonymous => 1

    /**
     * Kerberos authentication.
     * @type {Integer (Int32)}
     */
    static X509AuthKerberos => 2

    /**
     * Plaintext user name and password authentication.
     * @type {Integer (Int32)}
     */
    static X509AuthUsername => 4

    /**
     * A client authentication certificate (suitable for <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">Secure Sockets Layer protocol</a> (SSL) client authentication) that is installed locally and that has an associated private key.  This certificate is used by the server to verify the client's identity.
     * @type {Integer (Int32)}
     */
    static X509AuthCertificate => 8
}
