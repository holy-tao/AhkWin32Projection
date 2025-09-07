#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\IMAGE_COR_ILMETHOD_SECT_SMALL.ahk
#Include .\IMAGE_COR_ILMETHOD_SECT_EH_CLAUSE_SMALL.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class IMAGE_COR_ILMETHOD_SECT_EH_SMALL extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {IMAGE_COR_ILMETHOD_SECT_SMALL}
     */
    SectSmall{
        get {
            if(!this.HasProp("__SectSmall"))
                this.__SectSmall := IMAGE_COR_ILMETHOD_SECT_SMALL(this.ptr + 0)
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
     * @type {Array<IMAGE_COR_ILMETHOD_SECT_EH_CLAUSE_SMALL>}
     */
    Clauses{
        get {
            if(!this.HasProp("__ClausesProxyArray"))
                this.__ClausesProxyArray := Win32FixedArray(this.ptr + 8, 8, IMAGE_COR_ILMETHOD_SECT_EH_CLAUSE_SMALL, "")
            return this.__ClausesProxyArray
        }
    }
}
