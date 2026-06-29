#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SCSI_PASS_THROUGH32.ahk" { SCSI_PASS_THROUGH32 }

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 * @architecture X64, Arm64
 */
export default struct MPIO_PASS_THROUGH_PATH32 {
    #StructPack 8

    PassThrough : SCSI_PASS_THROUGH32

    Version : UInt32

    Length : UInt16

    Flags : Int8

    PortNumber : Int8

    MpioPathId : Int64

}
