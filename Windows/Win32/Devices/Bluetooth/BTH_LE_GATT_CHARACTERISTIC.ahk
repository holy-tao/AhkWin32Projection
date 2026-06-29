#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\BTH_LE_UUID.ahk" { BTH_LE_UUID }

/**
 * The BTH_LE_GATT_CHARACTERISTIC structure describes a Bluetooth Low Energy (LE) generic attribute (GATT) profile characteristic.
 * @see https://learn.microsoft.com/windows/win32/api/bthledef/ns-bthledef-bth_le_gatt_characteristic
 * @namespace Windows.Win32.Devices.Bluetooth
 */
export default struct BTH_LE_GATT_CHARACTERISTIC {
    #StructPack 4

    /**
     * The handle to the Bluetooth LE GATT profile service.
     */
    ServiceHandle : UInt16

    /**
     * The Universally Unique ID (UUID) of the characteristic.
     */
    CharacteristicUuid : BTH_LE_UUID

    /**
     * The handle to the Bluetooth LE GATT profile attributes.
     */
    AttributeHandle : UInt16

    /**
     * The handle to the Bluetooth LE GATT profile characteristic value.
     */
    CharacteristicValueHandle : UInt16

    /**
     * The characteristic can be broadcast.
     */
    IsBroadcastable : BOOLEAN

    /**
     * The characteristic  can be read.
     */
    IsReadable : BOOLEAN

    /**
     * The characteristic  can be written to.
     */
    IsWritable : BOOLEAN

    /**
     * The characteristic  can be written to without requiring a response.
     */
    IsWritableWithoutResponse : BOOLEAN

    /**
     * The characteristic can be signed writable.
     */
    IsSignedWritable : BOOLEAN

    /**
     * The characteristic can be updated by the device through Handle Value Notifications, and the new value will be returned through the callback function registered via <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothleapis/nf-bluetoothleapis-bluetoothgattregisterevent">BluetoothGATTRegisterEvent</a>.
     */
    IsNotifiable : BOOLEAN

    /**
     * The characteristic can be updated by the device through Handle Value Indications, and the new value will be returned through the callback function registered via <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothleapis/nf-bluetoothleapis-bluetoothgattregisterevent">BluetoothGATTRegisterEvent</a>.
     */
    IsIndicatable : BOOLEAN

    /**
     * The characteristic  has extended properties, which will be presented through a Characteristic Extended Properties descriptor.
     */
    HasExtendedProperties : BOOLEAN

}
