#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The INTERNET_COOKIE2 structure contains the constituent parts of a cookie. This structure is used with the InternetGetCookieEx2 and InternetSetCookieEx2 functions.
 * @remarks
 * > [!NOTE]
 * > WinINet does not support server implementations. In addition, it should not be used from a service. For server implementations or services use [Microsoft Windows HTTP Services (WinHTTP)](/windows/desktop/winhttp/winhttp-start-page).
 * @see https://learn.microsoft.com/windows/win32/api/wininet/ns-wininet-internet_cookie2
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct INTERNET_COOKIE2 {
    #StructPack 8

    /**
     * Pointer to a string containing the cookie name. May be NULL if value is not NULL.
     */
    pwszName : PWSTR

    /**
     * Pointer to a string containing the cookie value. May be NULL if name is not NULL.
     */
    pwszValue : PWSTR

    /**
     * Pointer to a string containing the cookie domain. May be NULL.
     */
    pwszDomain : PWSTR

    /**
     * Pointer to a string containing the cookie path. May be NULL.
     */
    pwszPath : PWSTR

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
     */
    dwFlags : UInt32

    /**
     * The expiry time of the cookie.
     */
    ftExpires : FILETIME

    /**
     * Whether or not the expiry time is set.
     */
    fExpiresSet : BOOL

}
