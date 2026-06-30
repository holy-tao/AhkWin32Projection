#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HTTP_KNOWN_HEADER.ahk
#Include .\HTTP_UNKNOWN_HEADER.ahk
#Include .\HTTP_SSL_INFO.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\HTTP_VERB.ahk
#Include .\HTTP_REQUEST_V1.ahk
#Include .\HTTP_REQUEST_INFO.ahk
#Include ..\WinSock\SOCKADDR.ahk
#Include .\HTTP_TRANSPORT_ADDRESS.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include .\HTTP_DATA_CHUNK.ahk
#Include .\HTTP_REQUEST_HEADERS.ahk
#Include .\HTTP_VERSION.ahk
#Include .\HTTP_COOKED_URL.ahk

/**
 * Extends the HTTP_REQUEST_V1 request structure with more information about the request.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_request_v2
 * @namespace Windows.Win32.Networking.HttpServer
 */
class HTTP_REQUEST_V2 extends Win32Struct {
    static sizeof => 864

    static packingSize => 8

    /**
     * @type {HTTP_REQUEST_V1}
     */
    Base {
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
        get => NumGet(this, 848, "ushort")
        set => NumPut("ushort", value, this, 848)
    }

    /**
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_request_info">HTTP_REQUEST_INFO</a> structures that contains additional information about the request.
     * @type {Pointer<HTTP_REQUEST_INFO>}
     */
    pRequestInfo {
        get => NumGet(this, 856, "ptr")
        set => NumPut("ptr", value, this, 856)
    }
}
