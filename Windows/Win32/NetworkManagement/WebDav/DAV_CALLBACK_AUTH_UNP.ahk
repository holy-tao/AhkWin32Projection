#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Stores user name and password information that was retrieved by the DavAuthCallback callback function.
 * @remarks
 * This structure is included as a member in the <a href="https://docs.microsoft.com/windows/desktop/api/davclnt/ns-davclnt-dav_callback_cred">DAV_CALLBACK_CRED</a> structure.
  * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/davclnt/nc-davclnt-pfndavauthcallback_freecred">DavFreeCredCallback</a> callback function should free only the buffer that the <b>pBuffer</b> member points to, not the entire structure.
 * @see https://learn.microsoft.com/windows/win32/api/davclnt/ns-davclnt-dav_callback_auth_unp
 * @namespace Windows.Win32.NetworkManagement.WebDav
 * @version v4.0.30319
 */
class DAV_CALLBACK_AUTH_UNP extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A pointer to a string that contains the user name. This string is allocated by the <a href="https://docs.microsoft.com/windows/desktop/api/davclnt/nc-davclnt-pfndavauthcallback">DavAuthCallback</a> callback function.
     * @type {PWSTR}
     */
    pszUserName{
        get {
            if(!this.HasProp("__pszUserName"))
                this.__pszUserName := PWSTR(this.ptr + 0)
            return this.__pszUserName
        }
    }

    /**
     * The length, in WCHAR, of the user name, not including the terminating <b>NULL</b> character.
     * @type {Integer}
     */
    ulUserNameLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A pointer to a string that contains the password. This string is allocated by <a href="https://docs.microsoft.com/windows/desktop/api/davclnt/nc-davclnt-pfndavauthcallback">DavAuthCallback</a>.
     * @type {PWSTR}
     */
    pszPassword{
        get {
            if(!this.HasProp("__pszPassword"))
                this.__pszPassword := PWSTR(this.ptr + 16)
            return this.__pszPassword
        }
    }

    /**
     * The length, in WCHAR, of the password, not including the terminating <b>NULL</b> character.
     * @type {Integer}
     */
    ulPasswordLength {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
