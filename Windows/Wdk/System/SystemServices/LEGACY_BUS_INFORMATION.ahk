#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\INTERFACE_TYPE.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class LEGACY_BUS_INFORMATION extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    BusTypeGuid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {INTERFACE_TYPE}
     */
    LegacyBusType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    BusNumber {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
