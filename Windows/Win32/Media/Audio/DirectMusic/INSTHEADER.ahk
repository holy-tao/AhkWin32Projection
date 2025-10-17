#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\MIDILOCALE.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 * @version v4.0.30319
 */
class INSTHEADER extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cRegions {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {MIDILOCALE}
     */
    Locale{
        get {
            if(!this.HasProp("__Locale"))
                this.__Locale := MIDILOCALE(8, this)
            return this.__Locale
        }
    }
}
