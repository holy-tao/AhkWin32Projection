#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a user account that is used to join a device to Microsoft Azure Active Directory.
 * @see https://docs.microsoft.com/windows/win32/api//lmjoin/ns-lmjoin-dsreg_user_info
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
    pszUserEmail {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The identifier of the Microsoft Passport key that is provisioned for the user.
     * @type {PWSTR}
     */
    pszUserKeyId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The name of the Microsoft Passport key that is provisioned for the user.
     * @type {PWSTR}
     */
    pszUserKeyName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
