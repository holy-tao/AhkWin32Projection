#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\System\Power\SYSTEM_POWER_STATE.ahk
#Include ..\..\..\Win32\System\Power\DEVICE_POWER_STATE.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class POWER_STATE extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {SYSTEM_POWER_STATE}
     */
    SystemState {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {DEVICE_POWER_STATE}
     */
    DeviceState {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
