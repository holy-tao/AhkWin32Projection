#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\INTERFACE_TYPE.ahk
#Include .\BUS_DATA_TYPE.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class HAL_BUS_INFORMATION extends Win32Struct {
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {INTERFACE_TYPE}
     */
    BusType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {BUS_DATA_TYPE}
     */
    ConfigurationType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    BusNumber {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
