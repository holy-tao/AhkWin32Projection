#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the purpose of a key contained in a certificate.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/ne-certenroll-x509keyusageflags
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class X509KeyUsageFlags extends Win32Enum{

    /**
     * The purpose of the key is not defined.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_NO_KEY_USAGE => 0

    /**
     * The key is used with a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">Digital Signature Algorithm</a> (DSA) to support services other than nonrepudiation, certificate signing, or revocation list signing.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_DIGITAL_SIGNATURE_KEY_USAGE => 128

    /**
     * The key is used to verify a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">digital signature</a> as part of a nonrepudiation service that protects against false denial of action by a signing entity.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_NON_REPUDIATION_KEY_USAGE => 64

    /**
     * The key is used for key transport. That is, the key is used to manage a key passed from its point of origination to another point of use.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_KEY_ENCIPHERMENT_KEY_USAGE => 32

    /**
     * The key is used to encrypt user data other than cryptographic keys.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_DATA_ENCIPHERMENT_KEY_USAGE => 16

    /**
     * The key is used for key agreement. The key agreement or key exchange protocol enables two or more parties to negotiate a key value without transferring the key and without previously establishing a shared secret.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_KEY_AGREEMENT_KEY_USAGE => 8

    /**
     * The key is used to verify a certificate signature. This value can only be used for certificates issued by <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authorities</a>.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_KEY_CERT_SIGN_KEY_USAGE => 4

    /**
     * The key is used to verify an offline <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate revocation list</a> (CRL) signature.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_OFFLINE_CRL_SIGN_KEY_USAGE => 2

    /**
     * The key is used to verify a CRL signature.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_CRL_SIGN_KEY_USAGE => 2

    /**
     * The key is used to encrypt data while performing key agreement. When this value is specified, the <b>XCN_CERT_KEY_AGREEMENT_KEY_USAGE</b> value must also be specified.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_ENCIPHER_ONLY_KEY_USAGE => 1

    /**
     * The key is used to decrypt data while performing key agreement. When this value is specified, the <b>XCN_CERT_KEY_AGREEMENT_KEY_USAGE</b> must also be specified.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_DECIPHER_ONLY_KEY_USAGE => 32768
}
