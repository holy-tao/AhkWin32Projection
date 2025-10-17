#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk
#Include .\DXVA_AYUVsample2.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVA_VideoSample2 extends Win32Struct
{
    static sizeof => 200

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    rtStart {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    rtEnd {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    SampleFormat {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    SampleFlags {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Pointer<Void>}
     */
    lpDDSSrcSurface {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {RECT}
     */
    rcSrc{
        get {
            if(!this.HasProp("__rcSrc"))
                this.__rcSrc := RECT(40, this)
            return this.__rcSrc
        }
    }

    /**
     * @type {RECT}
     */
    rcDst{
        get {
            if(!this.HasProp("__rcDst"))
                this.__rcDst := RECT(56, this)
            return this.__rcDst
        }
    }

    /**
     * @type {Array<DXVA_AYUVsample2>}
     */
    Palette{
        get {
            if(!this.HasProp("__PaletteProxyArray"))
                this.__PaletteProxyArray := Win32FixedArray(this.ptr + 72, 16, DXVA_AYUVsample2, "")
            return this.__PaletteProxyArray
        }
    }
}
