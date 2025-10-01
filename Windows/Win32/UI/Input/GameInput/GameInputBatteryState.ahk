#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 * @version v4.0.30319
 */
class GameInputBatteryState extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {Float}
     */
    chargeRate {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * @type {Float}
     */
    maxChargeRate {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * @type {Float}
     */
    remainingCapacity {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * @type {Float}
     */
    fullChargeCapacity {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    status {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
