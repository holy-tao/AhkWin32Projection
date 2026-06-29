#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
export default struct STORAGE_FIRMWARE_SLOT_INFO_V2 {
    #StructPack 1

    SlotNumber : Int8

    ReadOnly : BOOLEAN

    Reserved : Int8[6]

    Revision : Int8[16]

}
