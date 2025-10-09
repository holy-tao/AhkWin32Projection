#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BTH_LE_UUID.ahk

/**
 * The BTH_LE_GATT_SERVICE structure describes a Bluetooth Low Energy (LE) generic attribute (GATT) profile service.
 * @see https://learn.microsoft.com/windows/win32/api/bthledef/ns-bthledef-bth_le_gatt_service
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class BTH_LE_GATT_SERVICE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The Universally Unique ID (UUID) of the Bluetooth LE GATT profile service.
     * @type {BTH_LE_UUID}
     */
    ServiceUuid{
        get {
            if(!this.HasProp("__ServiceUuid"))
                this.__ServiceUuid := BTH_LE_UUID(this.ptr + 0)
            return this.__ServiceUuid
        }
    }

    /**
     * The handle to the Bluetooth LE GATT profile attributes.
     * @type {Integer}
     */
    AttributeHandle {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }
}
