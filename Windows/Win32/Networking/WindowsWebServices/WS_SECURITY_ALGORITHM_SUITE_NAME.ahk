#Requires AutoHotkey v2.0.0 64-bit

/**
 * A suite of security algorithms used for tasks such as signing and encryting. The values in this enumeration correspond to the suites defined in WS-SecurityPolicy 1.1section 7.1.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ne-webservices-ws_security_algorithm_suite_name
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_SECURITY_ALGORITHM_SUITE_NAME{

    /**
     * Identifies the Basic256 algorithm suite. This suite uses the following algorithms:
 *             <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_CANONICALIZATION_EXCLUSIVE</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_DIGEST_SHA1</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_SYMMETRIC_SIGNATURE_HMAC_SHA1</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_ASYMMETRIC_SIGNATURE_RSA_SHA1</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_KEY_DERIVATION_P_SHA1</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_ASYMMETRIC_KEYWRAP_RSA_OAEP</a>
 * </li>
 * </ul>The minimum symmetric key length is 256; the maximum symmetric key length is 256.
 *             The minimum asymmetric key length is 1024; the maximum asymmetric key length is 4096.
     * @type {Integer (Int32)}
     */
    static WS_SECURITY_ALGORITHM_SUITE_NAME_BASIC256 => 1

    /**
     * Identifies the Basic192 algorithm suite. This suite uses the following algorithms:
 *             <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_CANONICALIZATION_EXCLUSIVE</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_DIGEST_SHA1</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_SYMMETRIC_SIGNATURE_HMAC_SHA1</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_ASYMMETRIC_SIGNATURE_RSA_SHA1</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_KEY_DERIVATION_P_SHA1</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_ASYMMETRIC_KEYWRAP_RSA_OAEP</a>
 * </li>
 * </ul>The minimum symmetric key length is 192; the maximum symmetric key length is 256.
 *             The minimum asymmetric key length is 1024; the maximum asymmetric key length is 4096.
     * @type {Integer (Int32)}
     */
    static WS_SECURITY_ALGORITHM_SUITE_NAME_BASIC192 => 2

    /**
     * Identifies the Basic128 algorithm suite. This suite uses the following algorithms:
 *             <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_CANONICALIZATION_EXCLUSIVE</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_DIGEST_SHA1</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_SYMMETRIC_SIGNATURE_HMAC_SHA1</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_ASYMMETRIC_SIGNATURE_RSA_SHA1</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_KEY_DERIVATION_P_SHA1</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_ASYMMETRIC_KEYWRAP_RSA_OAEP</a>
 * </li>
 * </ul>The minimum symmetric key length is 128; the maximum symmetric key length is 256.
 *             The minimum asymmetric key length is 1024; the maximum asymmetric key length is 4096.
     * @type {Integer (Int32)}
     */
    static WS_SECURITY_ALGORITHM_SUITE_NAME_BASIC128 => 3

    /**
     * Identifies the Basic256Rsa15 algorithm suite. This suite uses the following algorithms:
 *             <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_CANONICALIZATION_EXCLUSIVE</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_DIGEST_SHA1</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_SYMMETRIC_SIGNATURE_HMAC_SHA1</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_ASYMMETRIC_SIGNATURE_RSA_SHA1</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_KEY_DERIVATION_P_SHA1</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_ASYMMETRIC_KEYWRAP_RSA_1_5</a>
 * </li>
 * </ul>The minimum symmetric key length is 256; the maximum symmetric key length is 256.
 *             The minimum asymmetric key length is 1024; the maximum asymmetric key length is 4096.
     * @type {Integer (Int32)}
     */
    static WS_SECURITY_ALGORITHM_SUITE_NAME_BASIC256_RSA15 => 4

    /**
     * Identifies the Basic192Rsa15 algorithm suite. This suite uses the following algorithms:
 *             <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_CANONICALIZATION_EXCLUSIVE</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_DIGEST_SHA1</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_SYMMETRIC_SIGNATURE_HMAC_SHA1</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_ASYMMETRIC_SIGNATURE_RSA_SHA1</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_KEY_DERIVATION_P_SHA1</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_ASYMMETRIC_KEYWRAP_RSA_1_5</a>
 * </li>
 * </ul>The minimum symmetric key length is 192; the maximum symmetric key length is 256.
 *             The minimum asymmetric key length is 1024; the maximum asymmetric key length is 4096.
     * @type {Integer (Int32)}
     */
    static WS_SECURITY_ALGORITHM_SUITE_NAME_BASIC192_RSA15 => 5

    /**
     * Identifies the Basic128RSA15 algorithm suite. This suite uses the following algorithms:
 *             <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_CANONICALIZATION_EXCLUSIVE</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_DIGEST_SHA1</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_SYMMETRIC_SIGNATURE_HMAC_SHA1</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_ASYMMETRIC_SIGNATURE_RSA_SHA1</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_KEY_DERIVATION_P_SHA1</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_ASYMMETRIC_KEYWRAP_RSA_1_5</a>
 * </li>
 * </ul>The minimum symmetric key length is 128; the maximum symmetric key length is 256.
 *             The minimum asymmetric key length is 1024; the maximum asymmetric key length is 4096.
     * @type {Integer (Int32)}
     */
    static WS_SECURITY_ALGORITHM_SUITE_NAME_BASIC128_RSA15 => 6

    /**
     * Identifies the Basic256Sha256 algorithm suite. This suite uses the following algorithms:
 *             <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_CANONICALIZATION_EXCLUSIVE</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_DIGEST_SHA_256</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_SYMMETRIC_SIGNATURE_HMAC_SHA1</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_ASYMMETRIC_SIGNATURE_RSA_SHA1</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_KEY_DERIVATION_P_SHA1</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_ASYMMETRIC_KEYWRAP_RSA_OAEP</a>
 * </li>
 * </ul>The minimum symmetric key length is 256; the maximum symmetric key length is 256.
 *             The minimum asymmetric key length is 1024; the maximum asymmetric key length is 4096.
     * @type {Integer (Int32)}
     */
    static WS_SECURITY_ALGORITHM_SUITE_NAME_BASIC256_SHA256 => 7

    /**
     * Identifies the Basic192Sha256 algorithm suite. This suite uses the following algorithms:
 *             <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_CANONICALIZATION_EXCLUSIVE</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_DIGEST_SHA_256</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_SYMMETRIC_SIGNATURE_HMAC_SHA1</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_ASYMMETRIC_SIGNATURE_RSA_SHA1</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_KEY_DERIVATION_P_SHA1</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_ASYMMETRIC_KEYWRAP_RSA_OAEP</a>
 * </li>
 * </ul>The minimum symmetric key length is 192; the maximum symmetric key length is 256.
 *             The minimum asymmetric key length is 1024; the maximum asymmetric key length is 4096.
     * @type {Integer (Int32)}
     */
    static WS_SECURITY_ALGORITHM_SUITE_NAME_BASIC192_SHA256 => 8

    /**
     * Identifies the Basic128Sha256 algorithm suite. This suite uses the following algorithms:
 *             <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_CANONICALIZATION_EXCLUSIVE</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_DIGEST_SHA_256</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_SYMMETRIC_SIGNATURE_HMAC_SHA1</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_ASYMMETRIC_SIGNATURE_RSA_SHA1</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_KEY_DERIVATION_P_SHA1</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_ASYMMETRIC_KEYWRAP_RSA_OAEP</a>
 * </li>
 * </ul>The minimum symmetric key length is 128; the maximum symmetric key length is 256.
 *             The minimum asymmetric key length is 1024; the maximum asymmetric key length is 4096.
     * @type {Integer (Int32)}
     */
    static WS_SECURITY_ALGORITHM_SUITE_NAME_BASIC128_SHA256 => 9

    /**
     * Identifies the Basic256Sha256Rsa15 algorithm suite. This suite uses the following algorithms:
 *             <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_CANONICALIZATION_EXCLUSIVE</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_DIGEST_SHA_256</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_SYMMETRIC_SIGNATURE_HMAC_SHA1</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_ASYMMETRIC_SIGNATURE_RSA_SHA1</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_KEY_DERIVATION_P_SHA1</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_ASYMMETRIC_KEYWRAP_RSA_1_5</a>
 * </li>
 * </ul>The minimum symmetric key length is 256; the maximum symmetric key length is 256.
 *             The minimum asymmetric key length is 1024; the maximum asymmetric key length is 4096.
     * @type {Integer (Int32)}
     */
    static WS_SECURITY_ALGORITHM_SUITE_NAME_BASIC256_SHA256_RSA15 => 10

    /**
     * Identifies the Basic192Sha256Rsa15 algorithm suite. This suite uses the following algorithms:
 *             <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_CANONICALIZATION_EXCLUSIVE</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_DIGEST_SHA_256</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_SYMMETRIC_SIGNATURE_HMAC_SHA1</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_ASYMMETRIC_SIGNATURE_RSA_SHA1</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_KEY_DERIVATION_P_SHA1</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_ASYMMETRIC_KEYWRAP_RSA_1_5</a>
 * </li>
 * </ul>The minimum symmetric key length is 192; the maximum symmetric key length is 256.
 *             The minimum asymmetric key length is 1024; the maximum asymmetric key length is 4096.
     * @type {Integer (Int32)}
     */
    static WS_SECURITY_ALGORITHM_SUITE_NAME_BASIC192_SHA256_RSA15 => 11

    /**
     * Identifies the Basic128Sha256Rsa15 algorithm suite. This suite uses the following algorithms:
 *             <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_CANONICALIZATION_EXCLUSIVE</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_DIGEST_SHA_256</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_SYMMETRIC_SIGNATURE_HMAC_SHA1</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_ASYMMETRIC_SIGNATURE_RSA_SHA1</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_KEY_DERIVATION_P_SHA1</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_algorithm_id">WS_SECURITY_ALGORITHM_ASYMMETRIC_KEYWRAP_RSA_1_5</a>
 * </li>
 * </ul>The minimum symmetric key length is 128; the maximum symmetric key length is 256.
 *             The minimum asymmetric key length is 1024; the maximum asymmetric key length is 4096.
     * @type {Integer (Int32)}
     */
    static WS_SECURITY_ALGORITHM_SUITE_NAME_BASIC128_SHA256_RSA15 => 12
}
