#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CDROM_TOC_CD_TEXT_DATA_BLOCK.ahk" { CDROM_TOC_CD_TEXT_DATA_BLOCK }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Devices.Cdrom
 */
export default struct CDROM_TOC_CD_TEXT_DATA {
    #StructPack 2

    Length : Int8[2]

    Reserved1 : Int8

    Reserved2 : Int8

    Descriptors : CDROM_TOC_CD_TEXT_DATA_BLOCK[1]

}
