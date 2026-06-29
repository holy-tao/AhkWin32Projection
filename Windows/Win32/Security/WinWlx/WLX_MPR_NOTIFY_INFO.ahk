#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Provides identification and authentication information to network providers.
 * @see https://learn.microsoft.com/windows/win32/api/winwlx/ns-winwlx-wlx_mpr_notify_info
 * @namespace Windows.Win32.Security.WinWlx
 */
export default struct WLX_MPR_NOTIFY_INFO {
    #StructPack 8

    /**
     * A pointer to the name of the account logged onto (for example "user_name"). 
     * 
     * 
     * 
     * 
     * The string pointed to by <b>pszUserName</b> must be separately allocated by your GINA DLL. It will be deallocated by Winlogon.
     */
    pszUserName : PWSTR

    /**
     * A pointer to the name of the domain used to log on. 
     * 
     * 
     * 
     * 
     * The string pointed to by pszDomain must be separately allocated by your GINA DLL. It will be deallocated by Winlogon.
     */
    pszDomain : PWSTR

    /**
     * A pointer to the plaintext password of the user account. If <b>pszOldPassword</b> is not <b>NULL</b>, <b>pszPassword</b> contains the new password from a password-change operation. 
     * 
     * 
     * 
     * 
     * The string pointed to by <b>pszPassword</b> must be separately allocated by your GINA DLL. It will be deallocated by Winlogon.
     * 
     *  For information about protecting passwords, see <a href="https://docs.microsoft.com/windows/desktop/SecBP/handling-passwords">Handling Passwords</a>.
     */
    pszPassword : PWSTR

    /**
     * A pointer to the plaintext old password of the user account whose password has just been changed (in this case, <i>pszPassword</i> contains the new password). 
     * 
     * 
     * 
     * 
     * The string pointed to by <b>pszOldPassword</b> must be separately allocated by your GINA DLL. It will be deallocated by Winlogon.
     */
    pszOldPassword : PWSTR

}
