#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HTTP_VERSION.ahk
#Include .\HTTP_KNOWN_HEADER.ahk
#Include .\HTTP_RESPONSE_HEADERS.ahk
#Include .\HTTP_RESPONSE_V1.ahk

/**
 * Extends the HTTP version 1.0 response structure with more information for the response.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_response_v2
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_RESPONSE_V2 extends Win32Struct
{
    static sizeof => 328

    static packingSize => 8

    /**
     * @type {HTTP_RESPONSE_V1}
     */
    Base{
        get {
            if(!this.HasProp("__Base"))
                this.__Base := HTTP_RESPONSE_V1(this.ptr + 0)
            return this.__Base
        }
    }

    /**
     * The number of <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_response_info">HTTP_RESPONSE_INFO</a> structures in the array pointed to by <b>pResponseInfo</b>.
     * 
     * The count of the HTTP_RESPONSE_INFO elements in the array pointed to by <b>pResponseInfo</b>.
     * @type {Integer}
     */
    ResponseInfoCount {
        get => NumGet(this, 312, "ushort")
        set => NumPut("ushort", value, this, 312)
    }

    /**
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_response_info">HTTP_RESPONSE_INFO</a> structures containing more information about the request.
     * @type {Pointer<HTTP_RESPONSE_INFO>}
     */
    pResponseInfo {
        get => NumGet(this, 320, "ptr")
        set => NumPut("ptr", value, this, 320)
    }
}
