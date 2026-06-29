#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 * @architecture X64, Arm64
 */
export default struct ATA_PASS_THROUGH_EX32 {
    #StructPack 4

    Length : UInt16

    AtaFlags : UInt16

    PathId : Int8

    TargetId : Int8

    Lun : Int8

    ReservedAsUchar : Int8

    DataTransferLength : UInt32

    TimeOutValue : UInt32

    ReservedAsUlong : UInt32

    DataBufferOffset : UInt32

    PreviousTaskFile : Int8[8]

    CurrentTaskFile : Int8[8]

}
