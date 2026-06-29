#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HTTP_HEADER_ID.ahk" { HTTP_HEADER_ID }
#Import ".\HTTP_KNOWN_HEADER.ahk" { HTTP_KNOWN_HEADER }

/**
 * Specifies the headers that are included in an HTTP response when more than one header is required.
 * @remarks
 * The HTTP version 1.0 API allows applications to send only one known response header with the response. Starting with the HTTP version 2.0 API, applications are enabled to send multiple known response headers.
 * 
 * The <b>pInfo</b>  member of the <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_response_info">HTTP_RESPONSE_INFO</a> structure points to this structure when the application provides multiple known headers on a response. The <b>HTTP_RESPONSE_INFO</b> structure extends the <a href="https://docs.microsoft.com/windows/desktop/Http/http-response">HTTP_RESPONSE</a> structure starting with HTTP version 2.0.
 * 
 * The <b>HTTP_MULTIPLE_KNOWN_HEADERS</b> structure enables server applications to send multiple authentication challenges to the client.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_multiple_known_headers
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_MULTIPLE_KNOWN_HEADERS {
    #StructPack 8

    /**
     * A member of the <a href="https://docs.microsoft.com/windows/desktop/api/http/ne-http-http_header_id">HTTP_HEADER_ID</a> enumeration specifying the response header ID.
     */
    HeaderId : HTTP_HEADER_ID

    /**
     * The flags corresponding to the response header in the <b>HeaderId</b> member. This member is used only when the WWW-Authenticate header is present. This can be zero or the following:
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HTTP_RESPONSE_INFO_FLAGS_PRESERVE_ORDER"></a><a id="http_response_info_flags_preserve_order"></a><dl>
     * <dt><b>HTTP_RESPONSE_INFO_FLAGS_PRESERVE_ORDER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified order of authentication schemes is preserved on the challenge response.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Flags : UInt32

    /**
     * The number of elements in  the array specified in the  <b>KnownHeaders</b> member.
     */
    KnownHeaderCount : UInt16

    /**
     * A pointer to the first element in the array of <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_known_header">HTTP_KNOWN_HEADER</a> structures.
     */
    KnownHeaders : HTTP_KNOWN_HEADER.Ptr

}
