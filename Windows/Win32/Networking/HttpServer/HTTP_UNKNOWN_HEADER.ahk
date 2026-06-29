#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains the name and value for a header in an HTTP request or response whose name does not appear in the enumeration.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_unknown_header
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_UNKNOWN_HEADER {
    #StructPack 8

    /**
     * The size, in bytes, of the data pointed to by the <b>pName</b> member not counting a terminating null.
     */
    NameLength : UInt16

    /**
     * The size, in bytes, of the data pointed to by the <b>pRawValue</b> member, in bytes.
     */
    RawValueLength : UInt16

    /**
     * A pointer to a string of octets that specifies the header name. Use <b>NameLength</b> to determine the end of the string, rather than relying on a terminating <b>null</b>.
     */
    pName : PSTR

    /**
     * A pointer to a string of octets that specifies the values for this header. Use <b>RawValueLength</b> to determine the end of the string, rather than relying on a terminating <b>null</b>.
     */
    pRawValue : PSTR

}
