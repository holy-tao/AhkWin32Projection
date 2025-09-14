#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the name and value for a header in an HTTP request or response whose name does not appear in the enumeration.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_unknown_header
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_UNKNOWN_HEADER extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The size, in bytes, of the data pointed to by the <b>pName</b> member not counting a terminating null.
     * @type {Integer}
     */
    NameLength {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * The size, in bytes, of the data pointed to by the <b>pRawValue</b> member, in bytes.
     * @type {Integer}
     */
    RawValueLength {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * A pointer to a string of octets that specifies the header name. Use <b>NameLength</b> to determine the end of the string, rather than relying on a terminating <b>null</b>.
     * @type {Pointer<PSTR>}
     */
    pName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to a string of octets that specifies the values for this header. Use <b>RawValueLength</b> to determine the end of the string, rather than relying on a terminating <b>null</b>.
     * @type {Pointer<PSTR>}
     */
    pRawValue {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
