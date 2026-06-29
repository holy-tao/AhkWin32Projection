#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_URL_SCHEME_TYPE.ahk" { WS_URL_SCHEME_TYPE }

/**
 * The abstract base type for all URL schemes used with WsDecodeUrl and WsEncodeUrl APIs.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_url
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_URL {
    #StructPack 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_url_scheme_type">WS_URL_SCHEME_TYPE</a> structure that describes the type of URL scheme.
     */
    scheme : WS_URL_SCHEME_TYPE

}
