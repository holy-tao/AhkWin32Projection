#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BTH_LE_UUID.ahk

/**
 * The BTH_LE_GATT_DESCRIPTOR structure describes a Bluetooth Low Energy (LE) generic attribute (GATT) profile descriptor.
 * @see https://learn.microsoft.com/windows/win32/api/bthledef/ns-bthledef-bth_le_gatt_descriptor
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class BTH_LE_GATT_DESCRIPTOR extends Win32Struct
{
    static sizeof => 32

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
     * The handle to the Bluetooth LE GATT profile characteristic.
     * @type {Integer}
     */
    CharacteristicHandle {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * The type of the Bluetooth LE GATT descriptor.
     * @type {Integer}
     */
    DescriptorType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * The Universally Unique ID (UUID) of the Bluetooth LE GATT descriptor.
     * @type {BTH_LE_UUID}
     */
    DescriptorUuid{
        get {
            if(!this.HasProp("__DescriptorUuid"))
                this.__DescriptorUuid := BTH_LE_UUID(8, this)
            return this.__DescriptorUuid
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
}
