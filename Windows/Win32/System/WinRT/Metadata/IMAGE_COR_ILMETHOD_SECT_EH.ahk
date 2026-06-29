#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IMAGE_COR_ILMETHOD_SECT_EH_FAT.ahk" { IMAGE_COR_ILMETHOD_SECT_EH_FAT }
#Import ".\IMAGE_COR_ILMETHOD_SECT_SMALL.ahk" { IMAGE_COR_ILMETHOD_SECT_SMALL }
#Import ".\IMAGE_COR_ILMETHOD_SECT_EH_SMALL.ahk" { IMAGE_COR_ILMETHOD_SECT_EH_SMALL }
#Import ".\CorExceptionFlag.ahk" { CorExceptionFlag }
#Import ".\IMAGE_COR_ILMETHOD_SECT_FAT.ahk" { IMAGE_COR_ILMETHOD_SECT_FAT }
#Import ".\IMAGE_COR_ILMETHOD_SECT_EH_CLAUSE_FAT.ahk" { IMAGE_COR_ILMETHOD_SECT_EH_CLAUSE_FAT }
#Import ".\IMAGE_COR_ILMETHOD_SECT_EH_CLAUSE_SMALL.ahk" { IMAGE_COR_ILMETHOD_SECT_EH_CLAUSE_SMALL }

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
export default struct IMAGE_COR_ILMETHOD_SECT_EH {
    #StructPack 4

    Small : IMAGE_COR_ILMETHOD_SECT_EH_SMALL

    static __New() {
        DefineProp(this.Prototype, 'Fat', { type: IMAGE_COR_ILMETHOD_SECT_EH_FAT, offset: 0 })
        this.DeleteProp("__New")
    }
}
