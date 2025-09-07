#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
     * @type {Pointer<Ptr>}
     */
    lpszAutoConfigUrl {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to a null-terminated Unicode string that contains the proxy URL if the Internet Explorer proxy configuration for the current user specifies "use a proxy server".
     * @type {Pointer<Ptr>}
     */
    lpszProxy {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to a null-terminated Unicode string that contains the optional proxy by-pass server list.
     * @type {Pointer<Ptr>}
     */
    lpszProxyBypass {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
