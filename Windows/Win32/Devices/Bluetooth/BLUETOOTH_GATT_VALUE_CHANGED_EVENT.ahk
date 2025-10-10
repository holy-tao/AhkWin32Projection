#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The BLUETOOTH_GATT_VALUE_CHANGED_EVENT structure describes a changed attribute value.
 * @see https://docs.microsoft.com/windows/win32/api//bthledef/ns-bthledef-bluetooth_gatt_value_changed_event
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class BLUETOOTH_GATT_VALUE_CHANGED_EVENT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The handle to the attribute.
     * @type {Integer}
     */
    ChangedAttributeHandle {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * The size, in bytes, of <b>CharacteristicValue</b>.
     * @type {Pointer}
     */
    CharacteristicValueDataSize {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The characteristic value.
     * @type {Pointer<BTH_LE_GATT_CHARACTERISTIC_VALUE>}
     */
    CharacteristicValue {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
