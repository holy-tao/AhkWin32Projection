#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SCSI_PASS_THROUGH_DIRECT32.ahk" { SCSI_PASS_THROUGH_DIRECT32 }

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 * @architecture X64, Arm64
 */
export default struct MPIO_PASS_THROUGH_PATH_DIRECT32 {
    #StructPack 8

    PassThrough : SCSI_PASS_THROUGH_DIRECT32

    Version : UInt32

    Length : UInt16

    Flags : Int8

    PortNumber : Int8

    MpioPathId : Int64

}
