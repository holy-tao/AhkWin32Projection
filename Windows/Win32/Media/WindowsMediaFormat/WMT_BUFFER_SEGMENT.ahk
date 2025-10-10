#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WMT_BUFFER_SEGMENT structure contains the information needed to specify a segment in a buffer. It is used as a member of the WMT_FILESINK_DATA_UNIT and WMT_PAYLOAD_FRAGMENT structures to specify segments of a packet.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/ns-wmsdkidl-wmt_buffer_segment
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WMT_BUFFER_SEGMENT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Pointer to a buffer object containing the buffer segment.
     * @type {Pointer<INSSBuffer>}
     */
    pBuffer {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The offset, in bytes, from the start of the buffer to the buffer segment.
     * @type {Integer}
     */
    cbOffset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The length, in bytes, of the buffer segment.
     * @type {Integer}
     */
    cbLength {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
