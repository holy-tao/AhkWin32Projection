#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HTTP2_SETTINGS_LIMITS_PARAM.ahk
#Include .\HTTP_PERFORMANCE_PARAM.ahk
#Include .\HTTP_TLS_RESTRICTIONS_PARAM.ahk
#Include .\HTTP_ERROR_HEADERS_PARAM.ahk
#Include .\HTTP_TLS_SESSION_TICKET_KEYS_PARAM.ahk

/**
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_SERVICE_CONFIG_SSL_PARAM_EX extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ParamType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Http2WindowSizeParam {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {HTTP2_SETTINGS_LIMITS_PARAM}
     */
    Http2SettingsLimitsParam{
        get {
            if(!this.HasProp("__Http2SettingsLimitsParam"))
                this.__Http2SettingsLimitsParam := HTTP2_SETTINGS_LIMITS_PARAM(this.ptr + 16)
            return this.__Http2SettingsLimitsParam
        }
    }

    /**
     * @type {HTTP_PERFORMANCE_PARAM}
     */
    HttpPerformanceParam{
        get {
            if(!this.HasProp("__HttpPerformanceParam"))
                this.__HttpPerformanceParam := HTTP_PERFORMANCE_PARAM(this.ptr + 16)
            return this.__HttpPerformanceParam
        }
    }

    /**
     * @type {HTTP_TLS_RESTRICTIONS_PARAM}
     */
    HttpTlsRestrictionsParam{
        get {
            if(!this.HasProp("__HttpTlsRestrictionsParam"))
                this.__HttpTlsRestrictionsParam := HTTP_TLS_RESTRICTIONS_PARAM(this.ptr + 16)
            return this.__HttpTlsRestrictionsParam
        }
    }

    /**
     * @type {HTTP_ERROR_HEADERS_PARAM}
     */
    HttpErrorHeadersParam{
        get {
            if(!this.HasProp("__HttpErrorHeadersParam"))
                this.__HttpErrorHeadersParam := HTTP_ERROR_HEADERS_PARAM(this.ptr + 16)
            return this.__HttpErrorHeadersParam
        }
    }

    /**
     * @type {HTTP_TLS_SESSION_TICKET_KEYS_PARAM}
     */
    HttpTlsSessionTicketKeysParam{
        get {
            if(!this.HasProp("__HttpTlsSessionTicketKeysParam"))
                this.__HttpTlsSessionTicketKeysParam := HTTP_TLS_SESSION_TICKET_KEYS_PARAM(this.ptr + 16)
            return this.__HttpTlsSessionTicketKeysParam
        }
    }
}
