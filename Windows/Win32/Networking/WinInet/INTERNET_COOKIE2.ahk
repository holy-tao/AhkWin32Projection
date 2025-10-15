#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * The INTERNET_COOKIE2 structure contains the constituent parts of a cookie. This structure is used with the InternetGetCookieEx2 and InternetSetCookieEx2 functions.
 * @remarks
 * 
  * > [!NOTE]
  * > WinINet does not support server implementations. In addition, it should not be used from a service. For server implementations or services use [Microsoft Windows HTTP Services (WinHTTP)](/windows/desktop/winhttp/winhttp-start-page).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wininet/ns-wininet-internet_cookie2
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class INTERNET_COOKIE2 extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Pointer to a string containing the cookie name. May be NULL if value is not NULL.
     * @type {PWSTR}
     */
    pwszName{
        get {
            if(!this.HasProp("__pwszName"))
                this.__pwszName := PWSTR(this.ptr + 0)
            return this.__pwszName
        }
    }

    /**
     * Pointer to a string containing the cookie value. May be NULL if name is not NULL.
     * @type {PWSTR}
     */
    pwszValue{
        get {
            if(!this.HasProp("__pwszValue"))
                this.__pwszValue := PWSTR(this.ptr + 8)
            return this.__pwszValue
        }
    }

    /**
     * Pointer to a string containing the cookie domain. May be NULL.
     * @type {PWSTR}
     */
    pwszDomain{
        get {
            if(!this.HasProp("__pwszDomain"))
                this.__pwszDomain := PWSTR(this.ptr + 16)
            return this.__pwszDomain
        }
    }

    /**
     * Pointer to a string containing the cookie path. May be NULL.
     * @type {PWSTR}
     */
    pwszPath{
        get {
            if(!this.HasProp("__pwszPath"))
                this.__pwszPath := PWSTR(this.ptr + 24)
            return this.__pwszPath
        }
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
     * @type {BOOL}
     */
    fExpiresSet{
        get {
            if(!this.HasProp("__fExpiresSet"))
                this.__fExpiresSet := BOOL(this.ptr + 48)
            return this.__fExpiresSet
        }
    }
}
