#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BTH_LE_GATT_CHARACTERISTIC_VALUE.ahk" { BTH_LE_GATT_CHARACTERISTIC_VALUE }

/**
 * The BLUETOOTH_GATT_VALUE_CHANGED_EVENT structure describes a changed attribute value.
 * @see https://learn.microsoft.com/windows/win32/api/bthledef/ns-bthledef-bluetooth_gatt_value_changed_event
 * @namespace Windows.Win32.Devices.Bluetooth
 */
export default struct BLUETOOTH_GATT_VALUE_CHANGED_EVENT {
    #StructPack 8

    /**
     * The handle to the attribute.
     */
    ChangedAttributeHandle : UInt16

    /**
     * The size, in bytes, of <b>CharacteristicValue</b>.
     */
    CharacteristicValueDataSize : IntPtr

    /**
     * The characteristic value.
     */
    CharacteristicValue : BTH_LE_GATT_CHARACTERISTIC_VALUE.Ptr

}
