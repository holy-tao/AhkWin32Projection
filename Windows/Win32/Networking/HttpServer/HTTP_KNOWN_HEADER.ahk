#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the header values for a known header from an HTTP request or HTTP response.
 * @remarks
 * In the HTTP Server API, known headers are defined as those that are enumerated in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/http/ne-http-http_header_id">HTTP_HEADER_ID</a> enumeration type. Be aware that there are different lists of different sizes for request and response headers.
 * 
 * For more information about the structure and usage of HTTP headers, see the 
 * <a href="https://www.ietf.org/rfc/rfc2616.txt">RFC 2616</a>.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_known_header
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_KNOWN_HEADER extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Size, in bytes,  of the 8-bit string pointed to by the <b>pRawValue</b> member, not counting a terminating null character, if present. If <b>RawValueLength</b> is zero, then the value of the <b>pRawValue</b> element is meaningless.
     * @type {Integer}
     */
    RawValueLength {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Pointer to the text of this HTTP header. Use <b>RawValueLength</b> to determine where this text ends rather than relying on the string to have a terminating null. The format of the header text is specified in 
     * <a href="https://www.ietf.org/rfc/rfc2616.txt">RFC 2616</a>.
     * @type {PSTR}
     */
    pRawValue {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
