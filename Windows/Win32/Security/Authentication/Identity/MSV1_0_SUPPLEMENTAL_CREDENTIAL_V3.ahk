#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\MSV1_0_CREDENTIAL_KEY.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class MSV1_0_SUPPLEMENTAL_CREDENTIAL_V3 extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

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
    Flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    CredentialKeyType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Array<Byte>}
     */
    NtPassword{
        get {
            if(!this.HasProp("__NtPasswordProxyArray"))
                this.__NtPasswordProxyArray := Win32FixedArray(this.ptr + 12, 1, Primitive, "char")
            return this.__NtPasswordProxyArray
        }
    }

    /**
     * @type {MSV1_0_CREDENTIAL_KEY}
     */
    CredentialKey{
        get {
            if(!this.HasProp("__CredentialKey"))
                this.__CredentialKey := MSV1_0_CREDENTIAL_KEY(this.ptr + 32)
            return this.__CredentialKey
        }
    }

    /**
     * @type {Array<Byte>}
     */
    ShaPassword{
        get {
            if(!this.HasProp("__ShaPasswordProxyArray"))
                this.__ShaPasswordProxyArray := Win32FixedArray(this.ptr + 52, 1, Primitive, "char")
            return this.__ShaPasswordProxyArray
        }
    }
}
