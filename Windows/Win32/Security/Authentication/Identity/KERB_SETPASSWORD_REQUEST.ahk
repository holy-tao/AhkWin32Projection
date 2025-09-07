#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\LUID.ahk
#Include ..\..\Credentials\SecHandle.ahk
#Include ..\..\..\Foundation\PWSTR.ahk
#Include .\LSA_UNICODE_STRING.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class KERB_SETPASSWORD_REQUEST extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * @type {Integer}
     */
    MessageType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {LUID}
     */
    LogonId{
        get {
            if(!this.HasProp("__LogonId"))
                this.__LogonId := LUID(this.ptr + 8)
            return this.__LogonId
        }
    }

    /**
     * @type {SecHandle}
     */
    CredentialsHandle{
        get {
            if(!this.HasProp("__CredentialsHandle"))
                this.__CredentialsHandle := SecHandle(this.ptr + 16)
            return this.__CredentialsHandle
        }
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    DomainName{
        get {
            if(!this.HasProp("__DomainName"))
                this.__DomainName := LSA_UNICODE_STRING(this.ptr + 40)
            return this.__DomainName
        }
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    AccountName{
        get {
            if(!this.HasProp("__AccountName"))
                this.__AccountName := LSA_UNICODE_STRING(this.ptr + 56)
            return this.__AccountName
        }
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    Password{
        get {
            if(!this.HasProp("__Password"))
                this.__Password := LSA_UNICODE_STRING(this.ptr + 72)
            return this.__Password
        }
    }
}
