#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3DDDI_ROTATION.ahk
#Include .\D3DKMT_MULTIPLANE_OVERLAY_BLEND.ahk
#Include ..\..\..\Win32\Foundation\RECT.ahk
#Include .\D3DDDI_COLOR_SPACE_TYPE.ahk
#Include .\DXGKMT_MULTIPLANE_OVERLAY_STRETCH_QUALITY.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_MULTIPLANE_OVERLAY_ATTRIBUTES3 extends Win32Struct {
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer}
     */
    SrcRect {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer}
     */
    DstRect {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer}
     */
    ClipRect {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {D3DDDI_ROTATION}
     */
    Rotation {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * @type {D3DKMT_MULTIPLANE_OVERLAY_BLEND}
     */
    Blend {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    DirtyRectCount {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Pointer<RECT>}
     */
    pDirtyRects {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {D3DDDI_COLOR_SPACE_TYPE}
     */
    ColorSpace {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * @type {DXGKMT_MULTIPLANE_OVERLAY_STRETCH_QUALITY}
     */
    StretchQuality {
        get => NumGet(this, 60, "int")
        set => NumPut("int", value, this, 60)
    }

    /**
     * @type {Integer}
     */
    SDRWhiteLevel {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }
}
