#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk
#Include .\KS_BITMAPINFOHEADER.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KS_VIDEOINFOHEADER2 extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * @type {RECT}
     */
    rcSource{
        get {
            if(!this.HasProp("__rcSource"))
                this.__rcSource := RECT(0, this)
            return this.__rcSource
        }
    }

    /**
     * @type {RECT}
     */
    rcTarget{
        get {
            if(!this.HasProp("__rcTarget"))
                this.__rcTarget := RECT(16, this)
            return this.__rcTarget
        }
    }

    /**
     * @type {Integer}
     */
    dwBitRate {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    dwBitErrorRate {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    AvgTimePerFrame {
        get => NumGet(this, 40, "int64")
        set => NumPut("int64", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    dwInterlaceFlags {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    dwCopyProtectFlags {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    dwPictAspectRatioX {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    dwPictAspectRatioY {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * @type {Integer}
     */
    dwControlFlags {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    dwReserved1 {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    dwReserved2 {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * @type {KS_BITMAPINFOHEADER}
     */
    bmiHeader{
        get {
            if(!this.HasProp("__bmiHeader"))
                this.__bmiHeader := KS_BITMAPINFOHEADER(72, this)
            return this.__bmiHeader
        }
    }
}
