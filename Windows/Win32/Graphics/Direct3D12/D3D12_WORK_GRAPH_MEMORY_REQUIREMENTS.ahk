#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_WORK_GRAPH_MEMORY_REQUIREMENTS {
    #StructPack 8

    MinSizeInBytes : Int64

    MaxSizeInBytes : Int64

    SizeGranularityInBytes : UInt32

}
