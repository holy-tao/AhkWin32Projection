#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The BTH_LE_GATT_EVENT_TYPE enumeration describes the different types of Bluetooth Low Energy (LE) generic attribute (GATT) profile events.
 * @see https://learn.microsoft.com/windows/win32/api/bthledef/ne-bthledef-bth_le_gatt_event_type
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class BTH_LE_GATT_EVENT_TYPE extends Win32Enum{

    /**
     * The characteristic value has changed.
     * @type {Integer (Int32)}
     */
    static CharacteristicValueChangedEvent => 0
}
