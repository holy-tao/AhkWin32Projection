#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the intended purpose of a cryptographic algorithm supported by a cryptographic provider.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/ne-certenroll-algorithmtype
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class AlgorithmType{

    /**
     * The algorithm type is not defined.
     * @type {Integer (Int32)}
     */
    static XCN_BCRYPT_UNKNOWN_INTERFACE => 0

    /**
     * The algorithm is used for symmetric encryption. This includes the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">RC2</a>, <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">RC4</a>, <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">Data Encryption Standard</a> (DES), 3DED, and <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">AES</a> algorithms.
     * @type {Integer (Int32)}
     */
    static XCN_BCRYPT_CIPHER_INTERFACE => 1

    /**
     * The algorithm is used for hashing. This includes the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/m-gly">MD2</a>, <a href="https://docs.microsoft.com/windows/desktop/SecGloss/m-gly">MD4</a>, SHA1, SHA256, SHA384, SHA512 MAC, and <a href="https://docs.microsoft.com/windows/desktop/SecGloss/h-gly">Hash-Based Message Authentication Code</a> (HMAC) hash algorithms.
     * @type {Integer (Int32)}
     */
    static XCN_BCRYPT_HASH_INTERFACE => 2

    /**
     * The algorithm is used for <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">public key</a> encryption. This includes RSA.
     * @type {Integer (Int32)}
     */
    static XCN_BCRYPT_ASYMMETRIC_ENCRYPTION_INTERFACE => 3

    /**
     * The algorithm is used for signing. This includes the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">RSA</a> algorithm, <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">Digital Signature Algorithm</a> (DSA), and ECDSA algorithm.
     * @type {Integer (Int32)}
     */
    static XCN_BCRYPT_SIGNATURE_INTERFACE => 5

    /**
     * The algorithm is used for key exchange. This includes the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">Diffie-Hellman algorithm</a> and ECDH algorithm.
     * @type {Integer (Int32)}
     */
    static XCN_BCRYPT_SECRET_AGREEMENT_INTERFACE => 4

    /**
     * The algorithm is used to generate a random number.
     * @type {Integer (Int32)}
     */
    static XCN_BCRYPT_RNG_INTERFACE => 6

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_BCRYPT_KEY_DERIVATION_INTERFACE => 7
}
