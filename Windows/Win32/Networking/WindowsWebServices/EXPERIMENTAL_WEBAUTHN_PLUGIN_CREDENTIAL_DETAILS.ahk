#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class EXPERIMENTAL_WEBAUTHN_PLUGIN_CREDENTIAL_DETAILS extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cbCredentialId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbCredentialId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {PWSTR}
     */
    pwszRpId{
        get {
            if(!this.HasProp("__pwszRpId"))
                this.__pwszRpId := PWSTR(this.ptr + 16)
            return this.__pwszRpId
        }
    }

    /**
     * @type {PWSTR}
     */
    pwszRpName{
        get {
            if(!this.HasProp("__pwszRpName"))
                this.__pwszRpName := PWSTR(this.ptr + 24)
            return this.__pwszRpName
        }
    }

    /**
     * @type {Integer}
     */
    cbUserId {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbUserId {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {PWSTR}
     */
    pwszUserName{
        get {
            if(!this.HasProp("__pwszUserName"))
                this.__pwszUserName := PWSTR(this.ptr + 48)
            return this.__pwszUserName
        }
    }

    /**
     * @type {PWSTR}
     */
    pwszUserDisplayName{
        get {
            if(!this.HasProp("__pwszUserDisplayName"))
                this.__pwszUserDisplayName := PWSTR(this.ptr + 56)
            return this.__pwszUserDisplayName
        }
    }
}
