#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\VIDEO_CURSOR_POSITION.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class FSVIDEO_CURSOR_POSITION extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {VIDEO_CURSOR_POSITION}
     */
    Coord{
        get {
            if(!this.HasProp("__Coord"))
                this.__Coord := VIDEO_CURSOR_POSITION(0, this)
            return this.__Coord
        }
    }

    /**
     * @type {Integer}
     */
    dwType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
