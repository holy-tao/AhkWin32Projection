#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DDDI_OPENALLOCATIONINFO2 {
    #StructPack 8

    hAllocation : UInt32

    pPrivateDriverData : IntPtr

    PrivateDriverDataSize : UInt32

    GpuVirtualAddress : Int64

    Reserved : IntPtr[6]

}
