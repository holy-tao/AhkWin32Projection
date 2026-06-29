#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
export default struct SCSI_PASS_THROUGH {
    #StructPack 8

    Length : UInt16

    ScsiStatus : Int8

    PathId : Int8

    TargetId : Int8

    Lun : Int8

    CdbLength : Int8

    SenseInfoLength : Int8

    DataIn : Int8

    DataTransferLength : UInt32

    TimeOutValue : UInt32

    DataBufferOffset : IntPtr

    SenseInfoOffset : UInt32

    Cdb : Int8[16]

}
