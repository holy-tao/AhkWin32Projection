#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The MPEG_PACKET_LIST structure contains a list of MPEG-2 sections.
 * @see https://learn.microsoft.com/windows/win32/api/mpeg2structs/ns-mpeg2structs-mpeg_packet_list
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class MPEG_PACKET_LIST extends Win32Struct
{
    static sizeof => 10

    static packingSize => 1

    /**
     * Specifies the size of the <b>PacketList</b> array.
     * @type {Integer}
     */
    wPacketCount {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Specifies a pointer to an array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ns-mpeg2structs-mpeg_rqst_packet">MPEG_RQST_PACKET</a> structures, which themselves contain pointers to buffers that hold the sectioned data.
     * @type {Array<MPEG_RQST_PACKET>}
     */
    PacketList{
        get {
            if(!this.HasProp("__PacketListProxyArray"))
                this.__PacketListProxyArray := Win32FixedArray(this.ptr + 2, 8, Primitive, "ptr")
            return this.__PacketListProxyArray
        }
    }
}
