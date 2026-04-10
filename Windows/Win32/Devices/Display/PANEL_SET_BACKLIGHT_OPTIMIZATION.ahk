#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BACKLIGHT_OPTIMIZATION_LEVEL.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 */
class PANEL_SET_BACKLIGHT_OPTIMIZATION extends Win32Struct {
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {BACKLIGHT_OPTIMIZATION_LEVEL}
     */
    Level {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
