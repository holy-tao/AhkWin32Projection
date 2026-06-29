#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_QUERYSTATISTICS_NODE_INFORMATION {
    #StructPack 8

    GlobalInformation : IntPtr

    SystemInformation : IntPtr

    NodePerfData : IntPtr

    Reserved : UInt32[3]

}
