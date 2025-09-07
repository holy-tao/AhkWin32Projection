#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Contains information about a user account that is used to join a device to Microsoft Azure Active Directory.
 * @see https://learn.microsoft.com/windows/win32/api/lmjoin/ns-lmjoin-dsreg_user_info
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class DSREG_USER_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The email address of the user.
     * @type {PWSTR}
     */
    pszUserEmail{
        get {
            if(!this.HasProp("__pszUserEmail"))
                this.__pszUserEmail := PWSTR(this.ptr + 0)
            return this.__pszUserEmail
        }
    }

    /**
     * The identifier of the Microsoft Passport key that is provisioned for the user.
     * @type {PWSTR}
     */
    pszUserKeyId{
        get {
            if(!this.HasProp("__pszUserKeyId"))
                this.__pszUserKeyId := PWSTR(this.ptr + 8)
            return this.__pszUserKeyId
        }
    }

    /**
     * The name of the Microsoft Passport key that is provisioned for the user.
     * @type {PWSTR}
     */
    pszUserKeyName{
        get {
            if(!this.HasProp("__pszUserKeyName"))
                this.__pszUserKeyName := PWSTR(this.ptr + 16)
            return this.__pszUserKeyName
        }
    }
}
