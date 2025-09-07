#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BTH_LE_UUID.ahk

/**
 * The BTH_LE_GATT_CHARACTERISTIC structure describes a Bluetooth Low Energy (LE) generic attribute (GATT) profile characteristic.
 * @see https://learn.microsoft.com/windows/win32/api/bthledef/ns-bthledef-bth_le_gatt_characteristic
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class BTH_LE_GATT_CHARACTERISTIC extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * The handle to the Bluetooth LE GATT profile service.
     * @type {Integer}
     */
    ServiceHandle {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * The Universally Unique ID (UUID) of the characteristic.
     * @type {BTH_LE_UUID}
     */
    CharacteristicUuid{
        get {
            if(!this.HasProp("__CharacteristicUuid"))
                this.__CharacteristicUuid := BTH_LE_UUID(this.ptr + 4)
            return this.__CharacteristicUuid
        }
    }

    /**
     * The handle to the Bluetooth LE GATT profile attributes.
     * @type {Integer}
     */
    AttributeHandle {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * The handle to the Bluetooth LE GATT profile characteristic value.
     * @type {Integer}
     */
    CharacteristicValueHandle {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * The characteristic can be broadcast.
     * @type {Integer}
     */
    IsBroadcastable {
        get => NumGet(this, 12, "char")
        set => NumPut("char", value, this, 12)
    }

    /**
     * The characteristic  can be read.
     * @type {Integer}
     */
    IsReadable {
        get => NumGet(this, 13, "char")
        set => NumPut("char", value, this, 13)
    }

    /**
     * The characteristic  can be written to.
     * @type {Integer}
     */
    IsWritable {
        get => NumGet(this, 14, "char")
        set => NumPut("char", value, this, 14)
    }

    /**
     * The characteristic  can be written to without requiring a response.
     * @type {Integer}
     */
    IsWritableWithoutResponse {
        get => NumGet(this, 15, "char")
        set => NumPut("char", value, this, 15)
    }

    /**
     * The characteristic can be signed writable.
     * @type {Integer}
     */
    IsSignedWritable {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * The characteristic can be updated by the device through Handle Value Notifications, and the new value will be returned through the callback function registered via <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothleapis/nf-bluetoothleapis-bluetoothgattregisterevent">BluetoothGATTRegisterEvent</a>.
     * @type {Integer}
     */
    IsNotifiable {
        get => NumGet(this, 17, "char")
        set => NumPut("char", value, this, 17)
    }

    /**
     * The characteristic can be updated by the device through Handle Value Indications, and the new value will be returned through the callback function registered via <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothleapis/nf-bluetoothleapis-bluetoothgattregisterevent">BluetoothGATTRegisterEvent</a>.
     * @type {Integer}
     */
    IsIndicatable {
        get => NumGet(this, 18, "char")
        set => NumPut("char", value, this, 18)
    }

    /**
     * The characteristic  has extended properties, which will be presented through a Characteristic Extended Properties descriptor.
     * @type {Integer}
     */
    HasExtendedProperties {
        get => NumGet(this, 19, "char")
        set => NumPut("char", value, this, 19)
    }
}
