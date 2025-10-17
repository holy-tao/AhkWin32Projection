#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\VIDEO_CLUTDATA.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class VIDEO_CLUT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    NumEntries {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    FirstEntry {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {VIDEO_CLUTDATA}
     */
    RgbArray{
        get {
            if(!this.HasProp("__RgbArray"))
                this.__RgbArray := VIDEO_CLUTDATA(8, this)
            return this.__RgbArray
        }
    }

    /**
     * @type {Integer}
     */
    RgbLong {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
