#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_QUERYSTATISTICS_PROCESS_SEGMENT_GROUP_INFORMATION {
    #StructPack 8

    Budget : Int64

    Requested : Int64

    Usage : Int64

    Demoted : Int64[5]

}
