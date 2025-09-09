#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BTH_LE_UUID.ahk
#Include .\BTH_LE_GATT_CHARACTERISTIC.ahk

/**
 * The BLUETOOTH_GATT_VALUE_CHANGED_EVENT_REGISTRATION structure describes one or more characteristics that have changed.
 * @see https://learn.microsoft.com/windows/win32/api/bthledef/ns-bthledef-bluetooth_gatt_value_changed_event_registration
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class BLUETOOTH_GATT_VALUE_CHANGED_EVENT_REGISTRATION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of characteristics that follow this member in memory.
     * @type {Integer}
     */
    NumCharacteristics {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Array of characteristics to monitor for incoming events.
     * @type {Array<BTH_LE_GATT_CHARACTERISTIC>}
     */
    Characteristics{
        get {
            if(!this.HasProp("__CharacteristicsProxyArray"))
                this.__CharacteristicsProxyArray := Win32FixedArray(this.ptr + 8, 1, BTH_LE_GATT_CHARACTERISTIC, "")
            return this.__CharacteristicsProxyArray
        }
    }
}
