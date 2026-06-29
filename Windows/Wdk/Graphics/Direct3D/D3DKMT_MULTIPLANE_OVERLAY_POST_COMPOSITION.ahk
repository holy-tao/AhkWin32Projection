#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DDDI_ROTATION.ahk" { D3DDDI_ROTATION }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_MULTIPLANE_OVERLAY_POST_COMPOSITION {
    #StructPack 8

    Flags : IntPtr

    SrcRect : IntPtr

    DstRect : IntPtr

    Rotation : D3DDDI_ROTATION

}
