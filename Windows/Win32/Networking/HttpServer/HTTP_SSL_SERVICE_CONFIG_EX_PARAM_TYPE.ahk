#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_SSL_SERVICE_CONFIG_EX_PARAM_TYPE {
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
    static ExParamTypeHttp2Window => 0

    /**
     * @type {Integer (Int32)}
     */
    static ExParamTypeHttp2SettingsLimits => 1

    /**
     * @type {Integer (Int32)}
     */
    static ExParamTypeHttpPerformance => 2

    /**
     * @type {Integer (Int32)}
     */
    static ExParamTypeTlsRestrictions => 3

    /**
     * @type {Integer (Int32)}
     */
    static ExParamTypeErrorHeaders => 4

    /**
     * @type {Integer (Int32)}
     */
    static ExParamTypeTlsSessionTicketKeys => 5

    /**
     * @type {Integer (Int32)}
     */
    static ExParamTypeCertConfig => 6

    /**
     * @type {Integer (Int32)}
     */
    static ExParamTypeMax => 7
}
