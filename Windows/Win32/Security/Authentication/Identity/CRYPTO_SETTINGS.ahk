#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\LSA_UNICODE_STRING.ahk

/**
 * Indicates disabled cryptographic settings.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//schannel/ns-schannel-crypto_settings
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class CRYPTO_SETTINGS extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

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
     * @type {Integer}
     */
    eAlgorithmUsage {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The <a href="https://docs.microsoft.com/windows/win32/seccng/cng-algorithm-identifiers">CNG algorithm identifier</a>.
     * 
     * Cryptographic settings are ignored if the specified algorithm is not used by a supported, enabled cipher suite or an available credential.
     * @type {LSA_UNICODE_STRING}
     */
    strCngAlgId{
        get {
            if(!this.HasProp("__strCngAlgId"))
                this.__strCngAlgId := LSA_UNICODE_STRING(this.ptr + 8)
            return this.__strCngAlgId
        }
    }

    /**
     * The count of entries in the rgstrChainingModes array. 
     * 
     * Set to 0 if strCngAlgId does not have a chaining mode (*e.g. BCRYPT_SHA384_ALGORITHM*). It is an error to specify more than SCH_CRED_MAX_SUPPORTED_CHAINING_MODES.
     * @type {Integer}
     */
    cChainingModes {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/win32/seccng/cng-property-identifiers">CNG chaining mode identifiers</a>. 
     * 
     * Set to NULL if strCngAlgId does not have a chaining mode (*e.g. BCRYPT_SHA384_ALGORITHM*).
     * @type {Pointer<LSA_UNICODE_STRING>}
     */
    rgstrChainingModes {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Minimum bit length for the specified CNG algorithm. 
     * 
     * If 0, schannel uses system defaults. Set to 0 if the CNG algorithm implies bit length (*e.g. BCRYPT_ECDH_P521_ALGORITHM*).
     * @type {Integer}
     */
    dwMinBitLength {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Maximum bit length for the specified CNG algorithm.
     * 
     * If 0, schannel uses system defaults. Set to 0 if the CNG algorithm implies bit length (e.g. BCRYPT_ECDH_P521_ALGORITHM).
     * @type {Integer}
     */
    dwMaxBitLength {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }
}
