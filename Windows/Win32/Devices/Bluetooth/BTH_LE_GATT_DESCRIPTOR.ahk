#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\BTH_LE_UUID.ahk" { BTH_LE_UUID }
#Import ".\BTH_LE_GATT_DESCRIPTOR_TYPE.ahk" { BTH_LE_GATT_DESCRIPTOR_TYPE }

/**
 * The BTH_LE_GATT_DESCRIPTOR structure describes a Bluetooth Low Energy (LE) generic attribute (GATT) profile descriptor.
 * @see https://learn.microsoft.com/windows/win32/api/bthledef/ns-bthledef-bth_le_gatt_descriptor
 * @namespace Windows.Win32.Devices.Bluetooth
 */
export default struct BTH_LE_GATT_DESCRIPTOR {
    #StructPack 4

    /**
     * The handle to the Bluetooth LE GATT profile service.
     */
    ServiceHandle : UInt16

    /**
     * The handle to the Bluetooth LE GATT profile characteristic.
     */
    CharacteristicHandle : UInt16

    /**
     * The type of the Bluetooth LE GATT descriptor.
     */
    DescriptorType : BTH_LE_GATT_DESCRIPTOR_TYPE

    /**
     * The Universally Unique ID (UUID) of the Bluetooth LE GATT descriptor.
     */
    DescriptorUuid : BTH_LE_UUID

    /**
     * The handle to the Bluetooth LE GATT profile attributes.
     */
    AttributeHandle : UInt16

}
