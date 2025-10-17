#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\System\Console\COORD.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class FSCNTL_SCREEN_INFO extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {COORD}
     */
    Position{
        get {
            if(!this.HasProp("__Position"))
                this.__Position := COORD(0, this)
            return this.__Position
        }
    }

    /**
     * @type {COORD}
     */
    ScreenSize{
        get {
            if(!this.HasProp("__ScreenSize"))
                this.__ScreenSize := COORD(4, this)
            return this.__ScreenSize
        }
    }

    /**
     * @type {Integer}
     */
    nNumberOfChars {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
