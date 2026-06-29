#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\IMAGE_COR_ILMETHOD_SECT_EH_CLAUSE_SMALL.ahk
#Include .\IMAGE_COR_ILMETHOD_SECT_SMALL.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
class IMAGE_COR_ILMETHOD_SECT_EH_SMALL extends Win32Struct {
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {IMAGE_COR_ILMETHOD_SECT_SMALL}
     */
    SectSmall {
        get {
            if(!this.HasProp("__SectSmall"))
                this.__SectSmall := IMAGE_COR_ILMETHOD_SECT_SMALL(0, this)
            return this.__SectSmall
        }
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {IMAGE_COR_ILMETHOD_SECT_EH_CLAUSE_SMALL}
     */
    Clauses {
        get {
            if(!this.HasProp("__ClausesProxyArray"))
                this.__ClausesProxyArray := Win32FixedArray(this.ptr + 4, 1, IMAGE_COR_ILMETHOD_SECT_EH_CLAUSE_SMALL, "")
            return this.__ClausesProxyArray
        }
    }
}
