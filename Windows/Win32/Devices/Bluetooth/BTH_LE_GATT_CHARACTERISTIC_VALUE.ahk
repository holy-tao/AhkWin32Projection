#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The BTH_LE_GATT_CHARACTERISTIC_VALUE structure describes a Bluetooth Low Energy (LE) generic attribute (GATT) profile characteristic value.
 * @see https://learn.microsoft.com/windows/win32/api/bthledef/ns-bthledef-bth_le_gatt_characteristic_value
 * @namespace Windows.Win32.Devices.Bluetooth
 */
export default struct BTH_LE_GATT_CHARACTERISTIC_VALUE {
    #StructPack 4

    /**
     * The size, in bytes, of the Bluetooth LE GATT characteristic value.
     */
    DataSize : UInt32

    /**
     * A pointer to the Bluetooth LE GATT characteristic value data.
     */
    Data : Int8[1]

}
