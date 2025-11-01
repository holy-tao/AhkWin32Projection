#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/WinHttp/winhttprequestoption
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class WinHttpRequestOption{

    /**
     * @type {Integer (Int32)}
     */
    static WinHttpRequestOption_UserAgentString => 0

    /**
     * @type {Integer (Int32)}
     */
    static WinHttpRequestOption_URL => 1

    /**
     * @type {Integer (Int32)}
     */
    static WinHttpRequestOption_URLCodePage => 2

    /**
     * @type {Integer (Int32)}
     */
    static WinHttpRequestOption_EscapePercentInURL => 3

    /**
     * @type {Integer (Int32)}
     */
    static WinHttpRequestOption_SslErrorIgnoreFlags => 4

    /**
     * @type {Integer (Int32)}
     */
    static WinHttpRequestOption_SelectCertificate => 5

    /**
     * @type {Integer (Int32)}
     */
    static WinHttpRequestOption_EnableRedirects => 6

    /**
     * @type {Integer (Int32)}
     */
    static WinHttpRequestOption_UrlEscapeDisable => 7

    /**
     * @type {Integer (Int32)}
     */
    static WinHttpRequestOption_UrlEscapeDisableQuery => 8

    /**
     * @type {Integer (Int32)}
     */
    static WinHttpRequestOption_SecureProtocols => 9

    /**
     * @type {Integer (Int32)}
     */
    static WinHttpRequestOption_EnableTracing => 10

    /**
     * @type {Integer (Int32)}
     */
    static WinHttpRequestOption_RevertImpersonationOverSsl => 11

    /**
     * @type {Integer (Int32)}
     */
    static WinHttpRequestOption_EnableHttpsToHttpRedirects => 12

    /**
     * @type {Integer (Int32)}
     */
    static WinHttpRequestOption_EnablePassportAuthentication => 13

    /**
     * @type {Integer (Int32)}
     */
    static WinHttpRequestOption_MaxAutomaticRedirects => 14

    /**
     * @type {Integer (Int32)}
     */
    static WinHttpRequestOption_MaxResponseHeaderSize => 15

    /**
     * @type {Integer (Int32)}
     */
    static WinHttpRequestOption_MaxResponseDrainSize => 16

    /**
     * @type {Integer (Int32)}
     */
    static WinHttpRequestOption_EnableHttp1_1 => 17

    /**
     * @type {Integer (Int32)}
     */
    static WinHttpRequestOption_EnableCertificateRevocationCheck => 18

    /**
     * @type {Integer (Int32)}
     */
    static WinHttpRequestOption_RejectUserpwd => 19
}
