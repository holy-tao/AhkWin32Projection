#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the permitted uses of a private key.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/ne-certenroll-x509privatekeyusageflags
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class X509PrivateKeyUsageFlags{

    /**
     * The permitted uses are not defined.
     * @type {Integer (Int32)}
     */
    static XCN_NCRYPT_ALLOW_USAGES_NONE => 0

    /**
     * The key can be used to decrypt content. This maps to the following <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-x509keyusageflags">X509KeyUsageFlags</a> values:
 * 
 * <ul>
 * <li>XCN_CERT_DATA_ENCIPHERMENT_KEY_USAGE</li>
 * <li>XCN_CERT_DECIPHER_ONLY_KEY_USAGE</li>
 * <li>XCN_CERT_ENCIPHER_ONLY_KEY_USAGE</li>
 * <li>XCN_CERT_KEY_ENCIPHERMENT_KEY_USAGE</li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static XCN_NCRYPT_ALLOW_DECRYPT_FLAG => 1

    /**
     * The key can be used for signing. This maps to the following <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-x509keyusageflags">X509KeyUsageFlags</a> values:
 * 
 * <ul>
 * <li>XCN_CERT_CRL_SIGN_KEY_USAGE</li>
 * <li>XCN_CERT_DIGITAL_SIGNATURE_KEY_USAGE</li>
 * <li>XCN_CERT_KEY_CERT_SIGN_KEY_USAGE</li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static XCN_NCRYPT_ALLOW_SIGNING_FLAG => 2

    /**
     * The key can be used to establish key agreement between entities.
     * @type {Integer (Int32)}
     */
    static XCN_NCRYPT_ALLOW_KEY_AGREEMENT_FLAG => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_NCRYPT_ALLOW_KEY_IMPORT_FLAG => 8

    /**
     * All of the uses defined for this enumeration are permitted.
     * @type {Integer (Int32)}
     */
    static XCN_NCRYPT_ALLOW_ALL_USAGES => 16777215
}
