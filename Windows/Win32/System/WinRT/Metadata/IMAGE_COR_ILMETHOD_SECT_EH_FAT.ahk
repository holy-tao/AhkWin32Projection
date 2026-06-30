#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\CorExceptionFlag.ahk
#Include .\IMAGE_COR_ILMETHOD_SECT_EH_CLAUSE_FAT.ahk
#Include .\IMAGE_COR_ILMETHOD_SECT_FAT.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
class IMAGE_COR_ILMETHOD_SECT_EH_FAT extends Win32Struct {
    static sizeof => 28

    static packingSize => 4

    /**
     * @type {IMAGE_COR_ILMETHOD_SECT_FAT}
     */
    SectFat {
        get {
            if(!this.HasProp("__SectFat"))
                this.__SectFat := IMAGE_COR_ILMETHOD_SECT_FAT(0, this)
            return this.__SectFat
        }
    }

    /**
     * @type {IMAGE_COR_ILMETHOD_SECT_EH_CLAUSE_FAT}
     */
    Clauses {
        get {
            if(!this.HasProp("__ClausesProxyArray"))
                this.__ClausesProxyArray := Win32FixedArray(this.ptr + 4, 1, IMAGE_COR_ILMETHOD_SECT_EH_CLAUSE_FAT, "")
            return this.__ClausesProxyArray
        }
    }
}
