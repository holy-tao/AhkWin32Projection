#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MPEG_RQST_PACKET.ahk" { MPEG_RQST_PACKET }

/**
 * The MPEG_PACKET_LIST structure contains a list of MPEG-2 sections.
 * @see https://learn.microsoft.com/windows/win32/api/mpeg2structs/ns-mpeg2structs-mpeg_packet_list
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct MPEG_PACKET_LIST {
    #StructPack 8

    /**
     * Specifies the size of the <b>PacketList</b> array.
     */
    wPacketCount : UInt16

    /**
     * Specifies a pointer to an array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ns-mpeg2structs-mpeg_rqst_packet">MPEG_RQST_PACKET</a> structures, which themselves contain pointers to buffers that hold the sectioned data.
     */
    PacketList : MPEG_RQST_PACKET.Ptr[1]

}
