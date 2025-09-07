#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk
#Include .\KS_BITMAPINFOHEADER.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KS_VIDEOINFOHEADER extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * @type {RECT}
     */
    rcSource{
        get {
            if(!this.HasProp("__rcSource"))
                this.__rcSource := RECT(this.ptr + 0)
            return this.__rcSource
        }
    }

    /**
     * @type {RECT}
     */
    rcTarget{
        get {
            if(!this.HasProp("__rcTarget"))
                this.__rcTarget := RECT(this.ptr + 16)
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
     * @type {KS_BITMAPINFOHEADER}
     */
    bmiHeader{
        get {
            if(!this.HasProp("__bmiHeader"))
                this.__bmiHeader := KS_BITMAPINFOHEADER(this.ptr + 48)
            return this.__bmiHeader
        }
    }
}
