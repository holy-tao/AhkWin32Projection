#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\RECT.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_MULTIPLANE_OVERLAY_ATTRIBUTES2 extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {RECT}
     */
    SrcRect{
        get {
            if(!this.HasProp("__SrcRect"))
                this.__SrcRect := RECT(8, this)
            return this.__SrcRect
        }
    }

    /**
     * @type {RECT}
     */
    DstRect{
        get {
            if(!this.HasProp("__DstRect"))
                this.__DstRect := RECT(24, this)
            return this.__DstRect
        }
    }

    /**
     * @type {RECT}
     */
    ClipRect{
        get {
            if(!this.HasProp("__ClipRect"))
                this.__ClipRect := RECT(40, this)
            return this.__ClipRect
        }
    }

    /**
     * @type {Integer}
     */
    Rotation {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    Blend {
        get => NumGet(this, 60, "int")
        set => NumPut("int", value, this, 60)
    }

    /**
     * @type {Integer}
     */
    DirtyRectCount {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Pointer<RECT>}
     */
    pDirtyRects {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    VideoFrameFormat {
        get => NumGet(this, 80, "int")
        set => NumPut("int", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    ColorSpace {
        get => NumGet(this, 84, "int")
        set => NumPut("int", value, this, 84)
    }

    /**
     * @type {Integer}
     */
    StereoFormat {
        get => NumGet(this, 88, "int")
        set => NumPut("int", value, this, 88)
    }

    /**
     * @type {BOOL}
     */
    StereoLeftViewFrame0 {
        get => NumGet(this, 92, "int")
        set => NumPut("int", value, this, 92)
    }

    /**
     * @type {BOOL}
     */
    StereoBaseViewFrame0 {
        get => NumGet(this, 96, "int")
        set => NumPut("int", value, this, 96)
    }

    /**
     * @type {Integer}
     */
    StereoFlipMode {
        get => NumGet(this, 100, "int")
        set => NumPut("int", value, this, 100)
    }

    /**
     * @type {Integer}
     */
    StretchQuality {
        get => NumGet(this, 104, "int")
        set => NumPut("int", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }
}
