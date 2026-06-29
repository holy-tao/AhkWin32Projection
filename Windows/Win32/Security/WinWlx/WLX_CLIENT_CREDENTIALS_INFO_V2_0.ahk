#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains the client credentials returned by a call to WlxQueryTsLogonCredentials.
 * @see https://learn.microsoft.com/windows/win32/api/winwlx/ns-winwlx-wlx_client_credentials_info_v2_0
 * @namespace Windows.Win32.Security.WinWlx
 */
export default struct WLX_CLIENT_CREDENTIALS_INFO_V2_0 {
    #StructPack 8

    /**
     * Specifies the type of <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">credentials</a> structure allocated by the GINA DLL. Credential types are defined with the prefix WLX_CREDENTIAL_TYPE_xxx.
     */
    dwType : UInt32

    /**
     * A pointer to the name of the account logged onto.
     */
    pszUserName : PWSTR

    /**
     * A pointer to the name of the domain used to log on.
     */
    pszDomain : PWSTR

    /**
     * A pointer to the plaintext password of the user account. When you have finished using <i>pszPassword</i>, clear the sensitive information from memory by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)">SecureZeroMemory</a> function.
     * 
     * For more information about protecting passwords, see <a href="https://docs.microsoft.com/windows/desktop/SecBP/handling-passwords">Handling Passwords</a>.
     */
    pszPassword : PWSTR

    /**
     * Forces a prompt for the password due to an administration override. This allows the distinction of auto logon with no password.
     */
    fPromptForPassword : BOOL

    /**
     * Determines whether GINA allows the user to supply different credentials if the logon fails. If  <i>fDisconnectOnLogonFailure</i> is <b>TRUE</b> and the logon fails, <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nf-winwlx-wlxloggedoutsas">WlxLoggedOutSAS</a> should return WLX_SAS_ACTION_LOGOFF.  This will cause <a href="https://docs.microsoft.com/windows/desktop/SecGloss/w-gly">Winlogon</a> to terminate the session. If <i>fDisconnectOnLogonFailure</i> is <b>FALSE</b> and the logon fails, GINA can allow the user to submit different credentials.
     */
    fDisconnectOnLogonFailure : BOOL

}
