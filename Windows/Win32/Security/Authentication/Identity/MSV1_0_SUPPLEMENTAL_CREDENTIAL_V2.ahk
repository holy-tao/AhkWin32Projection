#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\MSV1_0_CREDENTIAL_KEY.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class MSV1_0_SUPPLEMENTAL_CREDENTIAL_V2 extends Win32Struct
{
    static sizeof => 44

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
    Flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<Byte>}
     */
    NtPassword{
        get {
            if(!this.HasProp("__NtPasswordProxyArray"))
                this.__NtPasswordProxyArray := Win32FixedArray(this.ptr + 8, 16, Primitive, "char")
            return this.__NtPasswordProxyArray
        }
    }

    /**
     * @type {MSV1_0_CREDENTIAL_KEY}
     */
    CredentialKey{
        get {
            if(!this.HasProp("__CredentialKey"))
                this.__CredentialKey := MSV1_0_CREDENTIAL_KEY(24, this)
            return this.__CredentialKey
        }
    }
}
