#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The HTTP_BYTE_RANGE structure is used to specify a byte range within a cached response fragment, file, or other data block.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_byte_range
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_BYTE_RANGE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Starting offset of the byte range.
     * @type {Integer}
     */
    StartingOffset {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Size, in bytes, of the range. If this member is HTTP_BYTE_RANGE_TO_EOF, the range extends from the starting offset to the end of the file or data block.
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
