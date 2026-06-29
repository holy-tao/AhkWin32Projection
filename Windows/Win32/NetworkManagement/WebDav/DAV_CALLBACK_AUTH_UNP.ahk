#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Stores user name and password information that was retrieved by the DavAuthCallback callback function.
 * @remarks
 * This structure is included as a member in the <a href="https://docs.microsoft.com/windows/desktop/api/davclnt/ns-davclnt-dav_callback_cred">DAV_CALLBACK_CRED</a> structure.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/davclnt/nc-davclnt-pfndavauthcallback_freecred">DavFreeCredCallback</a> callback function should free only the buffer that the <b>pBuffer</b> member points to, not the entire structure.
 * @see https://learn.microsoft.com/windows/win32/api/davclnt/ns-davclnt-dav_callback_auth_unp
 * @namespace Windows.Win32.NetworkManagement.WebDav
 */
export default struct DAV_CALLBACK_AUTH_UNP {
    #StructPack 8

    /**
     * A pointer to a string that contains the user name. This string is allocated by the <a href="https://docs.microsoft.com/windows/desktop/api/davclnt/nc-davclnt-pfndavauthcallback">DavAuthCallback</a> callback function.
     */
    pszUserName : PWSTR

    /**
     * The length, in WCHAR, of the user name, not including the terminating <b>NULL</b> character.
     */
    ulUserNameLength : UInt32

    /**
     * A pointer to a string that contains the password. This string is allocated by <a href="https://docs.microsoft.com/windows/desktop/api/davclnt/nc-davclnt-pfndavauthcallback">DavAuthCallback</a>.
     */
    pszPassword : PWSTR

    /**
     * The length, in WCHAR, of the password, not including the terminating <b>NULL</b> character.
     */
    ulPasswordLength : UInt32

}
