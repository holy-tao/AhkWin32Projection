#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include .\CRYPT_BIT_BLOB.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_ECC_PRIVATE_KEY_INFO extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {CRYPT_INTEGER_BLOB}
     */
    PrivateKey{
        get {
            if(!this.HasProp("__PrivateKey"))
                this.__PrivateKey := CRYPT_INTEGER_BLOB(this.ptr + 8)
            return this.__PrivateKey
        }
    }

    /**
     * @type {PSTR}
     */
    szCurveOid{
        get {
            if(!this.HasProp("__szCurveOid"))
                this.__szCurveOid := PSTR(this.ptr + 24)
            return this.__szCurveOid
        }
    }

    /**
     * @type {CRYPT_BIT_BLOB}
     */
    PublicKey{
        get {
            if(!this.HasProp("__PublicKey"))
                this.__PublicKey := CRYPT_BIT_BLOB(this.ptr + 32)
            return this.__PublicKey
        }
    }
}
