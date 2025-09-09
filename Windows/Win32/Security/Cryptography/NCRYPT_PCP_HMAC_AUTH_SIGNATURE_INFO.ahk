#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class NCRYPT_PCP_HMAC_AUTH_SIGNATURE_INFO extends Win32Struct
{
    static sizeof => 104

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    iExpiration {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Array<Byte>}
     */
    pabNonce{
        get {
            if(!this.HasProp("__pabNonceProxyArray"))
                this.__pabNonceProxyArray := Win32FixedArray(this.ptr + 8, 32, Primitive, "char")
            return this.__pabNonceProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    pabPolicyRef{
        get {
            if(!this.HasProp("__pabPolicyRefProxyArray"))
                this.__pabPolicyRefProxyArray := Win32FixedArray(this.ptr + 40, 32, Primitive, "char")
            return this.__pabPolicyRefProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    pabHMAC{
        get {
            if(!this.HasProp("__pabHMACProxyArray"))
                this.__pabHMACProxyArray := Win32FixedArray(this.ptr + 72, 32, Primitive, "char")
            return this.__pabHMACProxyArray
        }
    }
}
