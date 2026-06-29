#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IMAGE_COR_ILMETHOD_SECT_SMALL.ahk" { IMAGE_COR_ILMETHOD_SECT_SMALL }
#Import ".\IMAGE_COR_ILMETHOD_SECT_EH_CLAUSE_SMALL.ahk" { IMAGE_COR_ILMETHOD_SECT_EH_CLAUSE_SMALL }

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
export default struct IMAGE_COR_ILMETHOD_SECT_EH_SMALL {
    #StructPack 4

    SectSmall : IMAGE_COR_ILMETHOD_SECT_SMALL

    Reserved : UInt16

    Clauses : IMAGE_COR_ILMETHOD_SECT_EH_CLAUSE_SMALL[1]

}
