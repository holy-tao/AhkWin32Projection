#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\VIDEO_HARDWARE_STATE_HEADER.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 */
class VIDEO_HARDWARE_STATE extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Pointer<VIDEO_HARDWARE_STATE_HEADER>}
     */
    StateHeader {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    StateLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
