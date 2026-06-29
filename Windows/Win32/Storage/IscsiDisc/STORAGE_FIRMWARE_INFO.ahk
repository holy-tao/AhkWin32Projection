#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\STORAGE_FIRMWARE_SLOT_INFO.ahk" { STORAGE_FIRMWARE_SLOT_INFO }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
export default struct STORAGE_FIRMWARE_INFO {
    #StructPack 8

    Version : UInt32

    Size : UInt32

    UpgradeSupport : BOOLEAN

    SlotCount : Int8

    ActiveSlot : Int8

    PendingActivateSlot : Int8

    Reserved : UInt32

    Slot : STORAGE_FIRMWARE_SLOT_INFO[1]

}
