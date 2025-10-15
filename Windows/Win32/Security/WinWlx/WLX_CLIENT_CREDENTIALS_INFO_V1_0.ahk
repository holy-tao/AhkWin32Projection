#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * Contains the client credentials returned by a call to WlxQueryClientCredentials or WlxQueryInetConnectorCredentials.
 * @see https://docs.microsoft.com/windows/win32/api//winwlx/ns-winwlx-wlx_client_credentials_info_v1_0
 * @namespace Windows.Win32.Security.WinWlx
 * @version v4.0.30319
 */
class WLX_CLIENT_CREDENTIALS_INFO_V1_0 extends Win32Struct
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
     * @type {PWSTR}
     */
    pszUserName{
        get {
            if(!this.HasProp("__pszUserName"))
                this.__pszUserName := PWSTR(this.ptr + 8)
            return this.__pszUserName
        }
    }

    /**
     * A pointer to the name of the domain used to log on.
     * @type {PWSTR}
     */
    pszDomain{
        get {
            if(!this.HasProp("__pszDomain"))
                this.__pszDomain := PWSTR(this.ptr + 16)
            return this.__pszDomain
        }
    }

    /**
     * A pointer to the plaintext password of the user account. When you have finished using <i>pszPassword</i>, clear the sensitive information from memory by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)">SecureZeroMemory</a> function.
     * 
     * <b>Windows XP/2000:  </b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)">SecureZeroMemory</a> is not supported. Overwrite the memory allocated for <i>pszPassword</i> to clear the sensitive information.
     * 
     * For more information about protecting passwords, see <a href="https://docs.microsoft.com/windows/desktop/SecBP/handling-passwords">Handling Passwords</a>.
     * @type {PWSTR}
     */
    pszPassword{
        get {
            if(!this.HasProp("__pszPassword"))
                this.__pszPassword := PWSTR(this.ptr + 24)
            return this.__pszPassword
        }
    }

    /**
     * Forces a prompt for the password due to an administration override. This allows the distinction of auto logon with no password.
     * @type {BOOL}
     */
    fPromptForPassword{
        get {
            if(!this.HasProp("__fPromptForPassword"))
                this.__fPromptForPassword := BOOL(this.ptr + 32)
            return this.__fPromptForPassword
        }
    }
}
