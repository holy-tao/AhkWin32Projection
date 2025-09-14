#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains user credential information used for server and proxy authentication. (WINHTTP_CREDS_EX)
 * @remarks
 * This structure is used with options <b>WINHTTP_OPTION_GLOBAL_SERVER_CREDS</b> and <b>WINHTTP_OPTION_GLOBAL_PROXY_CREDS</b>
  * <a href="https://docs.microsoft.com/windows/desktop/WinHttp/option-flags">option flags</a>. These options require the registry key <b>HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ShareCredsWithWinHttp</b>. This registry key is not present by default.
  * 
  * When it is set, WinINet will send credentials  down to WinHTTP. Whenever WinHttp gets an authentication challenge and if there are no credentials set on the current handle, it will use the credentials provided by WinINet. In order to share server credentials in addition to proxy credentials, users needs to set  the <b>WINHTTP_OPTION_USE_GLOBAL_SERVER_CREDENTIALS</b> option flag.
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/ns-winhttp-winhttp_creds_ex
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class WINHTTP_CREDS_EX extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Pointer to a buffer that contains username.
     * @type {Pointer<PSTR>}
     */
    lpszUserName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a buffer that contains password.
     * @type {Pointer<PSTR>}
     */
    lpszPassword {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to a buffer that contains realm.
     * @type {Pointer<PSTR>}
     */
    lpszRealm {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
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
     * @type {Pointer<PSTR>}
     */
    lpszHostName {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * The server connection port.
     * @type {Integer}
     */
    dwPort {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Pointer to a buffer that contains target URL.
     * @type {Pointer<PSTR>}
     */
    lpszUrl {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
