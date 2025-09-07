#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class KeyAttestationClaimType{

    /**
     * @type {Integer (Int32)}
     */
    static XCN_NCRYPT_CLAIM_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static XCN_NCRYPT_CLAIM_AUTHORITY_AND_SUBJECT => 3

    /**
     * @type {Integer (Int32)}
     */
    static XCN_NCRYPT_CLAIM_AUTHORITY_ONLY => 1

    /**
     * @type {Integer (Int32)}
     */
    static XCN_NCRYPT_CLAIM_SUBJECT_ONLY => 2

    /**
     * @type {Integer (Int32)}
     */
    static XCN_NCRYPT_CLAIM_UNKNOWN => 4096
}
