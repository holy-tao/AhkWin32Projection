#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_QUERYSTATISTICS_DMA_PACKET_TYPE_INFORMATION {
    #StructPack 4

    PacketSubmited : UInt32

    PacketCompleted : UInt32

    PacketPreempted : UInt32

    PacketFaulted : UInt32

}
