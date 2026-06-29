#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_QUERYSTATISTICS_QUEUE_PACKET_TYPE_INFORMATION {
    #StructPack 4

    PacketSubmited : UInt32

    PacketCompleted : UInt32

}
