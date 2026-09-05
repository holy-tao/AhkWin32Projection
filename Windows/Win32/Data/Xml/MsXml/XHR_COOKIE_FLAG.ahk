#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines a set of flags that you can assign to a cookie in the HTTP cookie jar by calling the SetCookie method or query from the HTTP cookie jar by calling the GetCookie method.
 * @see https://learn.microsoft.com/windows/win32/api/msxml6/ne-msxml6-xhr_cookie_flag
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
class XHR_COOKIE_FLAG extends Win32Enum {

    /**
     * The cookie is secure. 
     * 
     * When this flag is set, the client is only to return the cookie in subsequent requests if those requests use HTTPS.
     * Native name: XHR_COOKIE_IS_SECURE
     * @type {Integer (Int32)}
     */
    static IS_SECURE => 1

    /**
     * The cookie is only usable in the current HTTP session and is not persisted or saved.
     * Native name: XHR_COOKIE_IS_SESSION
     * @type {Integer (Int32)}
     */
    static IS_SESSION => 2

    /**
     * The cookie being set is a third-party cookie.
     * Native name: XHR_COOKIE_THIRD_PARTY
     * @type {Integer (Int32)}
     */
    static THIRD_PARTY => 16

    /**
     * A prompt to the user is required to accept the cookie from the server.
     * Native name: XHR_COOKIE_PROMPT_REQUIRED
     * @type {Integer (Int32)}
     */
    static PROMPT_REQUIRED => 32

    /**
     * The cookie has a Platform-for-Privacy-Protection (P3P) header.
     * Native name: XHR_COOKIE_EVALUATE_P3P
     * @type {Integer (Int32)}
     */
    static EVALUATE_P3P => 64

    /**
     * A cookie with a Platform-for-Privacy-Protection (P3P) header has been applied.
     * Native name: XHR_COOKIE_APPLY_P3P
     * @type {Integer (Int32)}
     */
    static APPLY_P3P => 128

    /**
     * A cookie with a Platform-for-Privacy-Protection (P3P) header has been enabled.
     * Native name: XHR_COOKIE_P3P_ENABLED
     * @type {Integer (Int32)}
     */
    static P3P_ENABLED => 256

    /**
     * The cookie being set is associated with an untrusted site.
     * Native name: XHR_COOKIE_IS_RESTRICTED
     * @type {Integer (Int32)}
     */
    static IS_RESTRICTED => 512

    /**
     * Native name: XHR_COOKIE_IE6
     * @type {Integer (Int32)}
     */
    static IE6 => 1024

    /**
     * Native name: XHR_COOKIE_IS_LEGACY
     * @type {Integer (Int32)}
     */
    static IS_LEGACY => 2048

    /**
     * Does not allow a script or other active content to access this cookie.
     * Native name: XHR_COOKIE_NON_SCRIPT
     * @type {Integer (Int32)}
     */
    static NON_SCRIPT => 4096

    /**
     * Enables the retrieval of cookies that are marked as "HTTPOnly". 
     * 
     * Do not use this flag if you expose a scriptable interface, because this has security implications. If you expose a scriptable interface, you can become an attack vector for cross-site scripting attacks. It is imperative that you use this flag only if they can guarantee that you will never permit third-party code to set a cookie using this flag by way of an extensibility mechanism you provide.
     * Native name: XHR_COOKIE_HTTPONLY
     * @type {Integer (Int32)}
     */
    static HTTPONLY => 8192
}
