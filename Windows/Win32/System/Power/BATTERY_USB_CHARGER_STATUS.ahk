#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\USB_CHARGER_PORT.ahk
#Include .\BATTERY_CHARGING_SOURCE_TYPE.ahk

/**
 * @namespace Windows.Win32.System.Power
 */
class BATTERY_USB_CHARGER_STATUS extends Win32Struct {
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {BATTERY_CHARGING_SOURCE_TYPE}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    MaxCurrent {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    Voltage {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {USB_CHARGER_PORT}
     */
    PortType {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    PortId {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Pointer<Void>}
     */
    PowerSourceInformation {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Guid}
     */
    OemCharger {
        get {
            if(!this.HasProp("__OemCharger"))
                this.__OemCharger := Guid(40, this)
            return this.__OemCharger
        }
    }
}
