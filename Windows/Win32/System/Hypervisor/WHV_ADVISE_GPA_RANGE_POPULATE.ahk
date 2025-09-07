#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WHV_ADVISE_GPA_RANGE_POPULATE_FLAGS.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class WHV_ADVISE_GPA_RANGE_POPULATE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {WHV_ADVISE_GPA_RANGE_POPULATE_FLAGS}
     */
    Flags{
        get {
            if(!this.HasProp("__Flags"))
                this.__Flags := WHV_ADVISE_GPA_RANGE_POPULATE_FLAGS(this.ptr + 0)
            return this.__Flags
        }
    }

    /**
     * @type {Integer}
     */
    AccessType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
