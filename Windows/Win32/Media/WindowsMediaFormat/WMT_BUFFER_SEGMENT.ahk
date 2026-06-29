#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\INSSBuffer.ahk" { INSSBuffer }

/**
 * The WMT_BUFFER_SEGMENT structure contains the information needed to specify a segment in a buffer. It is used as a member of the WMT_FILESINK_DATA_UNIT and WMT_PAYLOAD_FRAGMENT structures to specify segments of a packet.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-wmt_buffer_segment
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct WMT_BUFFER_SEGMENT {
    #StructPack 8

    /**
     * Pointer to a buffer object containing the buffer segment.
     */
    pBuffer : INSSBuffer

    /**
     * The offset, in bytes, from the start of the buffer to the buffer segment.
     */
    cbOffset : UInt32

    /**
     * The length, in bytes, of the buffer segment.
     */
    cbLength : UInt32

}
