#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_URL_SCHEME_TYPE.ahk" { WS_URL_SCHEME_TYPE }
#Import ".\WS_STRING.ahk" { WS_STRING }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WS_URL.ahk" { WS_URL }

/**
 * The URL subtype for specifying an HTTPS URL.
 * @remarks
 * If used with the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsdecodeurl">WsDecodeUrl</a> field, portAsString is a zero-length string if no port is specified in url.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_https_url
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_HTTPS_URL {
    #StructPack 8

    /**
     * The base type from which this URL subtype and all other URL subtypes derive. The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_url_scheme_type">WS_URL_SCHEME_TYPE</a> is <b>WS_URL_HTTPS_SCHEME_TYPE</b>.
     */
    url : WS_URL

    /**
     * The host name.
     */
    host : WS_STRING

    /**
     * The port number.
     */
    port : UInt16

    /**
     * The port number as string.
     */
    portAsString : WS_STRING

    /**
     * The path.
     */
    path : WS_STRING

    /**
     * The query.
     */
    query : WS_STRING

    /**
     * The fragment.
     */
    fragment : WS_STRING

}
