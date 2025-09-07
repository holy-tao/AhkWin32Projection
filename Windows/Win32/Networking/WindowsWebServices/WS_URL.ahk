#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The abstract base type for all URL schemes used with WsDecodeUrl and WsEncodeUrl APIs.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_url
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_URL extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_url_scheme_type">WS_URL_SCHEME_TYPE</a> structure that describes the type of URL scheme.
     * @type {Integer}
     */
    scheme {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
