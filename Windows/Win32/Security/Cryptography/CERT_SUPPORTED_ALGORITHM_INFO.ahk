#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include .\CRYPT_ALGORITHM_IDENTIFIER.ahk
#Include .\CRYPT_BIT_BLOB.ahk
#Include .\CERT_POLICIES_INFO.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_SUPPORTED_ALGORITHM_INFO extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {CRYPT_ALGORITHM_IDENTIFIER}
     */
    Algorithm{
        get {
            if(!this.HasProp("__Algorithm"))
                this.__Algorithm := CRYPT_ALGORITHM_IDENTIFIER(0, this)
            return this.__Algorithm
        }
    }

    /**
     * @type {CRYPT_BIT_BLOB}
     */
    IntendedKeyUsage{
        get {
            if(!this.HasProp("__IntendedKeyUsage"))
                this.__IntendedKeyUsage := CRYPT_BIT_BLOB(24, this)
            return this.__IntendedKeyUsage
        }
    }

    /**
     * @type {CERT_POLICIES_INFO}
     */
    IntendedCertPolicies{
        get {
            if(!this.HasProp("__IntendedCertPolicies"))
                this.__IntendedCertPolicies := CERT_POLICIES_INFO(48, this)
            return this.__IntendedCertPolicies
        }
    }
}
