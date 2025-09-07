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
    static sizeof => 192

    static packingSize => 8

    /**
     * @type {Integer}
     */
    rtStart {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    rtEnd {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    SampleFormat {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    SampleFlags {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Pointer<Void>}
     */
    lpDDSSrcSurface {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {RECT}
     */
    rcSrc{
        get {
            if(!this.HasProp("__rcSrc"))
                this.__rcSrc := RECT(this.ptr + 32)
            return this.__rcSrc
        }
    }

    /**
     * @type {RECT}
     */
    rcDst{
        get {
            if(!this.HasProp("__rcDst"))
                this.__rcDst := RECT(this.ptr + 48)
            return this.__rcDst
        }
    }

    /**
     * @type {Array<DXVA_AYUVsample2>}
     */
    Palette{
        get {
            if(!this.HasProp("__PaletteProxyArray"))
                this.__PaletteProxyArray := Win32FixedArray(this.ptr + 64, 8, DXVA_AYUVsample2, "")
            return this.__PaletteProxyArray
        }
    }
}
