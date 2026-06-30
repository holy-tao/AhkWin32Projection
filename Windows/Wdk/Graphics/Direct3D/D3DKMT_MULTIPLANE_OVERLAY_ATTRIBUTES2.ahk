#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3DKMT_MULTIPLANE_OVERLAY_VIDEO_FRAME_FORMAT.ahk
#Include .\DXGKMT_MULTIPLANE_OVERLAY_STEREO_FLIP_MODE.ahk
#Include .\D3DDDI_COLOR_SPACE_TYPE.ahk
#Include .\D3DKMT_MULTIPLANE_OVERLAY_STEREO_FORMAT.ahk
#Include .\DXGKMT_MULTIPLANE_OVERLAY_STRETCH_QUALITY.ahk
#Include .\D3DKMT_MULTIPLANE_OVERLAY_BLEND.ahk
#Include ..\..\..\Win32\Foundation\RECT.ahk
#Include .\D3DDDI_ROTATION.ahk
#Include ..\..\..\Win32\Foundation\BOOL.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_MULTIPLANE_OVERLAY_ATTRIBUTES2 extends Win32Struct {
    static sizeof => 88

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
     * @type {D3DKMT_MULTIPLANE_OVERLAY_VIDEO_FRAME_FORMAT}
     */
    VideoFrameFormat {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * @type {D3DDDI_COLOR_SPACE_TYPE}
     */
    ColorSpace {
        get => NumGet(this, 60, "int")
        set => NumPut("int", value, this, 60)
    }

    /**
     * @type {D3DKMT_MULTIPLANE_OVERLAY_STEREO_FORMAT}
     */
    StereoFormat {
        get => NumGet(this, 64, "int")
        set => NumPut("int", value, this, 64)
    }

    /**
     * @type {BOOL}
     */
    StereoLeftViewFrame0 {
        get => NumGet(this, 68, "int")
        set => NumPut("int", value, this, 68)
    }

    /**
     * @type {BOOL}
     */
    StereoBaseViewFrame0 {
        get => NumGet(this, 72, "int")
        set => NumPut("int", value, this, 72)
    }

    /**
     * @type {DXGKMT_MULTIPLANE_OVERLAY_STEREO_FLIP_MODE}
     */
    StereoFlipMode {
        get => NumGet(this, 76, "int")
        set => NumPut("int", value, this, 76)
    }

    /**
     * @type {DXGKMT_MULTIPLANE_OVERLAY_STRETCH_QUALITY}
     */
    StretchQuality {
        get => NumGet(this, 80, "int")
        set => NumPut("int", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }
}
