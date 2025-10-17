#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\LSA_UNICODE_STRING.ahk

/**
 * Contains information used to change a password.
 * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/ns-ntsecapi-kerb_changepassword_request
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class KERB_CHANGEPASSWORD_REQUEST extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    MessageType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * <b>UNICODE_STRING</b> that contains the domain name of the account for which to change the password.
     * @type {LSA_UNICODE_STRING}
     */
    DomainName{
        get {
            if(!this.HasProp("__DomainName"))
                this.__DomainName := LSA_UNICODE_STRING(8, this)
            return this.__DomainName
        }
    }

    /**
     * <b>UNICODE_STRING</b> that contains the account name of the account for which to change the password.
     * @type {LSA_UNICODE_STRING}
     */
    AccountName{
        get {
            if(!this.HasProp("__AccountName"))
                this.__AccountName := LSA_UNICODE_STRING(24, this)
            return this.__AccountName
        }
    }

    /**
     * <b>UNICODE_STRING</b> that contains the old password to be changed.
     * @type {LSA_UNICODE_STRING}
     */
    OldPassword{
        get {
            if(!this.HasProp("__OldPassword"))
                this.__OldPassword := LSA_UNICODE_STRING(40, this)
            return this.__OldPassword
        }
    }

    /**
     * <b>UNICODE_STRING</b> that contains the new password.
     * @type {LSA_UNICODE_STRING}
     */
    NewPassword{
        get {
            if(!this.HasProp("__NewPassword"))
                this.__NewPassword := LSA_UNICODE_STRING(56, this)
            return this.__NewPassword
        }
    }

    /**
     * TRUE if the client is impersonating another <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security principal</a>. Otherwise, false.
     * @type {BOOLEAN}
     */
    Impersonating {
        get => NumGet(this, 72, "char")
        set => NumPut("char", value, this, 72)
    }
}
