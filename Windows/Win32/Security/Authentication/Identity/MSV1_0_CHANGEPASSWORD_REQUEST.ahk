#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\MSV1_0_PROTOCOL_MESSAGE_TYPE.ahk
#Include ..\..\..\Foundation\PWSTR.ahk
#Include .\LSA_UNICODE_STRING.ahk
#Include ..\..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class MSV1_0_CHANGEPASSWORD_REQUEST extends Win32Struct {
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {MSV1_0_PROTOCOL_MESSAGE_TYPE}
     */
    MessageType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    DomainName {
        get {
            if(!this.HasProp("__DomainName"))
                this.__DomainName := LSA_UNICODE_STRING(8, this)
            return this.__DomainName
        }
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    AccountName {
        get {
            if(!this.HasProp("__AccountName"))
                this.__AccountName := LSA_UNICODE_STRING(24, this)
            return this.__AccountName
        }
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    OldPassword {
        get {
            if(!this.HasProp("__OldPassword"))
                this.__OldPassword := LSA_UNICODE_STRING(40, this)
            return this.__OldPassword
        }
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    NewPassword {
        get {
            if(!this.HasProp("__NewPassword"))
                this.__NewPassword := LSA_UNICODE_STRING(56, this)
            return this.__NewPassword
        }
    }

    /**
     * @type {BOOLEAN}
     */
    Impersonating {
        get => NumGet(this, 72, "char")
        set => NumPut("char", value, this, 72)
    }
}
