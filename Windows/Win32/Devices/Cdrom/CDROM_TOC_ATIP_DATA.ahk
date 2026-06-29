#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CDROM_TOC_ATIP_DATA_BLOCK.ahk" { CDROM_TOC_ATIP_DATA_BLOCK }

/**
 * @namespace Windows.Win32.Devices.Cdrom
 */
export default struct CDROM_TOC_ATIP_DATA {
    #StructPack 1

    Length : Int8[2]

    Reserved1 : Int8

    Reserved2 : Int8

    Descriptors : CDROM_TOC_ATIP_DATA_BLOCK[1]

}
