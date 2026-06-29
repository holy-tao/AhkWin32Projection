#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\STORAGE_FIRMWARE_SLOT_INFO_V2.ahk" { STORAGE_FIRMWARE_SLOT_INFO_V2 }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
export default struct STORAGE_FIRMWARE_INFO_V2 {
    #StructPack 4

    Version : UInt32

    Size : UInt32

    UpgradeSupport : BOOLEAN

    SlotCount : Int8

    ActiveSlot : Int8

    PendingActivateSlot : Int8

    FirmwareShared : BOOLEAN

    Reserved : Int8[3]

    ImagePayloadAlignment : UInt32

    ImagePayloadMaxSize : UInt32

    Slot : STORAGE_FIRMWARE_SLOT_INFO_V2[1]

}
