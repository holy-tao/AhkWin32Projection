#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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

    class _Value_e__Union extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Integer}
         */
        ShortUuid {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
        /**
         * @type {Pointer<Guid>}
         */
        LongUuid {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
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
     * @type {_Value_e__Union}
     */
    Value{
        get {
            if(!this.HasProp("__Value"))
                this.__Value := %this.__Class%._Value_e__Union(8, this)
            return this.__Value
        }
    }
}
