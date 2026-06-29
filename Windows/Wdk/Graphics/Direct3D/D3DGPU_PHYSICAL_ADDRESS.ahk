#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DGPU_PHYSICAL_ADDRESS {
    #StructPack 8

    SegmentId : UInt32

    Padding : UInt32

    SegmentOffset : Int64

}
