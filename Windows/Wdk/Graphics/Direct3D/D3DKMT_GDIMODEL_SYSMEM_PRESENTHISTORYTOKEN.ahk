#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_GDIMODEL_SYSMEM_PRESENTHISTORYTOKEN {
    #StructPack 8

    hlsurf : Int64

    dwDirtyFlags : UInt32

    uiCookie : Int64

}
