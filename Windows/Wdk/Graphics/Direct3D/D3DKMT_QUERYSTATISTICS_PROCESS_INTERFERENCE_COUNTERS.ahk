#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_QUERYSTATISTICS_PROCESS_INTERFERENCE_COUNTERS {
    #StructPack 8

    InterferenceCount : Int64[9]

}
