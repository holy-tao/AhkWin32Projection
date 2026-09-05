#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.HttpServer
 */
class HTTP_SSL_SERVICE_CONFIG_EX_PARAM_TYPE extends Win32Enum {

    /**
     * Native name: ExParamTypeHttp2Window
     * @type {Integer (Int32)}
     */
    static Http2Window => 0

    /**
     * Native name: ExParamTypeHttp2SettingsLimits
     * @type {Integer (Int32)}
     */
    static Http2SettingsLimits => 1

    /**
     * Native name: ExParamTypeHttpPerformance
     * @type {Integer (Int32)}
     */
    static HttpPerformance => 2

    /**
     * Native name: ExParamTypeTlsRestrictions
     * @type {Integer (Int32)}
     */
    static TlsRestrictions => 3

    /**
     * Native name: ExParamTypeErrorHeaders
     * @type {Integer (Int32)}
     */
    static ErrorHeaders => 4

    /**
     * Native name: ExParamTypeTlsSessionTicketKeys
     * @type {Integer (Int32)}
     */
    static TlsSessionTicketKeys => 5

    /**
     * Native name: ExParamTypeCertConfig
     * @type {Integer (Int32)}
     */
    static CertConfig => 6

    /**
     * Native name: ExParamTypeMax
     * @type {Integer (Int32)}
     */
    static Max => 7
}
