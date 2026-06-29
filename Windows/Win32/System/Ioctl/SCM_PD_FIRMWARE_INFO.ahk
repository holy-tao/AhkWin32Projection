#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SCM_PD_FIRMWARE_SLOT_INFO.ahk" { SCM_PD_FIRMWARE_SLOT_INFO }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SCM_PD_FIRMWARE_INFO {
    #StructPack 4

    Version : UInt32

    Size : UInt32

    ActiveSlot : Int8

    NextActiveSlot : Int8

    SlotCount : Int8

    Slots : SCM_PD_FIRMWARE_SLOT_INFO[1]

}
