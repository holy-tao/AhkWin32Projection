#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import ".\eTlsAlgorithmUsage.ahk" { eTlsAlgorithmUsage }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Indicates disabled cryptographic settings.
 * @see https://learn.microsoft.com/windows/win32/api/schannel/ns-schannel-crypto_settings
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct CRYPTO_SETTINGS {
    #StructPack 8

    /**
     * The algorithm being used as specified in the [eTlsAlgorithmUsage](ne-schannel-etlsalgorithmusage.md) enumeration.
     * 
     * |Value|Algorithm|
     * |--|--|
     * |TlsParametersCngAlgUsageKeyExchange |Key exchange algorithm. <br>(*e.g. RSA, ECDHE, DHE*) |
     * |TlsParametersCngAlgUsageSignature   |Signature algorithm. <br>(*e.g. RSA, DSA, ECDSA*)|
     * |TlsParametersCngAlgUsageCipher      |Encryption algorithm. <br>(*e.g. AES, DES, RC4*)|
     * |TlsParametersCngAlgUsageDigest      |Digest of cipher suite. <br> (*e.g. SHA1, SHA256, SHA384*)|
     * |TlsParametersCngAlgUsageCertSig     |Signature and/or hash used to sign certificate. <br>(*e.g. RSA, DSA, ECDSA, SHA1, SHA256*)|
     */
    eAlgorithmUsage : eTlsAlgorithmUsage

    /**
     * The <a href="https://docs.microsoft.com/windows/win32/seccng/cng-algorithm-identifiers">CNG algorithm identifier</a>.
     * 
     * Cryptographic settings are ignored if the specified algorithm is not used by a supported, enabled cipher suite or an available credential.
     */
    strCngAlgId : LSA_UNICODE_STRING

    /**
     * The count of entries in the rgstrChainingModes array. 
     * 
     * Set to 0 if strCngAlgId does not have a chaining mode (*e.g. BCRYPT_SHA384_ALGORITHM*). It is an error to specify more than SCH_CRED_MAX_SUPPORTED_CHAINING_MODES.
     */
    cChainingModes : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/win32/seccng/cng-property-identifiers">CNG chaining mode identifiers</a>. 
     * 
     * Set to NULL if strCngAlgId does not have a chaining mode (*e.g. BCRYPT_SHA384_ALGORITHM*).
     */
    rgstrChainingModes : LSA_UNICODE_STRING.Ptr

    /**
     * Minimum bit length for the specified CNG algorithm. 
     * 
     * If 0, schannel uses system defaults. Set to 0 if the CNG algorithm implies bit length (*e.g. BCRYPT_ECDH_P521_ALGORITHM*).
     */
    dwMinBitLength : UInt32

    /**
     * Maximum bit length for the specified CNG algorithm.
     * 
     * If 0, schannel uses system defaults. Set to 0 if the CNG algorithm implies bit length (e.g. BCRYPT_ECDH_P521_ALGORITHM).
     */
    dwMaxBitLength : UInt32

}
