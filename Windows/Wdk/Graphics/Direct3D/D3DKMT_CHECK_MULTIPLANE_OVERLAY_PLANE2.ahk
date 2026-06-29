#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_CHECK_MULTIPLANE_OVERLAY_PLANE2 {
    #StructPack 8

    LayerIndex : UInt32

    hResource : UInt32

    CompSurfaceLuid : IntPtr

    VidPnSourceId : UInt32

    PlaneAttributes : IntPtr

}
