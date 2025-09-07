#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BTH_LE_UUID.ahk

/**
 * The BTH_LE_GATT_DESCRIPTOR_VALUE structure describes a parent characteristic.
 * @see https://learn.microsoft.com/windows/win32/api/bthledef/ns-bthledef-bth_le_gatt_descriptor_value
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class BTH_LE_GATT_DESCRIPTOR_VALUE extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * The type of the descriptor value.
     * @type {Integer}
     */
    DescriptorType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The Universally Unique ID (UUID) of the descriptor value.
     * @type {BTH_LE_UUID}
     */
    DescriptorUuid{
        get {
            if(!this.HasProp("__DescriptorUuid"))
                this.__DescriptorUuid := BTH_LE_UUID(this.ptr + 4)
            return this.__DescriptorUuid
        }
    }

    /**
     * @type {Integer}
     */
    IsReliableWriteEnabled {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    IsAuxiliariesWritable {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }

    /**
     * @type {Integer}
     */
    IsSubscribeToNotification {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    IsSubscribeToIndication {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }

    /**
     * @type {Integer}
     */
    ServerCharacteristicConfiguration {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Format {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Exponent {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }

    /**
     * @type {BTH_LE_UUID}
     */
    Unit{
        get {
            if(!this.HasProp("__Unit"))
                this.__Unit := BTH_LE_UUID(this.ptr + 12)
            return this.__Unit
        }
    }

    /**
     * @type {Integer}
     */
    NameSpace {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * @type {BTH_LE_UUID}
     */
    Description{
        get {
            if(!this.HasProp("__Description"))
                this.__Description := BTH_LE_UUID(this.ptr + 20)
            return this.__Description
        }
    }

    /**
     * The size, in bytes, of the descriptor value.
     * @type {Integer}
     */
    DataSize {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * A pointer to the descriptor value data.
     * @type {Array<Byte>}
     */
    Data{
        get {
            if(!this.HasProp("__DataProxyArray"))
                this.__DataProxyArray := Win32FixedArray(this.ptr + 16, 1, Primitive, "char")
            return this.__DataProxyArray
        }
    }
}
