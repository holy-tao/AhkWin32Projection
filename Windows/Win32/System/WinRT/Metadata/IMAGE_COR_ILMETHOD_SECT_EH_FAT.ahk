#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CorExceptionFlag.ahk" { CorExceptionFlag }
#Import ".\IMAGE_COR_ILMETHOD_SECT_FAT.ahk" { IMAGE_COR_ILMETHOD_SECT_FAT }
#Import ".\IMAGE_COR_ILMETHOD_SECT_EH_CLAUSE_FAT.ahk" { IMAGE_COR_ILMETHOD_SECT_EH_CLAUSE_FAT }

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
export default struct IMAGE_COR_ILMETHOD_SECT_EH_FAT {
    #StructPack 4

    SectFat : IMAGE_COR_ILMETHOD_SECT_FAT

    Clauses : IMAGE_COR_ILMETHOD_SECT_EH_CLAUSE_FAT[1]

}
