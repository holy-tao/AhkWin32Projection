#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SCSI_PASS_THROUGH_DIRECT.ahk" { SCSI_PASS_THROUGH_DIRECT }

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
export default struct MPIO_PASS_THROUGH_PATH_DIRECT {
    #StructPack 8

    PassThrough : SCSI_PASS_THROUGH_DIRECT

    Version : UInt32

    Length : UInt16

    Flags : Int8

    PortNumber : Int8

    MpioPathId : Int64

}
