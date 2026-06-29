#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the authentication type.
 * @see https://learn.microsoft.com/windows/win32/api/certcli/ne-certcli-x509enrollmentauthflags
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct X509EnrollmentAuthFlags {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
