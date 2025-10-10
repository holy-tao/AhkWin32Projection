#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The JOYINFO structure contains information about the joystick position and button state.
 * @see https://docs.microsoft.com/windows/win32/api//joystickapi/ns-joystickapi-joyinfo
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class JOYINFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Current X-coordinate.
     * @type {Integer}
     */
    wXpos {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Current Y-coordinate.
     * @type {Integer}
     */
    wYpos {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Current Z-coordinate.
     * @type {Integer}
     */
    wZpos {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * 
     * @type {Integer}
     */
    wButtons {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
