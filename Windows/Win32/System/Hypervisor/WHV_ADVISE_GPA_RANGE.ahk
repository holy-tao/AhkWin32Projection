#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WHV_ADVISE_GPA_RANGE_POPULATE.ahk
#Include .\WHV_ADVISE_GPA_RANGE_POPULATE_FLAGS.ahk
#Include .\WHV_MEMORY_ACCESS_TYPE.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
class WHV_ADVISE_GPA_RANGE extends Win32Struct {
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {WHV_ADVISE_GPA_RANGE_POPULATE}
     */
    Populate {
        get {
            if(!this.HasProp("__Populate"))
                this.__Populate := WHV_ADVISE_GPA_RANGE_POPULATE(0, this)
            return this.__Populate
        }
    }
}
