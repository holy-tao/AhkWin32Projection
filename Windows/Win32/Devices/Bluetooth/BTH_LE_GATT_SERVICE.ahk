#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\BTH_LE_UUID.ahk" { BTH_LE_UUID }

/**
 * The BTH_LE_GATT_SERVICE structure describes a Bluetooth Low Energy (LE) generic attribute (GATT) profile service.
 * @see https://learn.microsoft.com/windows/win32/api/bthledef/ns-bthledef-bth_le_gatt_service
 * @namespace Windows.Win32.Devices.Bluetooth
 */
export default struct BTH_LE_GATT_SERVICE {
    #StructPack 4

    /**
     * The Universally Unique ID (UUID) of the Bluetooth LE GATT profile service.
     */
    ServiceUuid : BTH_LE_UUID

    /**
     * The handle to the Bluetooth LE GATT profile attributes.
     */
    AttributeHandle : UInt16

}
