#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WHV_ADVISE_GPA_RANGE_POPULATE_FLAGS.ahk
#Include .\WHV_ADVISE_GPA_RANGE_POPULATE.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class WHV_ADVISE_GPA_RANGE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {WHV_ADVISE_GPA_RANGE_POPULATE}
     */
    Populate{
        get {
            if(!this.HasProp("__Populate"))
                this.__Populate := WHV_ADVISE_GPA_RANGE_POPULATE(this.ptr + 0)
            return this.__Populate
        }
    }
}
