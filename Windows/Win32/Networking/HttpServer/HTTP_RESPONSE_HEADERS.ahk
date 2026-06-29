#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HTTP_KNOWN_HEADER.ahk" { HTTP_KNOWN_HEADER }
#Import ".\HTTP_UNKNOWN_HEADER.ahk" { HTTP_UNKNOWN_HEADER }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains the headers sent with an HTTP response.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_response_headers
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_RESPONSE_HEADERS {
    #StructPack 8

    /**
     * A number of unknown headers sent with the HTTP response and contained in the array pointed to by the <b>pUnknownHeaders</b> member. This number cannot exceed 9999.
     */
    UnknownHeaderCount : UInt16

    /**
     * A pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_unknown_header">HTTP_UNKNOWN_HEADER</a> structures that contains one structure for each of the unknown headers sent in the HTTP response.
     */
    pUnknownHeaders : HTTP_UNKNOWN_HEADER.Ptr

    /**
     * This member is reserved and must be zero.
     */
    TrailerCount : UInt16

    /**
     * This member is reserved and must be <b>NULL</b>.
     */
    pTrailers : HTTP_UNKNOWN_HEADER.Ptr

    /**
     * Fixed-size array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_known_header">HTTP_KNOWN_HEADER</a> structures. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ne-http-http_header_id">HTTP_HEADER_ID</a> enumeration provides a mapping from header types to array indexes. If a known header of a given type is included in the HTTP response, the array element at the index that corresponds to that type specifies the header value. Those elements of the array for which no corresponding headers are present contain a zero-valued <b>RawValueLength</b> member. Use <b>RawValueLength</b> to determine the end of the header string pointed to by <b>pRawValue</b>, rather than relying on the string to have a terminating null.
     */
    KnownHeaders : HTTP_KNOWN_HEADER[30]

}
