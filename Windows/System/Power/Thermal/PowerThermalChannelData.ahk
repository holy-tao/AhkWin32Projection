#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a single data sample from a power/thermal channel, including channel identifier, and measured value.
 * @remarks
 * This structure is used to send channel samples from producers and to receive samples in consumers or diagnostics.
 * @see https://learn.microsoft.com/uwp/api/windows.system.power.thermal.powerthermalchanneldata
 * @namespace Windows.System.Power.Thermal
 * @version WindowsRuntime 1.4
 */
class PowerThermalChannelData extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Unique identifier for the channel that produced this data sample.
     * @type {Pointer<PowerThermalChannelId>}
     */
    Id {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Numeric measurement value reported by the channel.
     * @type {Integer}
     */
    Value {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
