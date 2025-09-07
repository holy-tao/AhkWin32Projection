#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HTTP_VERSION.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include .\HTTP_KNOWN_HEADER.ahk
#Include .\HTTP_RESPONSE_HEADERS.ahk

/**
 * Contains data associated with an HTTP response.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_response_v1
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_RESPONSE_V1 extends Win32Struct
{
    static sizeof => 312

    static packingSize => 8

    /**
     * The optional logging flags change the default response behavior.     These  can be one of any of the  <a href="https://docs.microsoft.com/windows/desktop/Http/http-response-flag--constants">HTTP_RESPONSE_FLAG</a> values.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * This member is ignored; the response is always an HTTP/1.1 response.
     * @type {HTTP_VERSION}
     */
    Version{
        get {
            if(!this.HasProp("__Version"))
                this.__Version := HTTP_VERSION(this.ptr + 4)
            return this.__Version
        }
    }

    /**
     * Numeric status code that characterizes the result of the HTTP request (for example, 200 signifying "OK" or 404 signifying "Not Found"). For more information and a list of these codes, see Section 10 of 
     * <a href="https://www.ietf.org/rfc/rfc2616.txt">RFC 2616</a>.
     * 
     * If a request is directed to a URL that is reserved but not registered, indicating that the appropriate application to handle it is not running, then the HTTP Server API itself returns a response with status code 400, signifying "Bad Request". This is transparent to the application. A code 400 is preferred here to 503 ("Server not available") because the latter is interpreted by some smart load balancers as an indication that the server is overloaded.
     * @type {Integer}
     */
    StatusCode {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * Size, in bytes, of the string pointed to by the <b>pReason</b> member not including the terminating null. May be zero.
     * @type {Integer}
     */
    ReasonLength {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * A pointer to a human-readable, null-terminated string of printable characters that characterizes the result of the HTTP request (for example, "OK" or "Not Found").
     * @type {PSTR}
     */
    pReason{
        get {
            if(!this.HasProp("__pReason"))
                this.__pReason := PSTR(this.ptr + 16)
            return this.__pReason
        }
    }

    /**
     * An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_response_headers">HTTP_RESPONSE_HEADERS</a> structure that contains the headers used in this response.
     * @type {HTTP_RESPONSE_HEADERS}
     */
    Headers{
        get {
            if(!this.HasProp("__Headers"))
                this.__Headers := HTTP_RESPONSE_HEADERS(this.ptr + 24)
            return this.__Headers
        }
    }

    /**
     * A number of entity-body data blocks specified in the <b>pEntityChunks</b> array. This number cannot exceed 100. If the response has no entity body, this member must be zero.
     * @type {Integer}
     */
    EntityChunkCount {
        get => NumGet(this, 296, "ushort")
        set => NumPut("ushort", value, this, 296)
    }

    /**
     * An array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_data_chunk">HTTP_DATA_CHUNK</a> structures that together specify all the data blocks that make up the entity body of the response.
     * @type {Pointer<HTTP_DATA_CHUNK>}
     */
    pEntityChunks {
        get => NumGet(this, 304, "ptr")
        set => NumPut("ptr", value, this, 304)
    }
}
