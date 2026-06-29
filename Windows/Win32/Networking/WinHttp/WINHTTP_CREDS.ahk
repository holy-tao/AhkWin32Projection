#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINHTTP_CREDS_AUTHSCHEME.ahk" { WINHTTP_CREDS_AUTHSCHEME }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains user credential information used for server and proxy authentication. (WINHTTP_CREDS)
 * @remarks
 * This structure is used with options <b>WINHTTP_OPTION_GLOBAL_SERVER_CREDS</b> and <b>WINHTTP_OPTION_GLOBAL_PROXY_CREDS</b>
 * <a href="https://docs.microsoft.com/windows/desktop/WinHttp/option-flags">option flags</a>. These options require the registry key <b>HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings!ShareCredsWithWinHttp</b>. This registry key is not present by default.
 * 
 * When it is set, WinINet will send credentials  down to WinHTTP. Whenever WinHttp gets an authentication challenge and if there are no credentials set on the current handle, it will use the credentials provided by WinINet. In order to share server credentials in addition to proxy credentials, users needs to set  the <b>WINHTTP_OPTION_USE_GLOBAL_SERVER_CREDENTIALS</b> option flag.
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/ns-winhttp-winhttp_creds
 * @namespace Windows.Win32.Networking.WinHttp
 */
export default struct WINHTTP_CREDS {
    #StructPack 8

    /**
     * Pointer to a buffer that contains username.
     */
    lpszUserName : PSTR

    /**
     * Pointer to a buffer that contains password.
     */
    lpszPassword : PSTR

    /**
     * Pointer to a buffer that contains realm.
     */
    lpszRealm : PSTR

    dwAuthScheme : WINHTTP_CREDS_AUTHSCHEME

    /**
     * Pointer to a buffer that contains hostname.
     */
    lpszHostName : PSTR

    /**
     * The server connection port.
     */
    dwPort : UInt32

}
