#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\BTH_LE_UUID.ahk" { BTH_LE_UUID }
#Import ".\BTH_LE_GATT_DESCRIPTOR_TYPE.ahk" { BTH_LE_GATT_DESCRIPTOR_TYPE }

/**
 * The BTH_LE_GATT_DESCRIPTOR_VALUE structure describes a parent characteristic.
 * @see https://learn.microsoft.com/windows/win32/api/bthledef/ns-bthledef-bth_le_gatt_descriptor_value
 * @namespace Windows.Win32.Devices.Bluetooth
 */
export default struct BTH_LE_GATT_DESCRIPTOR_VALUE {
    #StructPack 4


    struct _CharacteristicExtendedProperties {
        IsReliableWriteEnabled : BOOLEAN

        IsAuxiliariesWritable : BOOLEAN

    }

    struct _ClientCharacteristicConfiguration {
        IsSubscribeToNotification : BOOLEAN

        IsSubscribeToIndication : BOOLEAN

    }

    struct _ServerCharacteristicConfiguration {
        IsBroadcast : BOOLEAN

    }

    struct _CharacteristicFormat {
        Format : Int8

        Exponent : Int8

        Unit : BTH_LE_UUID

        NameSpace : Int8

        Description : BTH_LE_UUID

    }

    /**
     * The type of the descriptor value.
     */
    DescriptorType : BTH_LE_GATT_DESCRIPTOR_TYPE

    /**
     * The Universally Unique ID (UUID) of the descriptor value.
     */
    DescriptorUuid : BTH_LE_UUID

    CharacteristicExtendedProperties : BTH_LE_GATT_DESCRIPTOR_VALUE._CharacteristicExtendedProperties

    /**
     * The size, in bytes, of the descriptor value.
     */
    DataSize : UInt32

    /**
     * A pointer to the descriptor value data.
     */
    Data : Int8[1]

    static __New() {
        DefineProp(this.Prototype, 'ClientCharacteristicConfiguration', { type: BTH_LE_GATT_DESCRIPTOR_VALUE._ClientCharacteristicConfiguration, offset: 24 })
        DefineProp(this.Prototype, 'ServerCharacteristicConfiguration', { type: BTH_LE_GATT_DESCRIPTOR_VALUE._ServerCharacteristicConfiguration, offset: 24 })
        DefineProp(this.Prototype, 'CharacteristicFormat', { type: BTH_LE_GATT_DESCRIPTOR_VALUE._CharacteristicFormat, offset: 24 })
        this.DeleteProp("__New")
    }
}
