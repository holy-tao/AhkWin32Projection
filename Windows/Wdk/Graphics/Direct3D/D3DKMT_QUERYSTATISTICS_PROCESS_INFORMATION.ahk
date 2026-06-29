#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_QUERYSTATISTICS_PROCESS_INFORMATION {
    #StructPack 8

    NodeCount : UInt32

    VidPnSourceCount : UInt32

    SystemMemory : IntPtr

    Reserved : Int64[7]

}
