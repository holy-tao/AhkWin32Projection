#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * The WINHTTP_CURRENT_USER_IE_PROXY_CONFIG structure contains the Internet Explorer proxy configuration information.
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/ns-winhttp-winhttp_current_user_ie_proxy_config
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class WINHTTP_CURRENT_USER_IE_PROXY_CONFIG extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * If TRUE, indicates that the Internet Explorer proxy configuration for the current user specifies "automatically detect settings".
     * @type {Integer}
     */
    fAutoDetect {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Pointer to a null-terminated Unicode string that contains the auto-configuration URL if the Internet Explorer proxy configuration for the current user specifies "Use automatic proxy configuration".
     * @type {PWSTR}
     */
    lpszAutoConfigUrl{
        get {
            if(!this.HasProp("__lpszAutoConfigUrl"))
                this.__lpszAutoConfigUrl := PWSTR(this.ptr + 8)
            return this.__lpszAutoConfigUrl
        }
    }

    /**
     * Pointer to a null-terminated Unicode string that contains the proxy URL if the Internet Explorer proxy configuration for the current user specifies "use a proxy server".
     * @type {PWSTR}
     */
    lpszProxy{
        get {
            if(!this.HasProp("__lpszProxy"))
                this.__lpszProxy := PWSTR(this.ptr + 16)
            return this.__lpszProxy
        }
    }

    /**
     * Pointer to a null-terminated Unicode string that contains the optional proxy by-pass server list.
     * @type {PWSTR}
     */
    lpszProxyBypass{
        get {
            if(!this.HasProp("__lpszProxyBypass"))
                this.__lpszProxyBypass := PWSTR(this.ptr + 24)
            return this.__lpszProxyBypass
        }
    }
}
