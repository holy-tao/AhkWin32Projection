#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Bluetooth
 */
class RFCOMM_RLS_DATA extends Win32Struct {
    static sizeof => 1

    static packingSize => 1

    /**
     * @type {Integer}
     */
    LineStatus {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }
}
