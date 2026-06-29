#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMT_MULTIPLANE_OVERLAY_ATTRIBUTES3.ahk" { D3DKMT_MULTIPLANE_OVERLAY_ATTRIBUTES3 }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_CHECK_MULTIPLANE_OVERLAY_PLANE3 {
    #StructPack 8

    LayerIndex : UInt32

    hResource : UInt32

    CompSurfaceLuid : IntPtr

    VidPnSourceId : UInt32

    pPlaneAttributes : D3DKMT_MULTIPLANE_OVERLAY_ATTRIBUTES3.Ptr

}
