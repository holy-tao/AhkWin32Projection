#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the algorithm used to hash the public key in a certificate request.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/ne-certenroll-keyidentifierhashalgorithm
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class KeyIdentifierHashAlgorithm{

    /**
     * The default hash algorithm. This is redundant with the <b>SKIHashSha1</b> value.
     * @type {Integer (Int32)}
     */
    static SKIHashDefault => 0

    /**
     * A 160-bit SHA-1 hash of a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">Distinguished Encoding Rules</a> (DER) encoded public key, excluding the tag, length, and number of unused bits.
     * @type {Integer (Int32)}
     */
    static SKIHashSha1 => 1

    /**
     * A 160-bit SHA-1 hash of a DER-encoded public key, including the tag, length, and number of unused bits.
     * @type {Integer (Int32)}
     */
    static SKIHashCapiSha1 => 2

    /**
     * A 256-bit SHA256 (SHA-2) hash of a DER-encoded public key, including the tag, length, and number of unused bits.
     * @type {Integer (Int32)}
     */
    static SKIHashSha256 => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SKIHashHPKP => 5
}
