#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the operations that an algorithm can perform.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/ne-certenroll-algorithmoperationflags
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class AlgorithmOperationFlags extends Win32Enum{

    /**
     * No operation is specified.
     * @type {Integer (Int32)}
     */
    static XCN_NCRYPT_NO_OPERATION => 0

    /**
     * The algorithm can be  used for <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">symmetric encryption</a>. This includes the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">RC2</a>, <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">RC4</a>, <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">Data Encryption Standard</a> (DES), 3DED, and <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">AES</a> algorithms.
     * @type {Integer (Int32)}
     */
    static XCN_NCRYPT_CIPHER_OPERATION => 1

    /**
     * The algorithm can be used for hashing. This includes the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/m-gly">MD2</a>, <a href="https://docs.microsoft.com/windows/desktop/SecGloss/m-gly">MD4</a>, SHA1, SHA256, SHA384, SHA512 MAC, and <a href="https://docs.microsoft.com/windows/desktop/SecGloss/h-gly">Hash-Based Message Authentication Code</a> (HMAC) <a href="https://docs.microsoft.com/windows/desktop/SecGloss/h-gly">hashing algorithms</a>.
     * @type {Integer (Int32)}
     */
    static XCN_NCRYPT_HASH_OPERATION => 2

    /**
     * The algorithm can be used for <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">public key</a> encryption. This includes <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">RSA</a>.
     * @type {Integer (Int32)}
     */
    static XCN_NCRYPT_ASYMMETRIC_ENCRYPTION_OPERATION => 4

    /**
     * The algorithm can used for key exchange. This includes the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">Diffie-Hellman algorithm</a> and ECDH algorithm.
     * @type {Integer (Int32)}
     */
    static XCN_NCRYPT_SECRET_AGREEMENT_OPERATION => 8

    /**
     * The algorithm can be  used for signing. This includes the RSA algorithm, <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">Digital Signature Algorithm</a> (DSA), and ECDSA algorithm.
     * @type {Integer (Int32)}
     */
    static XCN_NCRYPT_SIGNATURE_OPERATION => 16

    /**
     * The algorithm can be used to generate a random number.
     * @type {Integer (Int32)}
     */
    static XCN_NCRYPT_RNG_OPERATION => 32

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_NCRYPT_KEY_DERIVATION_OPERATION => 64

    /**
     * The algorithm can be used for public key encryption, key exchange, and signing. This is a bitwise-<b>OR</b> combination of the following constants:
     * 
     * <ul>
     * <li>XCN_NCRYPT_ASYMMETRIC_ENCRYPTION_OPERATION</li>
     * <li>XCN_NCRYPT_SECRET_AGREEMENT_OPERATION</li>
     * <li>XCN_NCRYPT_SIGNATURE_OPERATION</li>
     * </ul>
     * @type {Integer (Int32)}
     */
    static XCN_NCRYPT_ANY_ASYMMETRIC_OPERATION => 28

    /**
     * Signature algorithms are preferred but not required. An encryption algorithm may be chosen instead. This is used when searching for <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a> (CSP) status information based on supported operational capability.
     * @type {Integer (Int32)}
     */
    static XCN_NCRYPT_PREFER_SIGNATURE_ONLY_OPERATION => 2097152

    /**
     * An encryption algorithm (such as that identified by the <b>XCN_NCRYPT_ANY_ASYMMETRIC_OPERATION</b> or <b>XCN_NCRYPT_SECRET_AGREEMENT_OPERATION</b> flags) is preferred but not required. A signature algorithm may be chosen instead. This is used when searching for CSP status information based on supported operational capability.
     * @type {Integer (Int32)}
     */
    static XCN_NCRYPT_PREFER_NON_SIGNATURE_OPERATION => 4194304

    /**
     * Only an algorithm that exactly matches the specified operations is selected.
     * @type {Integer (Int32)}
     */
    static XCN_NCRYPT_EXACT_MATCH_OPERATION => 8388608

    /**
     * Use to mask the algorithm operation preference.
     * @type {Integer (Int32)}
     */
    static XCN_NCRYPT_PREFERENCE_MASK_OPERATION => 14680064
}
