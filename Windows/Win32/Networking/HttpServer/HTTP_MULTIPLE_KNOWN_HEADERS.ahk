#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
 * @version v4.0.30319
 */
class HTTP_MULTIPLE_KNOWN_HEADERS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A member of the <a href="https://docs.microsoft.com/windows/desktop/api/http/ne-http-http_header_id">HTTP_HEADER_ID</a> enumeration specifying the response header ID.
     * @type {Integer}
     */
    HeaderId {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

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
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The number of elements in  the array specified in the  <b>KnownHeaders</b> member.
     * @type {Integer}
     */
    KnownHeaderCount {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * A pointer to the first element in the array of <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_known_header">HTTP_KNOWN_HEADER</a> structures.
     * @type {Pointer<HTTP_KNOWN_HEADER>}
     */
    KnownHeaders {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
