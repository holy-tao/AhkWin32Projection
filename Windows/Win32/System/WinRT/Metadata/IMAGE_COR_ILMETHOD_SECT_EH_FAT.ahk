#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\IMAGE_COR_ILMETHOD_SECT_EH_CLAUSE_FAT.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class IMAGE_COR_ILMETHOD_SECT_EH_FAT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    SectFat {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<IMAGE_COR_ILMETHOD_SECT_EH_CLAUSE_FAT>}
     */
    Clauses{
        get {
            if(!this.HasProp("__ClausesProxyArray"))
                this.__ClausesProxyArray := Win32FixedArray(this.ptr + 8, 8, IMAGE_COR_ILMETHOD_SECT_EH_CLAUSE_FAT, "")
            return this.__ClausesProxyArray
        }
    }
}
