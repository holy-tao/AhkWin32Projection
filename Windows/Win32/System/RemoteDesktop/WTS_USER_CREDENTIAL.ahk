#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains credential information for a user.
 * @remarks
 * The user name and password are plaintext.
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ns-wtsdefs-wts_user_credential
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct WTS_USER_CREDENTIAL {
    #StructPack 2

    /**
     * A string that contains the name of the user.
     */
    UserName : WCHAR[256]

    /**
     * A string that contains the user password.
     */
    Password : WCHAR[256]

    /**
     * A string that contains the domain name for the user.
     */
    Domain : WCHAR[256]

}
