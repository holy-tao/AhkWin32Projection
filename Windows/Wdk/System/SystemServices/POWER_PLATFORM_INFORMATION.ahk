#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class POWER_PLATFORM_INFORMATION extends Win32Struct {
    static sizeof => 1

    static packingSize => 1

    /**
     * @type {BOOLEAN}
     */
    AoAc {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }
}
