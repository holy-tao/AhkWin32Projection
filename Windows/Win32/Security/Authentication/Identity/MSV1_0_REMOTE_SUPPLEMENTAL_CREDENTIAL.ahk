#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\MSV1_0_CREDENTIAL_KEY_TYPE.ahk
#Include .\MSV1_0_CREDENTIAL_KEY.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class MSV1_0_REMOTE_SUPPLEMENTAL_CREDENTIAL extends Win32Struct {
    static sizeof => 40

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
     * @type {MSV1_0_CREDENTIAL_KEY}
     */
    CredentialKey {
        get {
            if(!this.HasProp("__CredentialKey"))
                this.__CredentialKey := MSV1_0_CREDENTIAL_KEY(8, this)
            return this.__CredentialKey
        }
    }

    /**
     * @type {MSV1_0_CREDENTIAL_KEY_TYPE}
     */
    CredentialKeyType {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    EncryptedCredsSize {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Array<Integer>}
     */
    EncryptedCreds {
        get {
            if(!this.HasProp("__EncryptedCredsProxyArray"))
                this.__EncryptedCredsProxyArray := Win32FixedArray(this.ptr + 36, 1, Primitive, "char")
            return this.__EncryptedCredsProxyArray
        }
    }
}
