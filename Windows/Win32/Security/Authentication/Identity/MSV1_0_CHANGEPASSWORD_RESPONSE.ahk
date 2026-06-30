#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\MSV1_0_PROTOCOL_MESSAGE_TYPE.ahk
#Include .\DOMAIN_PASSWORD_PROPERTIES.ahk
#Include ..\..\..\Foundation\BOOLEAN.ahk
#Include .\DOMAIN_PASSWORD_INFORMATION.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class MSV1_0_CHANGEPASSWORD_RESPONSE extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {MSV1_0_PROTOCOL_MESSAGE_TYPE}
     */
    MessageType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {BOOLEAN}
     */
    PasswordInfoValid {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * @type {DOMAIN_PASSWORD_INFORMATION}
     */
    DomainPasswordInfo {
        get {
            if(!this.HasProp("__DomainPasswordInfo"))
                this.__DomainPasswordInfo := DOMAIN_PASSWORD_INFORMATION(8, this)
            return this.__DomainPasswordInfo
        }
    }
}
