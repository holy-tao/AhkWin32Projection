#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WMT_PAYLOAD_FRAGMENT.ahk" { WMT_PAYLOAD_FRAGMENT }
#Import ".\INSSBuffer.ahk" { INSSBuffer }
#Import ".\WMT_BUFFER_SEGMENT.ahk" { WMT_BUFFER_SEGMENT }

/**
 * The WMT_FILESINK_DATA_UNIT structure is used by IWMWriterFileSink3::OnDataUnitEx to deliver information about a packet.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-wmt_filesink_data_unit
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct WMT_FILESINK_DATA_UNIT {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-wmt_buffer_segment">WMT_BUFFER_SEGMENT</a> structure specifying the buffer segment that contains the packet header.
     */
    packetHeaderBuffer : WMT_BUFFER_SEGMENT

    /**
     * Count of payloads in this packet. This is also the number of elements in the array specified in <b>pPayloadHeaderBuffers</b>.
     */
    cPayloads : UInt32

    /**
     * Pointer to an array of <b>WMT_BUFFER_SEGMENT</b> structures. Each element specifies a buffer segment that contains a payload header. The number of elements is specified by <b>cPayloads</b>.
     */
    pPayloadHeaderBuffers : WMT_BUFFER_SEGMENT.Ptr

    /**
     * Count of payload data fragments in this packet. This is also the number of elements in the array pointed to by <b>pPayloadDataFragments</b>.
     */
    cPayloadDataFragments : UInt32

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-wmt_payload_fragment">WMT_PAYLOAD_FRAGMENT</a> structures. Each element specifies a buffer segment that contains a payload fragment. The number of elements is specified by <b>cPayloadDataFragments</b>.
     */
    pPayloadDataFragments : WMT_PAYLOAD_FRAGMENT.Ptr

}
