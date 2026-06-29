#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BTH_LE_GATT_CHARACTERISTIC.ahk" { BTH_LE_GATT_CHARACTERISTIC }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\BTH_LE_UUID.ahk" { BTH_LE_UUID }

/**
 * The BLUETOOTH_GATT_VALUE_CHANGED_EVENT_REGISTRATION structure describes one or more characteristics that have changed.
 * @see https://learn.microsoft.com/windows/win32/api/bthledef/ns-bthledef-bluetooth_gatt_value_changed_event_registration
 * @namespace Windows.Win32.Devices.Bluetooth
 */
export default struct BLUETOOTH_GATT_VALUE_CHANGED_EVENT_REGISTRATION {
    #StructPack 4

    /**
     * The number of characteristics that follow this member in memory.
     */
    NumCharacteristics : UInt16

    /**
     * Array of characteristics to monitor for incoming events.
     */
    Characteristics : BTH_LE_GATT_CHARACTERISTIC[1]

}
