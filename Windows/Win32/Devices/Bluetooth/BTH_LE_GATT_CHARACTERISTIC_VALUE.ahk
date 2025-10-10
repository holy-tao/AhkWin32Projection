#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The BTH_LE_GATT_CHARACTERISTIC_VALUE structure describes a Bluetooth Low Energy (LE) generic attribute (GATT) profile characteristic value.
 * @see https://docs.microsoft.com/windows/win32/api//bthledef/ns-bthledef-bth_le_gatt_characteristic_value
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class BTH_LE_GATT_CHARACTERISTIC_VALUE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The size, in bytes, of the Bluetooth LE GATT characteristic value.
     * @type {Integer}
     */
    DataSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to the Bluetooth LE GATT characteristic value data.
     * @type {Array<Byte>}
     */
    Data{
        get {
            if(!this.HasProp("__DataProxyArray"))
                this.__DataProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__DataProxyArray
        }
    }
}
