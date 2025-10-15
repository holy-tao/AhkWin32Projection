#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\BOOLEAN.ahk
#Include .\DOMAIN_PASSWORD_INFORMATION.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class MSV1_0_CHANGEPASSWORD_RESPONSE extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    MessageType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {BOOLEAN}
     */
    PasswordInfoValid{
        get {
            if(!this.HasProp("__PasswordInfoValid"))
                this.__PasswordInfoValid := BOOLEAN(this.ptr + 4)
            return this.__PasswordInfoValid
        }
    }

    /**
     * @type {DOMAIN_PASSWORD_INFORMATION}
     */
    DomainPasswordInfo{
        get {
            if(!this.HasProp("__DomainPasswordInfo"))
                this.__DomainPasswordInfo := DOMAIN_PASSWORD_INFORMATION(this.ptr + 8)
            return this.__DomainPasswordInfo
        }
    }
}
