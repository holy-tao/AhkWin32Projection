#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_QUERYSTATISTICS_COMMITMENT_DATA {
    #StructPack 8

    TotalBytesEvictedFromProcess : Int64

    BytesBySegmentPreference : Int64[5]

}
