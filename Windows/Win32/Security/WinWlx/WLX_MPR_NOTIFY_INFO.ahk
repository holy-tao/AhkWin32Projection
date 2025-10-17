#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides identification and authentication information to network providers.
 * @see https://docs.microsoft.com/windows/win32/api//winwlx/ns-winwlx-wlx_mpr_notify_info
 * @namespace Windows.Win32.Security.WinWlx
 * @version v4.0.30319
 */
class WLX_MPR_NOTIFY_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A pointer to the name of the account logged onto (for example "user_name"). 
     * 
     * 
     * 
     * 
     * The string pointed to by <b>pszUserName</b> must be separately allocated by your GINA DLL. It will be deallocated by Winlogon.
     * @type {PWSTR}
     */
    pszUserName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A pointer to the name of the domain used to log on. 
     * 
     * 
     * 
     * 
     * The string pointed to by pszDomain must be separately allocated by your GINA DLL. It will be deallocated by Winlogon.
     * @type {PWSTR}
     */
    pszDomain {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to the plaintext password of the user account. If <b>pszOldPassword</b> is not <b>NULL</b>, <b>pszPassword</b> contains the new password from a password-change operation. 
     * 
     * 
     * 
     * 
     * The string pointed to by <b>pszPassword</b> must be separately allocated by your GINA DLL. It will be deallocated by Winlogon.
     * 
     *  For information about protecting passwords, see <a href="https://docs.microsoft.com/windows/desktop/SecBP/handling-passwords">Handling Passwords</a>.
     * @type {PWSTR}
     */
    pszPassword {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A pointer to the plaintext old password of the user account whose password has just been changed (in this case, <i>pszPassword</i> contains the new password). 
     * 
     * 
     * 
     * 
     * The string pointed to by <b>pszOldPassword</b> must be separately allocated by your GINA DLL. It will be deallocated by Winlogon.
     * @type {PWSTR}
     */
    pszOldPassword {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
