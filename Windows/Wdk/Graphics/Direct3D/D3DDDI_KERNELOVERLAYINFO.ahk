#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DDDI_KERNELOVERLAYINFO {
    #StructPack 8

    hAllocation : UInt32

    DstRect : IntPtr

    SrcRect : IntPtr

    pPrivateDriverData : IntPtr

    PrivateDriverDataSize : UInt32

}
