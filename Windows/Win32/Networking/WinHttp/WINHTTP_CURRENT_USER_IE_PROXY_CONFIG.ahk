#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The WINHTTP_CURRENT_USER_IE_PROXY_CONFIG structure contains the Internet Explorer proxy configuration information.
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/ns-winhttp-winhttp_current_user_ie_proxy_config
 * @namespace Windows.Win32.Networking.WinHttp
 */
export default struct WINHTTP_CURRENT_USER_IE_PROXY_CONFIG {
    #StructPack 8

    /**
     * If TRUE, indicates that the Internet Explorer proxy configuration for the current user specifies "automatically detect settings".
     */
    fAutoDetect : BOOL

    /**
     * Pointer to a null-terminated Unicode string that contains the auto-configuration URL if the Internet Explorer proxy configuration for the current user specifies "Use automatic proxy configuration".
     */
    lpszAutoConfigUrl : PWSTR

    /**
     * Pointer to a null-terminated Unicode string that contains the proxy URL if the Internet Explorer proxy configuration for the current user specifies "use a proxy server".
     */
    lpszProxy : PWSTR

    /**
     * Pointer to a null-terminated Unicode string that contains the optional proxy by-pass server list.
     */
    lpszProxyBypass : PWSTR

}
