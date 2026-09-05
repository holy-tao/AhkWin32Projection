#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Includes options that can be set or retrieved for the current Microsoft Windows HTTP Services (WinHTTP) session.
 * @remarks
 * Set an option by specifying one of the preceding constants as the parameter of the [**Option**](iwinhttprequest-option.md) property.
 * 
 * > [!Note]  
 * > For Windows XP and Windows 2000, see the [Run-Time Requirements](winhttp-start-page.md) section of the WinHttp start page.
 * @see https://learn.microsoft.com/windows/win32/WinHttp/winhttprequestoption
 * @namespace Windows.Win32.Networking.WinHttp
 */
class WinHttpRequestOption extends Win32Enum {

    /**
     * Native name: WinHttpRequestOption_UserAgentString
     * @type {Integer (Int32)}
     */
    static UserAgentString => 0

    /**
     * Native name: WinHttpRequestOption_URL
     * @type {Integer (Int32)}
     */
    static URL => 1

    /**
     * Native name: WinHttpRequestOption_URLCodePage
     * @type {Integer (Int32)}
     */
    static URLCodePage => 2

    /**
     * Native name: WinHttpRequestOption_EscapePercentInURL
     * @type {Integer (Int32)}
     */
    static EscapePercentInURL => 3

    /**
     * Native name: WinHttpRequestOption_SslErrorIgnoreFlags
     * @type {Integer (Int32)}
     */
    static SslErrorIgnoreFlags => 4

    /**
     * Native name: WinHttpRequestOption_SelectCertificate
     * @type {Integer (Int32)}
     */
    static SelectCertificate => 5

    /**
     * Native name: WinHttpRequestOption_EnableRedirects
     * @type {Integer (Int32)}
     */
    static EnableRedirects => 6

    /**
     * Native name: WinHttpRequestOption_UrlEscapeDisable
     * @type {Integer (Int32)}
     */
    static UrlEscapeDisable => 7

    /**
     * Native name: WinHttpRequestOption_UrlEscapeDisableQuery
     * @type {Integer (Int32)}
     */
    static UrlEscapeDisableQuery => 8

    /**
     * Native name: WinHttpRequestOption_SecureProtocols
     * @type {Integer (Int32)}
     */
    static SecureProtocols => 9

    /**
     * Native name: WinHttpRequestOption_EnableTracing
     * @type {Integer (Int32)}
     */
    static EnableTracing => 10

    /**
     * Native name: WinHttpRequestOption_RevertImpersonationOverSsl
     * @type {Integer (Int32)}
     */
    static RevertImpersonationOverSsl => 11

    /**
     * Native name: WinHttpRequestOption_EnableHttpsToHttpRedirects
     * @type {Integer (Int32)}
     */
    static EnableHttpsToHttpRedirects => 12

    /**
     * Native name: WinHttpRequestOption_EnablePassportAuthentication
     * @type {Integer (Int32)}
     */
    static EnablePassportAuthentication => 13

    /**
     * Native name: WinHttpRequestOption_MaxAutomaticRedirects
     * @type {Integer (Int32)}
     */
    static MaxAutomaticRedirects => 14

    /**
     * Native name: WinHttpRequestOption_MaxResponseHeaderSize
     * @type {Integer (Int32)}
     */
    static MaxResponseHeaderSize => 15

    /**
     * Native name: WinHttpRequestOption_MaxResponseDrainSize
     * @type {Integer (Int32)}
     */
    static MaxResponseDrainSize => 16

    /**
     * Native name: WinHttpRequestOption_EnableHttp1_1
     * @type {Integer (Int32)}
     */
    static EnableHttp1_1 => 17

    /**
     * Native name: WinHttpRequestOption_EnableCertificateRevocationCheck
     * @type {Integer (Int32)}
     */
    static EnableCertificateRevocationCheck => 18

    /**
     * Native name: WinHttpRequestOption_RejectUserpwd
     * @type {Integer (Int32)}
     */
    static RejectUserpwd => 19
}
