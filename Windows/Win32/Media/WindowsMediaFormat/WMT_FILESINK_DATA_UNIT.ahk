#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WMT_BUFFER_SEGMENT.ahk

/**
 * The WMT_FILESINK_DATA_UNIT structure is used by IWMWriterFileSink3::OnDataUnitEx to deliver information about a packet.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/ns-wmsdkidl-wmt_filesink_data_unit
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WMT_FILESINK_DATA_UNIT extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-wmt_buffer_segment">WMT_BUFFER_SEGMENT</a> structure specifying the buffer segment that contains the packet header.
     * @type {WMT_BUFFER_SEGMENT}
     */
    packetHeaderBuffer{
        get {
            if(!this.HasProp("__packetHeaderBuffer"))
                this.__packetHeaderBuffer := WMT_BUFFER_SEGMENT(this.ptr + 0)
            return this.__packetHeaderBuffer
        }
    }

    /**
     * Count of payloads in this packet. This is also the number of elements in the array specified in <b>pPayloadHeaderBuffers</b>.
     * @type {Integer}
     */
    cPayloads {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Pointer to an array of <b>WMT_BUFFER_SEGMENT</b> structures. Each element specifies a buffer segment that contains a payload header. The number of elements is specified by <b>cPayloads</b>.
     * @type {Pointer<WMT_BUFFER_SEGMENT>}
     */
    pPayloadHeaderBuffers {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Count of payload data fragments in this packet. This is also the number of elements in the array pointed to by <b>pPayloadDataFragments</b>.
     * @type {Integer}
     */
    cPayloadDataFragments {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-wmt_payload_fragment">WMT_PAYLOAD_FRAGMENT</a> structures. Each element specifies a buffer segment that contains a payload fragment. The number of elements is specified by <b>cPayloadDataFragments</b>.
     * @type {Pointer<WMT_PAYLOAD_FRAGMENT>}
     */
    pPayloadDataFragments {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
