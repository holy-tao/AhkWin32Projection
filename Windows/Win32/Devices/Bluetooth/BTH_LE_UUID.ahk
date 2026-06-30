#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * The BTH_LE_UUID structure contains information about a Bluetooth Low Energy (LE) Universally Unique Identifier (UUID).
 * @see https://learn.microsoft.com/windows/win32/api/bthledef/ns-bthledef-bth_le_uuid
 * @namespace Windows.Win32.Devices.Bluetooth
 */
class BTH_LE_UUID extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    class _Value extends Win32Struct {
        static sizeof => 16
        static packingSize => 4

        /**
         * @type {Integer}
         */
        ShortUuid {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }

        /**
         * @type {Guid}
         */
        LongUuid {
            get {
                if(!this.HasProp("__LongUuid"))
                    this.__LongUuid := Guid(0, this)
                return this.__LongUuid
            }
        }
    }

    /**
     * Indicates if the Low Energy (LE) UUID a 16-bit shortened value, or if it is the long 128-bit value.
     * @type {BOOLEAN}
     */
    IsShortUuid {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * The value of the UUID.
     * @type {_Value}
     */
    Value {
        get {
            if(!this.HasProp("__Value"))
                this.__Value := BTH_LE_UUID._Value(4, this)
            return this.__Value
        }
    }
}
