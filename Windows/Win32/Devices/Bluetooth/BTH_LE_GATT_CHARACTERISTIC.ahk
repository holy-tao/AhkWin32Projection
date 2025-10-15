#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk
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
                this.__CharacteristicUuid := BTH_LE_UUID(this.ptr + 8)
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
    IsBroadcastable{
        get {
            if(!this.HasProp("__IsBroadcastable"))
                this.__IsBroadcastable := BOOLEAN(this.ptr + 28)
            return this.__IsBroadcastable
        }
    }

    /**
     * The characteristic  can be read.
     * @type {BOOLEAN}
     */
    IsReadable{
        get {
            if(!this.HasProp("__IsReadable"))
                this.__IsReadable := BOOLEAN(this.ptr + 29)
            return this.__IsReadable
        }
    }

    /**
     * The characteristic  can be written to.
     * @type {BOOLEAN}
     */
    IsWritable{
        get {
            if(!this.HasProp("__IsWritable"))
                this.__IsWritable := BOOLEAN(this.ptr + 30)
            return this.__IsWritable
        }
    }

    /**
     * The characteristic  can be written to without requiring a response.
     * @type {BOOLEAN}
     */
    IsWritableWithoutResponse{
        get {
            if(!this.HasProp("__IsWritableWithoutResponse"))
                this.__IsWritableWithoutResponse := BOOLEAN(this.ptr + 31)
            return this.__IsWritableWithoutResponse
        }
    }

    /**
     * The characteristic can be signed writable.
     * @type {BOOLEAN}
     */
    IsSignedWritable{
        get {
            if(!this.HasProp("__IsSignedWritable"))
                this.__IsSignedWritable := BOOLEAN(this.ptr + 32)
            return this.__IsSignedWritable
        }
    }

    /**
     * The characteristic can be updated by the device through Handle Value Notifications, and the new value will be returned through the callback function registered via <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothleapis/nf-bluetoothleapis-bluetoothgattregisterevent">BluetoothGATTRegisterEvent</a>.
     * @type {BOOLEAN}
     */
    IsNotifiable{
        get {
            if(!this.HasProp("__IsNotifiable"))
                this.__IsNotifiable := BOOLEAN(this.ptr + 33)
            return this.__IsNotifiable
        }
    }

    /**
     * The characteristic can be updated by the device through Handle Value Indications, and the new value will be returned through the callback function registered via <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothleapis/nf-bluetoothleapis-bluetoothgattregisterevent">BluetoothGATTRegisterEvent</a>.
     * @type {BOOLEAN}
     */
    IsIndicatable{
        get {
            if(!this.HasProp("__IsIndicatable"))
                this.__IsIndicatable := BOOLEAN(this.ptr + 34)
            return this.__IsIndicatable
        }
    }

    /**
     * The characteristic  has extended properties, which will be presented through a Characteristic Extended Properties descriptor.
     * @type {BOOLEAN}
     */
    HasExtendedProperties{
        get {
            if(!this.HasProp("__HasExtendedProperties"))
                this.__HasExtendedProperties := BOOLEAN(this.ptr + 35)
            return this.__HasExtendedProperties
        }
    }
}
