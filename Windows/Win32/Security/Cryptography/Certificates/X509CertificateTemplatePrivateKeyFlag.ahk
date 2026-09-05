#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Contains values that specify client actions regarding a private key.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/ne-certenroll-x509certificatetemplateprivatekeyflag
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
class X509CertificateTemplatePrivateKeyFlag extends Win32Enum {

    /**
     * Instructs the client to create a key archival certificate request.
     * Native name: PrivateKeyRequireArchival
     * @type {Integer (Int32)}
     */
    static RequireArchival => 1

    /**
     * Instructs the client to allow other applications to export the private key to a Personal Information Exchange (PFX) message. The message is typically saved in a file with a .pfx extension.
     * Native name: PrivateKeyExportable
     * @type {Integer (Int32)}
     */
    static Exportable => 16

    /**
     * Instructs the client to use additional protection for the private key.
     * Native name: PrivateKeyRequireStrongKeyProtection
     * @type {Integer (Int32)}
     */
    static RequireStrongKeyProtection => 32

    /**
     * If this flag is defined, the client must sign the certificate request by using the PKCS #1 version 2.1 signature format which requires that the hash algorithm OID be encoded into the signature parameters. If this flag is not defined the client must sign the certificate request by using the PKCS #1 version 1.5 signature format which requires that the hash and asymmetric algorithm object identifiers (OIDs) be combined into a single OID and that the signature parameters be set to <b>NULL</b>.
     * Native name: PrivateKeyRequireAlternateSignatureAlgorithm
     * @type {Integer (Int32)}
     */
    static RequireAlternateSignatureAlgorithm => 64

    /**
     * Native name: PrivateKeyRequireSameKeyRenewal
     * @type {Integer (Int32)}
     */
    static RequireSameKeyRenewal => 128

    /**
     * Native name: PrivateKeyUseLegacyProvider
     * @type {Integer (Int32)}
     */
    static UseLegacyProvider => 256

    /**
     * Native name: PrivateKeyEKTrustOnUse
     * @type {Integer (Int32)}
     */
    static KeyEKTrustOnUse => 512

    /**
     * Native name: PrivateKeyEKValidateCert
     * @type {Integer (Int32)}
     */
    static KeyEKValidateCert => 1024

    /**
     * Native name: PrivateKeyEKValidateKey
     * @type {Integer (Int32)}
     */
    static KeyEKValidateKey => 2048

    /**
     * Native name: PrivateKeyAttestNone
     * @type {Integer (Int32)}
     */
    static AttestNone => 0

    /**
     * Native name: PrivateKeyAttestPreferred
     * @type {Integer (Int32)}
     */
    static AttestPreferred => 4096

    /**
     * Native name: PrivateKeyAttestRequired
     * @type {Integer (Int32)}
     */
    static AttestRequired => 8192

    /**
     * Native name: PrivateKeyAttestMask
     * @type {Integer (Int32)}
     */
    static AttestMask => 12288

    /**
     * Native name: PrivateKeyAttestWithoutPolicy
     * @type {Integer (Int32)}
     */
    static AttestWithoutPolicy => 16384

    /**
     * Native name: PrivateKeyServerVersionMask
     * @type {Integer (Int32)}
     */
    static ServerVersionMask => 983040

    /**
     * Native name: PrivateKeyServerVersionShift
     * @type {Integer (Int32)}
     */
    static ServerVersionShift => 16

    /**
     * Native name: PrivateKeyHelloKspKey
     * @type {Integer (Int32)}
     */
    static HelloKspKey => 1048576

    /**
     * Native name: PrivateKeyHelloLogonKey
     * @type {Integer (Int32)}
     */
    static HelloLogonKey => 2097152

    /**
     * Native name: PrivateKeyClientVersionMask
     * @type {Integer (Int32)}
     */
    static ClientVersionMask => 251658240

    /**
     * Native name: PrivateKeyClientVersionShift
     * @type {Integer (Int32)}
     */
    static ClientVersionShift => 24
}
