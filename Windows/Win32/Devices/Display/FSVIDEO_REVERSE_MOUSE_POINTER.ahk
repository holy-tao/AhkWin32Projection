#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\System\Console\COORD.ahk
#Include .\FSCNTL_SCREEN_INFO.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class FSVIDEO_REVERSE_MOUSE_POINTER extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {FSCNTL_SCREEN_INFO}
     */
    Screen{
        get {
            if(!this.HasProp("__Screen"))
                this.__Screen := FSCNTL_SCREEN_INFO(this.ptr + 0)
            return this.__Screen
        }
    }

    /**
     * @type {Integer}
     */
    dwType {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
