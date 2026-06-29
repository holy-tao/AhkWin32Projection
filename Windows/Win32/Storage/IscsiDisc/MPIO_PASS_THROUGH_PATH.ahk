#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SCSI_PASS_THROUGH.ahk" { SCSI_PASS_THROUGH }

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
export default struct MPIO_PASS_THROUGH_PATH {
    #StructPack 8

    PassThrough : SCSI_PASS_THROUGH

    Version : UInt32

    Length : UInt16

    Flags : Int8

    PortNumber : Int8

    MpioPathId : Int64

}
