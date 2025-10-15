#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * The BTH_LE_UUID structure contains information about a Bluetooth Low Energy (LE) Universally Unique Identifier (UUID).
 * @see https://docs.microsoft.com/windows/win32/api//bthledef/ns-bthledef-bth_le_uuid
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class BTH_LE_UUID extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Indicates if the Low Energy (LE) UUID a 16-bit shortened value, or if it is the long 128-bit value.
     * @type {BOOLEAN}
     */
    IsShortUuid{
        get {
            if(!this.HasProp("__IsShortUuid"))
                this.__IsShortUuid := BOOLEAN(this.ptr + 0)
            return this.__IsShortUuid
        }
    }

    /**
     * @type {Integer}
     */
    ShortUuid {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {Pointer<Guid>}
     */
    LongUuid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
