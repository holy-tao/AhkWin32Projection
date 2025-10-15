#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * Contains the name and value for a header in an HTTP request or response whose name does not appear in the enumeration.
 * @see https://docs.microsoft.com/windows/win32/api//http/ns-http-http_unknown_header
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
     * @type {PSTR}
     */
    pName{
        get {
            if(!this.HasProp("__pName"))
                this.__pName := PSTR(this.ptr + 8)
            return this.__pName
        }
    }

    /**
     * A pointer to a string of octets that specifies the values for this header. Use <b>RawValueLength</b> to determine the end of the string, rather than relying on a terminating <b>null</b>.
     * @type {PSTR}
     */
    pRawValue{
        get {
            if(!this.HasProp("__pRawValue"))
                this.__pRawValue := PSTR(this.ptr + 16)
            return this.__pRawValue
        }
    }
}
