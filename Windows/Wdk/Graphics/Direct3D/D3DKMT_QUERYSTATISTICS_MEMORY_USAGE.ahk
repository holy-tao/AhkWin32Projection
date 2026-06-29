#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_QUERYSTATISTICS_MEMORY_USAGE {
    #StructPack 8

    AllocatedBytes : Int64

    FreeBytes : Int64

    ZeroBytes : Int64

    ModifiedBytes : Int64

    StandbyBytes : Int64

}
