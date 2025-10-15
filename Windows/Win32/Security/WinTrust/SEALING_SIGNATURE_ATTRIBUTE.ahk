#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include ..\Cryptography\CRYPT_INTEGER_BLOB.ahk
#Include ..\Cryptography\CRYPT_ALGORITHM_IDENTIFIER.ahk

/**
 * @namespace Windows.Win32.Security.WinTrust
 * @version v4.0.30319
 */
class SEALING_SIGNATURE_ATTRIBUTE extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Integer}
     */
    version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    signerIndex {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {CRYPT_ALGORITHM_IDENTIFIER}
     */
    signatureAlgorithm{
        get {
            if(!this.HasProp("__signatureAlgorithm"))
                this.__signatureAlgorithm := CRYPT_ALGORITHM_IDENTIFIER(this.ptr + 8)
            return this.__signatureAlgorithm
        }
    }

    /**
     * @type {CRYPT_INTEGER_BLOB}
     */
    encryptedDigest{
        get {
            if(!this.HasProp("__encryptedDigest"))
                this.__encryptedDigest := CRYPT_INTEGER_BLOB(this.ptr + 32)
            return this.__encryptedDigest
        }
    }
}
