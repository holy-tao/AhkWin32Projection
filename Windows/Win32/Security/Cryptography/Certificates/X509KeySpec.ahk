#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the intended use of a key for a legacy cryptographic service provider (CSP).
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/ne-certenroll-x509keyspec
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class X509KeySpec{

    /**
     * The intended use is not identified. This value is set if the provider that supports the key is a  Cryptography API: Next Generation (CNG) key storage provider (KSP).
     * @type {Integer (Int32)}
     */
    static XCN_AT_NONE => 0

    /**
     * The key can be used to encrypt (including key exchange) or sign depending on the algorithm. For RSA algorithms, if this value is set, the key can be used for both signing and encryption. For other algorithms, signing may not be supported. Further, only encryption for key exchange may be supported.
 * 
 * <div class="alert"><b>Note</b>  The KEYEXCHANGE portion of the value name is a carryover from CryptoAPI where it originally  referred to the symmetric encryption of a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">private key</a> used during key exchange. Use of the term ultimately expanded to cover all symmetric encryption.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static XCN_AT_KEYEXCHANGE => 1

    /**
     * The key can be used for signing.
     * @type {Integer (Int32)}
     */
    static XCN_AT_SIGNATURE => 2
}
