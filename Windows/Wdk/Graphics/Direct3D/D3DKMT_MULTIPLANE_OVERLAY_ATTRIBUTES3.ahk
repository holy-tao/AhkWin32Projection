#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DDDI_ROTATION.ahk" { D3DDDI_ROTATION }
#Import ".\D3DKMT_MULTIPLANE_OVERLAY_BLEND.ahk" { D3DKMT_MULTIPLANE_OVERLAY_BLEND }
#Import "..\..\..\Win32\Foundation\RECT.ahk" { RECT }
#Import ".\DXGKMT_MULTIPLANE_OVERLAY_STRETCH_QUALITY.ahk" { DXGKMT_MULTIPLANE_OVERLAY_STRETCH_QUALITY }
#Import ".\D3DDDI_COLOR_SPACE_TYPE.ahk" { D3DDDI_COLOR_SPACE_TYPE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_MULTIPLANE_OVERLAY_ATTRIBUTES3 {
    #StructPack 8

    Flags : UInt32

    SrcRect : IntPtr

    DstRect : IntPtr

    ClipRect : IntPtr

    Rotation : D3DDDI_ROTATION

    Blend : D3DKMT_MULTIPLANE_OVERLAY_BLEND

    DirtyRectCount : UInt32

    pDirtyRects : RECT.Ptr

    ColorSpace : D3DDDI_COLOR_SPACE_TYPE

    StretchQuality : DXGKMT_MULTIPLANE_OVERLAY_STRETCH_QUALITY

    SDRWhiteLevel : UInt32

}
