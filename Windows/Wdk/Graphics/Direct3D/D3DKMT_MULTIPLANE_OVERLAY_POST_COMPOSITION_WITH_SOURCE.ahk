#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_MULTIPLANE_OVERLAY_POST_COMPOSITION_WITH_SOURCE {
    #StructPack 8

    VidPnSourceId : UInt32

    PostComposition : IntPtr

}
