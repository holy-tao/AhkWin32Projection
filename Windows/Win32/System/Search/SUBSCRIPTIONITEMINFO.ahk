#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.Search
 */
class SUBSCRIPTIONITEMINFO extends Win32Struct {
    static sizeof => 44

    static packingSize => 4

    /**
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    dwPriority {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Guid}
     */
    ScheduleGroup {
        get {
            if(!this.HasProp("__ScheduleGroup"))
                this.__ScheduleGroup := Guid(12, this)
            return this.__ScheduleGroup
        }
    }

    /**
     * @type {Guid}
     */
    clsidAgent {
        get {
            if(!this.HasProp("__clsidAgent"))
                this.__clsidAgent := Guid(28, this)
            return this.__clsidAgent
        }
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 44
    }
}
