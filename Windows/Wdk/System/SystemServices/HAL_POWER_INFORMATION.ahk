#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class HAL_POWER_INFORMATION extends Win32Struct {
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {Integer}
     */
    TBD {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
