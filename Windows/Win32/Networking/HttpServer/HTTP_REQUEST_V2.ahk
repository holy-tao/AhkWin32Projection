#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HTTP_VERSION.ahk
#Include .\HTTP_COOKED_URL.ahk
#Include .\HTTP_TRANSPORT_ADDRESS.ahk
#Include .\HTTP_KNOWN_HEADER.ahk
#Include .\HTTP_REQUEST_HEADERS.ahk
#Include .\HTTP_REQUEST_V1.ahk

/**
 * Extends the HTTP_REQUEST_V1 request structure with more information about the request.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_request_v2
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_REQUEST_V2 extends Win32Struct
{
    static sizeof => 536

    static packingSize => 8

    /**
     * @type {HTTP_REQUEST_V1}
     */
    Base{
        get {
            if(!this.HasProp("__Base"))
                this.__Base := HTTP_REQUEST_V1(0, this)
            return this.__Base
        }
    }

    /**
     * The number of <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_request_info">HTTP_REQUEST_INFO</a> structures in the array pointed to by <b>pRequestInfo</b>.
     * @type {Integer}
     */
    RequestInfoCount {
        get => NumGet(this, 520, "ushort")
        set => NumPut("ushort", value, this, 520)
    }

    /**
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_request_info">HTTP_REQUEST_INFO</a> structures that contains additional information about the request.
     * @type {Pointer<HTTP_REQUEST_INFO>}
     */
    pRequestInfo {
        get => NumGet(this, 528, "ptr")
        set => NumPut("ptr", value, this, 528)
    }
}
