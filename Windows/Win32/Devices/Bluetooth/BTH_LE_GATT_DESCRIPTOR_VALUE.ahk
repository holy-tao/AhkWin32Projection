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

    class _CharacteristicExtendedProperties extends Win32Struct {
        static sizeof => 1
        static packingSize => 8

        /**
         * @type {Integer}
         */
        IsReliableWriteEnabled {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        IsAuxiliariesWritable {
            get => NumGet(this, 1, "char")
            set => NumPut("char", value, this, 1)
        }
    
    }

    class _ClientCharacteristicConfiguration extends Win32Struct {
        static sizeof => 1
        static packingSize => 8

        /**
         * @type {Integer}
         */
        IsSubscribeToNotification {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        IsSubscribeToIndication {
            get => NumGet(this, 1, "char")
            set => NumPut("char", value, this, 1)
        }
    
    }

    class _CharacteristicFormat extends Win32Struct {
        static sizeof => 1
        static packingSize => 8

        /**
         * @type {Integer}
         */
        Format {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Exponent {
            get => NumGet(this, 1, "char")
            set => NumPut("char", value, this, 1)
        }
    
        /**
         * @type {BTH_LE_UUID}
         */
        Unit{
            get {
                if(!this.HasProp("__Unit"))
                    this.__Unit := BTH_LE_UUID(this.ptr + 4)
                return this.__Unit
            }
        }
    
        /**
         * @type {Integer}
         */
        NameSpace {
            get => NumGet(this, 8, "char")
            set => NumPut("char", value, this, 8)
        }
    
        /**
         * @type {BTH_LE_UUID}
         */
        Description{
            get {
                if(!this.HasProp("__Description"))
                    this.__Description := BTH_LE_UUID(this.ptr + 12)
                return this.__Description
            }
        }
    
    }

    /**
     * @type {_CharacteristicExtendedProperties}
     */
    CharacteristicExtendedProperties{
        get {
            if(!this.HasProp("__CharacteristicExtendedProperties"))
                this.__CharacteristicExtendedProperties := %this.__Class%._CharacteristicExtendedProperties(this.ptr + 8)
            return this.__CharacteristicExtendedProperties
        }
    }

    /**
     * @type {_ClientCharacteristicConfiguration}
     */
    ClientCharacteristicConfiguration{
        get {
            if(!this.HasProp("__ClientCharacteristicConfiguration"))
                this.__ClientCharacteristicConfiguration := %this.__Class%._ClientCharacteristicConfiguration(this.ptr + 8)
            return this.__ClientCharacteristicConfiguration
        }
    }

    /**
     * @type {Integer}
     */
    ServerCharacteristicConfiguration {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * @type {_CharacteristicFormat}
     */
    CharacteristicFormat{
        get {
            if(!this.HasProp("__CharacteristicFormat"))
                this.__CharacteristicFormat := %this.__Class%._CharacteristicFormat(this.ptr + 8)
            return this.__CharacteristicFormat
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
