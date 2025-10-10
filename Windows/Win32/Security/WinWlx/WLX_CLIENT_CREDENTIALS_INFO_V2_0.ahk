#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the client credentials returned by a call to WlxQueryTsLogonCredentials.
 * @see https://docs.microsoft.com/windows/win32/api//winwlx/ns-winwlx-wlx_client_credentials_info_v2_0
 * @namespace Windows.Win32.Security.WinWlx
 * @version v4.0.30319
 */
class WLX_CLIENT_CREDENTIALS_INFO_V2_0 extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Specifies the type of <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">credentials</a> structure allocated by the GINA DLL. Credential types are defined with the prefix WLX_CREDENTIAL_TYPE_xxx.
     * @type {Integer}
     */
    dwType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to the name of the account logged onto.
     * @type {Pointer<Char>}
     */
    pszUserName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to the name of the domain used to log on.
     * @type {Pointer<Char>}
     */
    pszDomain {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A pointer to the plaintext password of the user account. When you have finished using <i>pszPassword</i>, clear the sensitive information from memory by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)">SecureZeroMemory</a> function.
     * 
     * For more information about protecting passwords, see <a href="https://docs.microsoft.com/windows/desktop/SecBP/handling-passwords">Handling Passwords</a>.
     * @type {Pointer<Char>}
     */
    pszPassword {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Forces a prompt for the password due to an administration override. This allows the distinction of auto logon with no password.
     * @type {Integer}
     */
    fPromptForPassword {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * Determines whether GINA allows the user to supply different credentials if the logon fails. If  <i>fDisconnectOnLogonFailure</i> is <b>TRUE</b> and the logon fails, <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nf-winwlx-wlxloggedoutsas">WlxLoggedOutSAS</a> should return WLX_SAS_ACTION_LOGOFF.  This will cause <a href="https://docs.microsoft.com/windows/desktop/SecGloss/w-gly">Winlogon</a> to terminate the session. If <i>fDisconnectOnLogonFailure</i> is <b>FALSE</b> and the logon fails, GINA can allow the user to submit different credentials.
     * @type {Integer}
     */
    fDisconnectOnLogonFailure {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }
}
