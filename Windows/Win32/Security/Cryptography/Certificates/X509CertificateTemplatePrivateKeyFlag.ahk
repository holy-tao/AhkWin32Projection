#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains values that specify client actions regarding a private key.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/ne-certenroll-x509certificatetemplateprivatekeyflag
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class X509CertificateTemplatePrivateKeyFlag{

    /**
     * Instructs the client to create a key archival certificate request.
     * @type {Integer (Int32)}
     */
    static PrivateKeyRequireArchival => 1

    /**
     * Instructs the client to allow other applications to export the private key to a Personal Information Exchange (PFX) message. The message is typically saved in a file with a .pfx extension.
     * @type {Integer (Int32)}
     */
    static PrivateKeyExportable => 16

    /**
     * Instructs the client to use additional protection for the private key.
     * @type {Integer (Int32)}
     */
    static PrivateKeyRequireStrongKeyProtection => 32

    /**
     * If this flag is defined, the client must sign the certificate request by using the PKCS #1 version 2.1 signature format which requires that the hash algorithm OID be encoded into the signature parameters. If this flag is not defined the client must sign the certificate request by using the PKCS #1 version 1.5 signature format which requires that the hash and asymmetric algorithm object identifiers (OIDs) be combined into a single OID and that the signature parameters be set to <b>NULL</b>.
     * @type {Integer (Int32)}
     */
    static PrivateKeyRequireAlternateSignatureAlgorithm => 64

    /**
     * 
     * @type {Integer (Int32)}
     */
    static PrivateKeyRequireSameKeyRenewal => 128

    /**
     * 
     * @type {Integer (Int32)}
     */
    static PrivateKeyUseLegacyProvider => 256

    /**
     * 
     * @type {Integer (Int32)}
     */
    static PrivateKeyEKTrustOnUse => 512

    /**
     * 
     * @type {Integer (Int32)}
     */
    static PrivateKeyEKValidateCert => 1024

    /**
     * 
     * @type {Integer (Int32)}
     */
    static PrivateKeyEKValidateKey => 2048

    /**
     * 
     * @type {Integer (Int32)}
     */
    static PrivateKeyAttestNone => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static PrivateKeyAttestPreferred => 4096

    /**
     * 
     * @type {Integer (Int32)}
     */
    static PrivateKeyAttestRequired => 8192

    /**
     * 
     * @type {Integer (Int32)}
     */
    static PrivateKeyAttestMask => 12288

    /**
     * 
     * @type {Integer (Int32)}
     */
    static PrivateKeyAttestWithoutPolicy => 16384

    /**
     * 
     * @type {Integer (Int32)}
     */
    static PrivateKeyServerVersionMask => 983040

    /**
     * 
     * @type {Integer (Int32)}
     */
    static PrivateKeyServerVersionShift => 16

    /**
     * 
     * @type {Integer (Int32)}
     */
    static PrivateKeyHelloKspKey => 1048576

    /**
     * 
     * @type {Integer (Int32)}
     */
    static PrivateKeyHelloLogonKey => 2097152

    /**
     * 
     * @type {Integer (Int32)}
     */
    static PrivateKeyClientVersionMask => 251658240

    /**
     * 
     * @type {Integer (Int32)}
     */
    static PrivateKeyClientVersionShift => 24
}
