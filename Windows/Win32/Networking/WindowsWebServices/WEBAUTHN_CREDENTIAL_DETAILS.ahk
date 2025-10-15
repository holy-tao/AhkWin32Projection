#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WEBAUTHN_CREDENTIAL_DETAILS extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

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
    cbCredentialID {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbCredentialID {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<WEBAUTHN_RP_ENTITY_INFORMATION>}
     */
    pRpInformation {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<WEBAUTHN_USER_ENTITY_INFORMATION>}
     */
    pUserInformation {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {BOOL}
     */
    bRemovable{
        get {
            if(!this.HasProp("__bRemovable"))
                this.__bRemovable := BOOL(this.ptr + 32)
            return this.__bRemovable
        }
    }

    /**
     * @type {BOOL}
     */
    bBackedUp{
        get {
            if(!this.HasProp("__bBackedUp"))
                this.__bBackedUp := BOOL(this.ptr + 36)
            return this.__bBackedUp
        }
    }

    /**
     * @type {PWSTR}
     */
    EXPERIMENTAL_pwszAuthenticatorName{
        get {
            if(!this.HasProp("__EXPERIMENTAL_pwszAuthenticatorName"))
                this.__EXPERIMENTAL_pwszAuthenticatorName := PWSTR(this.ptr + 40)
            return this.__EXPERIMENTAL_pwszAuthenticatorName
        }
    }

    /**
     * @type {Integer}
     */
    EXPERIMENTAL_cbAuthenticatorLogo {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Pointer<Byte>}
     */
    EXPERIMENTAL_pbAuthenticatorLogo {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
