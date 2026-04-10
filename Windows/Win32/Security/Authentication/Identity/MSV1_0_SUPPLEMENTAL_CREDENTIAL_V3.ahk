#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\MSV1_0_CREDENTIAL_KEY_TYPE.ahk
#Include .\MSV1_0_CREDENTIAL_KEY.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class MSV1_0_SUPPLEMENTAL_CREDENTIAL_V3 extends Win32Struct {
    static sizeof => 68

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
     * @type {MSV1_0_CREDENTIAL_KEY_TYPE}
     */
    CredentialKeyType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Array<Integer>}
     */
    NtPassword {
        get {
            if(!this.HasProp("__NtPasswordProxyArray"))
                this.__NtPasswordProxyArray := Win32FixedArray(this.ptr + 12, 16, Primitive, "char")
            return this.__NtPasswordProxyArray
        }
    }

    /**
     * @type {MSV1_0_CREDENTIAL_KEY}
     */
    CredentialKey {
        get {
            if(!this.HasProp("__CredentialKey"))
                this.__CredentialKey := MSV1_0_CREDENTIAL_KEY(28, this)
            return this.__CredentialKey
        }
    }

    /**
     * @type {Array<Integer>}
     */
    ShaPassword {
        get {
            if(!this.HasProp("__ShaPasswordProxyArray"))
                this.__ShaPasswordProxyArray := Win32FixedArray(this.ptr + 48, 20, Primitive, "char")
            return this.__ShaPasswordProxyArray
        }
    }
}
