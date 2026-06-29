#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BTH_LE_GATT_DESCRIPTOR_TYPE.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BOOLEAN.ahk
#Include .\BTH_LE_UUID.ahk

/**
 * The BTH_LE_GATT_DESCRIPTOR_VALUE structure describes a parent characteristic.
 * @see https://learn.microsoft.com/windows/win32/api/bthledef/ns-bthledef-bth_le_gatt_descriptor_value
 * @namespace Windows.Win32.Devices.Bluetooth
 */
class BTH_LE_GATT_DESCRIPTOR_VALUE extends Win32Struct {
    static sizeof => 80

    static packingSize => 4

    /**
     * The type of the descriptor value.
     * @type {BTH_LE_GATT_DESCRIPTOR_TYPE}
     */
    DescriptorType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The Universally Unique ID (UUID) of the descriptor value.
     * @type {BTH_LE_UUID}
     */
    DescriptorUuid {
        get {
            if(!this.HasProp("__DescriptorUuid"))
                this.__DescriptorUuid := BTH_LE_UUID(4, this)
            return this.__DescriptorUuid
        }
    }

    class _CharacteristicExtendedProperties extends Win32Struct {
        static sizeof => 2
        static packingSize => 1

        /**
         * @type {BOOLEAN}
         */
        IsReliableWriteEnabled {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }

        /**
         * @type {BOOLEAN}
         */
        IsAuxiliariesWritable {
            get => NumGet(this, 1, "char")
            set => NumPut("char", value, this, 1)
        }
    }

    class _ClientCharacteristicConfiguration extends Win32Struct {
        static sizeof => 2
        static packingSize => 1

        /**
         * @type {BOOLEAN}
         */
        IsSubscribeToNotification {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }

        /**
         * @type {BOOLEAN}
         */
        IsSubscribeToIndication {
            get => NumGet(this, 1, "char")
            set => NumPut("char", value, this, 1)
        }
    }

    class _ServerCharacteristicConfiguration extends Win32Struct {
        static sizeof => 1
        static packingSize => 1

        /**
         * @type {BOOLEAN}
         */
        IsBroadcast {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    }

    class _CharacteristicFormat extends Win32Struct {
        static sizeof => 48
        static packingSize => 4

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
        Unit {
            get {
                if(!this.HasProp("__Unit"))
                    this.__Unit := BTH_LE_UUID(4, this)
                return this.__Unit
            }
        }

        /**
         * @type {Integer}
         */
        NameSpace {
            get => NumGet(this, 24, "char")
            set => NumPut("char", value, this, 24)
        }

        /**
         * @type {BTH_LE_UUID}
         */
        Description {
            get {
                if(!this.HasProp("__Description"))
                    this.__Description := BTH_LE_UUID(28, this)
                return this.__Description
            }
        }
    }

    /**
     * @type {_CharacteristicExtendedProperties}
     */
    CharacteristicExtendedProperties {
        get {
            if(!this.HasProp("__CharacteristicExtendedProperties"))
                this.__CharacteristicExtendedProperties := BTH_LE_GATT_DESCRIPTOR_VALUE._CharacteristicExtendedProperties(24, this)
            return this.__CharacteristicExtendedProperties
        }
    }

    /**
     * @type {_ClientCharacteristicConfiguration}
     */
    ClientCharacteristicConfiguration {
        get {
            if(!this.HasProp("__ClientCharacteristicConfiguration"))
                this.__ClientCharacteristicConfiguration := BTH_LE_GATT_DESCRIPTOR_VALUE._ClientCharacteristicConfiguration(24, this)
            return this.__ClientCharacteristicConfiguration
        }
    }

    /**
     * @type {_ServerCharacteristicConfiguration}
     */
    ServerCharacteristicConfiguration {
        get {
            if(!this.HasProp("__ServerCharacteristicConfiguration"))
                this.__ServerCharacteristicConfiguration := BTH_LE_GATT_DESCRIPTOR_VALUE._ServerCharacteristicConfiguration(24, this)
            return this.__ServerCharacteristicConfiguration
        }
    }

    /**
     * @type {_CharacteristicFormat}
     */
    CharacteristicFormat {
        get {
            if(!this.HasProp("__CharacteristicFormat"))
                this.__CharacteristicFormat := BTH_LE_GATT_DESCRIPTOR_VALUE._CharacteristicFormat(24, this)
            return this.__CharacteristicFormat
        }
    }

    /**
     * The size, in bytes, of the descriptor value.
     * @type {Integer}
     */
    DataSize {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * A pointer to the descriptor value data.
     * @type {Array<Integer>}
     */
    Data {
        get {
            if(!this.HasProp("__DataProxyArray"))
                this.__DataProxyArray := Win32FixedArray(this.ptr + 76, 1, Primitive, "char")
            return this.__DataProxyArray
        }
    }
}
