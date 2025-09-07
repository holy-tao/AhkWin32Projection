#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * Contains user credential information used for server and proxy authentication. (WINHTTP_CREDS)
 * @remarks
 * This structure is used with options <b>WINHTTP_OPTION_GLOBAL_SERVER_CREDS</b> and <b>WINHTTP_OPTION_GLOBAL_PROXY_CREDS</b>
  * <a href="https://docs.microsoft.com/windows/desktop/WinHttp/option-flags">option flags</a>. These options require the registry key <b>HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings!ShareCredsWithWinHttp</b>. This registry key is not present by default.
  * 
  * When it is set, WinINet will send credentials  down to WinHTTP. Whenever WinHttp gets an authentication challenge and if there are no credentials set on the current handle, it will use the credentials provided by WinINet. In order to share server credentials in addition to proxy credentials, users needs to set  the <b>WINHTTP_OPTION_USE_GLOBAL_SERVER_CREDENTIALS</b> option flag.
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/ns-winhttp-winhttp_creds
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class WINHTTP_CREDS extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Pointer to a buffer that contains username.
     * @type {PSTR}
     */
    lpszUserName{
        get {
            if(!this.HasProp("__lpszUserName"))
                this.__lpszUserName := PSTR(this.ptr + 0)
            return this.__lpszUserName
        }
    }

    /**
     * Pointer to a buffer that contains password.
     * @type {PSTR}
     */
    lpszPassword{
        get {
            if(!this.HasProp("__lpszPassword"))
                this.__lpszPassword := PSTR(this.ptr + 8)
            return this.__lpszPassword
        }
    }

    /**
     * Pointer to a buffer that contains realm.
     * @type {PSTR}
     */
    lpszRealm{
        get {
            if(!this.HasProp("__lpszRealm"))
                this.__lpszRealm := PSTR(this.ptr + 16)
            return this.__lpszRealm
        }
    }

    /**
     * 
     * @type {Integer}
     */
    dwAuthScheme {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Pointer to a buffer that contains hostname.
     * @type {PSTR}
     */
    lpszHostName{
        get {
            if(!this.HasProp("__lpszHostName"))
                this.__lpszHostName := PSTR(this.ptr + 32)
            return this.__lpszHostName
        }
    }

    /**
     * The server connection port.
     * @type {Integer}
     */
    dwPort {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
