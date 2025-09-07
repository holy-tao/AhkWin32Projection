#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\LSA_UNICODE_STRING.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class MSV1_0_CHANGEPASSWORD_REQUEST extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {Integer}
     */
    MessageType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    DomainName{
        get {
            if(!this.HasProp("__DomainName"))
                this.__DomainName := LSA_UNICODE_STRING(this.ptr + 8)
            return this.__DomainName
        }
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    AccountName{
        get {
            if(!this.HasProp("__AccountName"))
                this.__AccountName := LSA_UNICODE_STRING(this.ptr + 24)
            return this.__AccountName
        }
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    OldPassword{
        get {
            if(!this.HasProp("__OldPassword"))
                this.__OldPassword := LSA_UNICODE_STRING(this.ptr + 40)
            return this.__OldPassword
        }
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    NewPassword{
        get {
            if(!this.HasProp("__NewPassword"))
                this.__NewPassword := LSA_UNICODE_STRING(this.ptr + 56)
            return this.__NewPassword
        }
    }

    /**
     * @type {Integer}
     */
    Impersonating {
        get => NumGet(this, 72, "char")
        set => NumPut("char", value, this, 72)
    }
}
