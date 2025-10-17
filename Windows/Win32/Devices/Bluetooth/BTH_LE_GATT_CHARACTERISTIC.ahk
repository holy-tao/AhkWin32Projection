#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BTH_LE_UUID.ahk

/**
 * The BTH_LE_GATT_CHARACTERISTIC structure describes a Bluetooth Low Energy (LE) generic attribute (GATT) profile characteristic.
 * @see https://docs.microsoft.com/windows/win32/api//bthledef/ns-bthledef-bth_le_gatt_characteristic
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class BTH_LE_GATT_CHARACTERISTIC extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

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
                this.__CharacteristicUuid := BTH_LE_UUID(8, this)
            return this.__CharacteristicUuid
        }
    }

    /**
     * The handle to the Bluetooth LE GATT profile attributes.
     * @type {Integer}
     */
    AttributeHandle {
        get => NumGet(this, 24, "ushort")
        set => NumPut("ushort", value, this, 24)
    }

    /**
     * The handle to the Bluetooth LE GATT profile characteristic value.
     * @type {Integer}
     */
    CharacteristicValueHandle {
        get => NumGet(this, 26, "ushort")
        set => NumPut("ushort", value, this, 26)
    }

    /**
     * The characteristic can be broadcast.
     * @type {BOOLEAN}
     */
    IsBroadcastable {
        get => NumGet(this, 28, "char")
        set => NumPut("char", value, this, 28)
    }

    /**
     * The characteristic  can be read.
     * @type {BOOLEAN}
     */
    IsReadable {
        get => NumGet(this, 29, "char")
        set => NumPut("char", value, this, 29)
    }

    /**
     * The characteristic  can be written to.
     * @type {BOOLEAN}
     */
    IsWritable {
        get => NumGet(this, 30, "char")
        set => NumPut("char", value, this, 30)
    }

    /**
     * The characteristic  can be written to without requiring a response.
     * @type {BOOLEAN}
     */
    IsWritableWithoutResponse {
        get => NumGet(this, 31, "char")
        set => NumPut("char", value, this, 31)
    }

    /**
     * The characteristic can be signed writable.
     * @type {BOOLEAN}
     */
    IsSignedWritable {
        get => NumGet(this, 32, "char")
        set => NumPut("char", value, this, 32)
    }

    /**
     * The characteristic can be updated by the device through Handle Value Notifications, and the new value will be returned through the callback function registered via <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothleapis/nf-bluetoothleapis-bluetoothgattregisterevent">BluetoothGATTRegisterEvent</a>.
     * @type {BOOLEAN}
     */
    IsNotifiable {
        get => NumGet(this, 33, "char")
        set => NumPut("char", value, this, 33)
    }

    /**
     * The characteristic can be updated by the device through Handle Value Indications, and the new value will be returned through the callback function registered via <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothleapis/nf-bluetoothleapis-bluetoothgattregisterevent">BluetoothGATTRegisterEvent</a>.
     * @type {BOOLEAN}
     */
    IsIndicatable {
        get => NumGet(this, 34, "char")
        set => NumPut("char", value, this, 34)
    }

    /**
     * The characteristic  has extended properties, which will be presented through a Characteristic Extended Properties descriptor.
     * @type {BOOLEAN}
     */
    HasExtendedProperties {
        get => NumGet(this, 35, "char")
        set => NumPut("char", value, this, 35)
    }
}
