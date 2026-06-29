#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_URL_SCHEME_TYPE.ahk" { WS_URL_SCHEME_TYPE }
#Import ".\WS_STRING.ahk" { WS_STRING }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WS_URL.ahk" { WS_URL }

/**
 * The URL subtype for specifying a net.pipe URL.
 * @remarks
 * If used with the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsdecodeurl">WsDecodeUrl</a> field, <b>portAsString</b> is a zero-length string if no port is specified in <b>url</b>.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_netpipe_url
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_NETPIPE_URL {
    #StructPack 8

    /**
     * The base type from which this URL subtype and all other URL subtypes derive. The <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_url_scheme_type">WS_URL_SCHEME_TYPE</a> is <b>WS_URL_NETPIPE_SCHEME_TYPE</b>.
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
