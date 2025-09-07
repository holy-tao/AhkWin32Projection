#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class MSV1_0_IUM_SUPPLEMENTAL_CREDENTIAL extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    EncryptedCredsSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<Byte>}
     */
    EncryptedCreds{
        get {
            if(!this.HasProp("__EncryptedCredsProxyArray"))
                this.__EncryptedCredsProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__EncryptedCredsProxyArray
        }
    }
}
