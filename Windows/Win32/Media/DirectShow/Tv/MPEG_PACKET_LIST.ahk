#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\MPEG_RQST_PACKET.ahk

/**
 * The MPEG_PACKET_LIST structure contains a list of MPEG-2 sections.
 * @see https://learn.microsoft.com/windows/win32/api/mpeg2structs/ns-mpeg2structs-mpeg_packet_list
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class MPEG_PACKET_LIST extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

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
     * @type {Array<Pointer<MPEG_RQST_PACKET>>}
     */
    PacketList {
        get {
            if(!this.HasProp("__PacketListProxyArray"))
                this.__PacketListProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "ptr")
            return this.__PacketListProxyArray
        }
    }
}
