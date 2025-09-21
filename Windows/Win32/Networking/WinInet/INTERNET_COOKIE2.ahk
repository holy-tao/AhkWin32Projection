#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * The INTERNET_COOKIE2 structure contains the constituent parts of a cookie. This structure is used with the InternetGetCookieEx2 and InternetSetCookieEx2 functions.
 * @remarks
 * > [!NOTE]
  * > WinINet does not support server implementations. In addition, it should not be used from a service. For server implementations or services use [Microsoft Windows HTTP Services (WinHTTP)](/windows/desktop/winhttp/winhttp-start-page).
 * @see https://learn.microsoft.com/windows/win32/api/wininet/ns-wininet-internet_cookie2
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class INTERNET_COOKIE2 extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Pointer to a string containing the cookie name. May be NULL if value is not NULL.
     * @type {Pointer<Char>}
     */
    pwszName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a string containing the cookie value. May be NULL if name is not NULL.
     * @type {Pointer<Char>}
     */
    pwszValue {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to a string containing the cookie domain. May be NULL.
     * @type {Pointer<Char>}
     */
    pwszDomain {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to a string containing the cookie path. May be NULL.
     * @type {Pointer<Char>}
     */
    pwszPath {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Flags for additional cookie details. The following flags are available.
     * 
     * | Value | Meaning |
     * |-------|---------|
     * | INTERNET_COOKIE_IS_SECURE | This is a secure cookie. |
     * | INTERNET_COOKIE_IS_SESSION | This is a session cookie. |
     * | INTERNET_COOKIE_IS_RESTRICTED | This cookie is restricted to first-party contexts. |
     * | INTERNET_COOKIE_HTTPONLY | This is an HTTP-only cookie. |
     * | INTERNET_COOKIE_HOST_ONLY | This is a host-only cookie. |
     * | INTERNET_COOKIE_HOST_ONLY_APPLIED | The host-only setting has been applied to this cookie. |
     * | INTERNET_COOKIE_SAME_SITE_STRICT | The SameSite security level for this cookie is "strict". |
     * | INTERNET_COOKIE_SAME_SITE_LAX | The SameSite security level for this cookie is "lax". |
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The expiry time of the cookie.
     * @type {FILETIME}
     */
    ftExpires{
        get {
            if(!this.HasProp("__ftExpires"))
                this.__ftExpires := FILETIME(this.ptr + 40)
            return this.__ftExpires
        }
    }

    /**
     * Whether or not the expiry time is set.
     * @type {Integer}
     */
    fExpiresSet {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }
}
