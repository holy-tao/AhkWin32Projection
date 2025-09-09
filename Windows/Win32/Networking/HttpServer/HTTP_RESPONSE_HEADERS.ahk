#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HTTP_KNOWN_HEADER.ahk

/**
 * Contains the headers sent with an HTTP response.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_response_headers
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_RESPONSE_HEADERS extends Win32Struct
{
    static sizeof => 272

    static packingSize => 8

    /**
     * A number of unknown headers sent with the HTTP response and contained in the array pointed to by the <b>pUnknownHeaders</b> member. This number cannot exceed 9999.
     * @type {Integer}
     */
    UnknownHeaderCount {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * A pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_unknown_header">HTTP_UNKNOWN_HEADER</a> structures that contains one structure for each of the unknown headers sent in the HTTP response.
     * @type {Pointer<HTTP_UNKNOWN_HEADER>}
     */
    pUnknownHeaders {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * This member is reserved and must be zero.
     * @type {Integer}
     */
    TrailerCount {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * This member is reserved and must be <b>NULL</b>.
     * @type {Pointer<HTTP_UNKNOWN_HEADER>}
     */
    pTrailers {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Fixed-size array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_known_header">HTTP_KNOWN_HEADER</a> structures. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ne-http-http_header_id">HTTP_HEADER_ID</a> enumeration provides a mapping from header types to array indexes. If a known header of a given type is included in the HTTP response, the array element at the index that corresponds to that type specifies the header value. Those elements of the array for which no corresponding headers are present contain a zero-valued <b>RawValueLength</b> member. Use <b>RawValueLength</b> to determine the end of the header string pointed to by <b>pRawValue</b>, rather than relying on the string to have a terminating null.
     * @type {Array<HTTP_KNOWN_HEADER>}
     */
    KnownHeaders{
        get {
            if(!this.HasProp("__KnownHeadersProxyArray"))
                this.__KnownHeadersProxyArray := Win32FixedArray(this.ptr + 32, 30, HTTP_KNOWN_HEADER, "")
            return this.__KnownHeadersProxyArray
        }
    }
}
