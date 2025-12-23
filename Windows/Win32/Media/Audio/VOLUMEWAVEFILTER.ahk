#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WAVEFILTER.ahk

/**
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class VOLUMEWAVEFILTER extends Win32Struct
{
    static sizeof => 36

    static packingSize => 4

    /**
     * @type {WAVEFILTER}
     */
    wfltr{
        get {
            if(!this.HasProp("__wfltr"))
                this.__wfltr := WAVEFILTER(0, this)
            return this.__wfltr
        }
    }

    /**
     * @type {Integer}
     */
    dwVolume {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
