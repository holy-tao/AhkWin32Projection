#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_GDIMODEL_PRESENTHISTORYTOKEN {
    #StructPack 8

    hLogicalSurface : Int64

    hPhysicalSurface : Int64

    ScrollRect : IntPtr

    ScrollOffset : IntPtr

    DirtyRegions : IntPtr

}
