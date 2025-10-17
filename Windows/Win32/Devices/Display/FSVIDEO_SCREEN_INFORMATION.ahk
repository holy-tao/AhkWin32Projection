#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\System\Console\COORD.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class FSVIDEO_SCREEN_INFORMATION extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {COORD}
     */
    ScreenSize{
        get {
            if(!this.HasProp("__ScreenSize"))
                this.__ScreenSize := COORD(0, this)
            return this.__ScreenSize
        }
    }

    /**
     * @type {COORD}
     */
    FontSize{
        get {
            if(!this.HasProp("__FontSize"))
                this.__FontSize := COORD(4, this)
            return this.__FontSize
        }
    }
}
