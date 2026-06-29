#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 * @architecture X64, Arm64
 */
export default struct SCSI_PASS_THROUGH_DIRECT32_EX {
    #StructPack 8

    Version : UInt32

    Length : UInt32

    CdbLength : UInt32

    StorAddressLength : UInt32

    ScsiStatus : Int8

    SenseInfoLength : Int8

    DataDirection : Int8

    Reserved : Int8

    TimeOutValue : UInt32

    StorAddressOffset : UInt32

    SenseInfoOffset : UInt32

    DataOutTransferLength : UInt32

    DataInTransferLength : UInt32

    DataOutBuffer : IntPtr

    DataInBuffer : IntPtr

    Cdb : Int8[1]

}
