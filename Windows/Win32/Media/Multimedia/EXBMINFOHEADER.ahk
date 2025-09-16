#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Graphics\Gdi\BITMAPINFOHEADER.ahk

/**
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class EXBMINFOHEADER extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {BITMAPINFOHEADER}
     */
    bmi{
        get {
            if(!this.HasProp("__bmi"))
                this.__bmi := BITMAPINFOHEADER(this.ptr + 0)
            return this.__bmi
        }
    }

    /**
     * @type {Integer}
     */
    biExtDataOffset {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
