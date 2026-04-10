#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\KERB_PROTOCOL_MESSAGE_TYPE.ahk
#Include .\LSA_UNICODE_STRING.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class KERB_RETRIEVE_KEY_TAB_REQUEST extends Win32Struct {
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {KERB_PROTOCOL_MESSAGE_TYPE}
     */
    MessageType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    UserName {
        get {
            if(!this.HasProp("__UserName"))
                this.__UserName := LSA_UNICODE_STRING(8, this)
            return this.__UserName
        }
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    DomainName {
        get {
            if(!this.HasProp("__DomainName"))
                this.__DomainName := LSA_UNICODE_STRING(24, this)
            return this.__DomainName
        }
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    Password {
        get {
            if(!this.HasProp("__Password"))
                this.__Password := LSA_UNICODE_STRING(40, this)
            return this.__Password
        }
    }
}
