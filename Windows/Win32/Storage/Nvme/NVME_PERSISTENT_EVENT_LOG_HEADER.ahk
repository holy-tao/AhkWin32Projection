#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_PERSISTENT_EVENT_LOG_HEADER {
    #StructPack 8

    LogIdentifier : Int8

    Reserved0 : Int8[3]

    TotalNumberOfEvents : UInt32

    TotalLogLength : Int64

    LogRevision : Int8

    Reserved1 : Int8

    LogHeaderLength : UInt16

    Timestamp : Int64

    PowerOnHours : Int8[16]

    PowerCycleCount : Int64

    PciVendorId : UInt16

    PciSubsystemVendorId : UInt16

    SerialNumber : Int8[20]

    ModelNumber : Int8[40]

    NVMSubsystemNVMeQualifiedName : Int8[256]

    Reserved : Int8[108]

    SupportedEventsBitmap : Int8[32]

}
