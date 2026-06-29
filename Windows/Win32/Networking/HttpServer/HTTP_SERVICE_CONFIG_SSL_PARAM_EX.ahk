#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HTTP_CERT_CONFIG_ENTRY.ahk" { HTTP_CERT_CONFIG_ENTRY }
#Import ".\HTTP_PERFORMANCE_PARAM.ahk" { HTTP_PERFORMANCE_PARAM }
#Import ".\HTTP2_SETTINGS_LIMITS_PARAM.ahk" { HTTP2_SETTINGS_LIMITS_PARAM }
#Import ".\HTTP_ERROR_HEADERS_PARAM.ahk" { HTTP_ERROR_HEADERS_PARAM }
#Import ".\HTTP_UNKNOWN_HEADER.ahk" { HTTP_UNKNOWN_HEADER }
#Import ".\HTTP_PERFORMANCE_PARAM_TYPE.ahk" { HTTP_PERFORMANCE_PARAM_TYPE }
#Import ".\HTTP2_WINDOW_SIZE_PARAM.ahk" { HTTP2_WINDOW_SIZE_PARAM }
#Import ".\HTTP_CERT_CONFIG_PARAM.ahk" { HTTP_CERT_CONFIG_PARAM }
#Import ".\HTTP_SSL_SERVICE_CONFIG_EX_PARAM_TYPE.ahk" { HTTP_SSL_SERVICE_CONFIG_EX_PARAM_TYPE }
#Import ".\HTTP_TLS_SESSION_TICKET_KEYS_PARAM.ahk" { HTTP_TLS_SESSION_TICKET_KEYS_PARAM }
#Import ".\HTTP_TLS_RESTRICTIONS_PARAM.ahk" { HTTP_TLS_RESTRICTIONS_PARAM }

/**
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_SERVICE_CONFIG_SSL_PARAM_EX {
    #StructPack 8

    ParamType : HTTP_SSL_SERVICE_CONFIG_EX_PARAM_TYPE

    Flags : Int64

    Http2WindowSizeParam : HTTP2_WINDOW_SIZE_PARAM

    static __New() {
        DefineProp(this.Prototype, 'Http2SettingsLimitsParam', { type: HTTP2_SETTINGS_LIMITS_PARAM, offset: 16 })
        DefineProp(this.Prototype, 'HttpPerformanceParam', { type: HTTP_PERFORMANCE_PARAM, offset: 16 })
        DefineProp(this.Prototype, 'HttpTlsRestrictionsParam', { type: HTTP_TLS_RESTRICTIONS_PARAM, offset: 16 })
        DefineProp(this.Prototype, 'HttpErrorHeadersParam', { type: HTTP_ERROR_HEADERS_PARAM, offset: 16 })
        DefineProp(this.Prototype, 'HttpTlsSessionTicketKeysParam', { type: HTTP_TLS_SESSION_TICKET_KEYS_PARAM, offset: 16 })
        DefineProp(this.Prototype, 'HttpCertConfigParam', { type: HTTP_CERT_CONFIG_PARAM, offset: 16 })
        this.DeleteProp("__New")
    }
}
