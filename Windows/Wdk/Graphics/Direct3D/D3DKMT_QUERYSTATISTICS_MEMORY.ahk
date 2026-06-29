#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_QUERYSTATISTICS_MEMORY {
    #StructPack 8

    TotalBytesEvicted : Int64

    AllocsCommitted : UInt32

    AllocsResident : UInt32

}
