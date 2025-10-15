#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 */
class HIDP_DATA extends Win32Struct
{
    static sizeof => 14

    static packingSize => 7

    /**
     * @type {Integer}
     */
    DataIndex {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    RawValue {
        get => NumGet(this, 7, "uint")
        set => NumPut("uint", value, this, 7)
    }

    /**
     * @type {BOOLEAN}
     */
    On{
        get {
            if(!this.HasProp("__On"))
                this.__On := BOOLEAN(this.ptr + 7)
            return this.__On
        }
    }
}
