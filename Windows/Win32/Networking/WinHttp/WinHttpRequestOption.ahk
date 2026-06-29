#Requires AutoHotkey v2.1-alpha.26+ 64-bit

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
export default struct WinHttpRequestOption {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
