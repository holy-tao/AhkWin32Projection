#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DDDIFORMAT.ahk" { D3DDDIFORMAT }
#Import ".\D3DKMDT_PIXEL_VALUE_ACCESS_MODE.ahk" { D3DKMDT_PIXEL_VALUE_ACCESS_MODE }
#Import ".\D3DKMDT_COLOR_BASIS.ahk" { D3DKMDT_COLOR_BASIS }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMDT_GRAPHICS_RENDERING_FORMAT {
    #StructPack 8

    PrimSurfSize : IntPtr

    VisibleRegionSize : IntPtr

    Stride : UInt32

    PixelFormat : D3DDDIFORMAT

    ColorBasis : D3DKMDT_COLOR_BASIS

    PixelValueAccessMode : D3DKMDT_PIXEL_VALUE_ACCESS_MODE

}
