#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DEVICE_INTERNAL_STATUS_DATA {
    #StructPack 8

    Version : UInt32

    Size : UInt32

    T10VendorId : Int64

    DataSet1Length : UInt32

    DataSet2Length : UInt32

    DataSet3Length : UInt32

    DataSet4Length : UInt32

    StatusDataVersion : Int8

    Reserved : Int8[3]

    ReasonIdentifier : Int8[128]

    StatusDataLength : UInt32

    StatusData : Int8[1]

}
