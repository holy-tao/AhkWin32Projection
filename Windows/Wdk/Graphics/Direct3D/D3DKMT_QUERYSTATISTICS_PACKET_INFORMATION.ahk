#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_QUERYSTATISTICS_PACKET_INFORMATION {
    #StructPack 8

    QueuePacket : IntPtr[8]

    DmaPacket : IntPtr[4]

}
