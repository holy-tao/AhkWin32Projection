#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\LSA_UNICODE_STRING.ahk
#Include ..\..\..\System\PasswordManagement\CYPHER_BLOCK.ahk
#Include .\USER_SESSION_KEY.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class MSV1_0_VALIDATION_INFO extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {Integer}
     */
    LogoffTime {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    KickoffTime {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    LogonServer{
        get {
            if(!this.HasProp("__LogonServer"))
                this.__LogonServer := LSA_UNICODE_STRING(this.ptr + 16)
            return this.__LogonServer
        }
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    LogonDomainName{
        get {
            if(!this.HasProp("__LogonDomainName"))
                this.__LogonDomainName := LSA_UNICODE_STRING(this.ptr + 32)
            return this.__LogonDomainName
        }
    }

    /**
     * @type {USER_SESSION_KEY}
     */
    SessionKey{
        get {
            if(!this.HasProp("__SessionKey"))
                this.__SessionKey := USER_SESSION_KEY(this.ptr + 48)
            return this.__SessionKey
        }
    }

    /**
     * @type {Integer}
     */
    Authoritative {
        get => NumGet(this, 64, "char")
        set => NumPut("char", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    UserFlags {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * @type {Integer}
     */
    WhichFields {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    UserId {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }
}
