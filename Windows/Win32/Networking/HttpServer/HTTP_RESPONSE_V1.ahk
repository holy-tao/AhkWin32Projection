#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HTTP_DATA_CHUNK.ahk" { HTTP_DATA_CHUNK }
#Import ".\HTTP_KNOWN_HEADER.ahk" { HTTP_KNOWN_HEADER }
#Import ".\HTTP_VERSION.ahk" { HTTP_VERSION }
#Import ".\HTTP_UNKNOWN_HEADER.ahk" { HTTP_UNKNOWN_HEADER }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\HTTP_RESPONSE_HEADERS.ahk" { HTTP_RESPONSE_HEADERS }

/**
 * Contains data associated with an HTTP response.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_response_v1
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_RESPONSE_V1 {
    #StructPack 8

    /**
     * The optional logging flags change the default response behavior.     These  can be one of any of the  <a href="https://docs.microsoft.com/windows/desktop/Http/http-response-flag--constants">HTTP_RESPONSE_FLAG</a> values.
     */
    Flags : UInt32

    /**
     * This member is ignored; the response is always an HTTP/1.1 response.
     */
    Version : HTTP_VERSION

    /**
     * Numeric status code that characterizes the result of the HTTP request (for example, 200 signifying "OK" or 404 signifying "Not Found"). For more information and a list of these codes, see Section 10 of 
     * <a href="https://www.ietf.org/rfc/rfc2616.txt">RFC 2616</a>.
     * 
     * If a request is directed to a URL that is reserved but not registered, indicating that the appropriate application to handle it is not running, then the HTTP Server API itself returns a response with status code 400, signifying "Bad Request". This is transparent to the application. A code 400 is preferred here to 503 ("Server not available") because the latter is interpreted by some smart load balancers as an indication that the server is overloaded.
     */
    StatusCode : UInt16

    /**
     * Size, in bytes, of the string pointed to by the <b>pReason</b> member not including the terminating null. May be zero.
     */
    ReasonLength : UInt16

    /**
     * A pointer to a human-readable, null-terminated string of printable characters that characterizes the result of the HTTP request (for example, "OK" or "Not Found").
     */
    pReason : PSTR

    /**
     * An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_response_headers">HTTP_RESPONSE_HEADERS</a> structure that contains the headers used in this response.
     */
    Headers : HTTP_RESPONSE_HEADERS

    /**
     * A number of entity-body data blocks specified in the <b>pEntityChunks</b> array. This number cannot exceed 100. If the response has no entity body, this member must be zero.
     */
    EntityChunkCount : UInt16

    /**
     * An array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_data_chunk">HTTP_DATA_CHUNK</a> structures that together specify all the data blocks that make up the entity body of the response.
     */
    pEntityChunks : HTTP_DATA_CHUNK.Ptr

}
