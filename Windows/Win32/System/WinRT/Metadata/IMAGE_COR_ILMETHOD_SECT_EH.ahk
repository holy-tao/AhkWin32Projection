#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\IMAGE_COR_ILMETHOD_SECT_SMALL.ahk
#Include .\IMAGE_COR_ILMETHOD_SECT_EH_CLAUSE_SMALL.ahk
#Include .\IMAGE_COR_ILMETHOD_SECT_EH_SMALL.ahk
#Include .\IMAGE_COR_ILMETHOD_SECT_EH_CLAUSE_FAT.ahk
#Include .\IMAGE_COR_ILMETHOD_SECT_EH_FAT.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class IMAGE_COR_ILMETHOD_SECT_EH extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {IMAGE_COR_ILMETHOD_SECT_EH_SMALL}
     */
    Small{
        get {
            if(!this.HasProp("__Small"))
                this.__Small := IMAGE_COR_ILMETHOD_SECT_EH_SMALL(this.ptr + 0)
            return this.__Small
        }
    }

    /**
     * @type {IMAGE_COR_ILMETHOD_SECT_EH_FAT}
     */
    Fat{
        get {
            if(!this.HasProp("__Fat"))
                this.__Fat := IMAGE_COR_ILMETHOD_SECT_EH_FAT(this.ptr + 0)
            return this.__Fat
        }
    }
}
