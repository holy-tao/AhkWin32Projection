#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3DDDIFORMAT.ahk
#Include .\D3DKMDT_COLOR_BASIS.ahk
#Include .\D3DKMDT_PIXEL_VALUE_ACCESS_MODE.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMDT_GRAPHICS_RENDERING_FORMAT extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    PrimSurfSize {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer}
     */
    VisibleRegionSize {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Stride {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {D3DDDIFORMAT}
     */
    PixelFormat {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {D3DKMDT_COLOR_BASIS}
     */
    ColorBasis {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {D3DKMDT_PIXEL_VALUE_ACCESS_MODE}
     */
    PixelValueAccessMode {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }
}
