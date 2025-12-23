#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies a range of bytes.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ns-mfidl-mf_byte_stream_cache_range
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_BYTE_STREAM_CACHE_RANGE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The offset, in bytes, of the start of the range.
     * @type {Integer}
     */
    qwStartOffset {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The offset, in bytes, of the end of the range.
     * @type {Integer}
     */
    qwEndOffset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
