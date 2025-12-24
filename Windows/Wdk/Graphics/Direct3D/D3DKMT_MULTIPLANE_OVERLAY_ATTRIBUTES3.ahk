#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\RECT.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_MULTIPLANE_OVERLAY_ATTRIBUTES3 extends Win32Struct
{
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
     * @type {RECT}
     */
    SrcRect{
        get {
            if(!this.HasProp("__SrcRect"))
                this.__SrcRect := RECT(4, this)
            return this.__SrcRect
        }
    }

    /**
     * @type {RECT}
     */
    DstRect{
        get {
            if(!this.HasProp("__DstRect"))
                this.__DstRect := RECT(20, this)
            return this.__DstRect
        }
    }

    /**
     * @type {RECT}
     */
    ClipRect{
        get {
            if(!this.HasProp("__ClipRect"))
                this.__ClipRect := RECT(36, this)
            return this.__ClipRect
        }
    }

    /**
     * @type {Integer}
     */
    Rotation {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    Blend {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    DirtyRectCount {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * @type {Pointer<RECT>}
     */
    pDirtyRects {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    ColorSpace {
        get => NumGet(this, 72, "int")
        set => NumPut("int", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    StretchQuality {
        get => NumGet(this, 76, "int")
        set => NumPut("int", value, this, 76)
    }

    /**
     * @type {Integer}
     */
    SDRWhiteLevel {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }
}
