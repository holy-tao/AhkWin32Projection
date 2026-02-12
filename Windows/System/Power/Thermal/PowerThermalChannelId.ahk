#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a unique identifier for a power/thermal channel, composed of an instance identifier and an interface type.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.power.thermal.powerthermalchannelid
 * @namespace Windows.System.Power.Thermal
 * @version WindowsRuntime 1.4
 */
class PowerThermalChannelId extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The interface type Guid that classifies the channel's interface.
     * @type {Pointer<Guid>}
     */
    InterfaceType {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A value that uniquely identifies the channel instance.
     * @type {Integer}
     */
    InstanceId {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }
}
