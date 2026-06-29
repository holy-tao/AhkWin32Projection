#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Graphics\Direct3D9\D3DCOMPOSERECTSOP.ahk" { D3DCOMPOSERECTSOP }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DHAL_DP2COMPOSERECTS {
    #StructPack 4

    SrcSurfaceHandle : UInt32

    DstSurfaceHandle : UInt32

    SrcRectDescsVBHandle : UInt32

    NumRects : UInt32

    DstRectDescsVBHandle : UInt32

    Operation : D3DCOMPOSERECTSOP

    XOffset : Int32

    YOffset : Int32

}
