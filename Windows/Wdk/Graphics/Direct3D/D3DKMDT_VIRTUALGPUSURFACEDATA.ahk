#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMDT_VIRTUALGPUSURFACEDATA {
    #StructPack 8

    Size : Int64

    Alignment : UInt32

    DriverSegmentId : UInt32

    PrivateDriverData : UInt32

}
