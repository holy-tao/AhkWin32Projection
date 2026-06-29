#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_PERSISTENT_EVENT_LOG_EVENT_HEADER {
    #StructPack 8

    EventType : Int8

    EventTypeRevision : Int8

    EventHeaderLength : Int8

    Reserved0 : Int8

    ControllerIdentifier : UInt16

    EventTimestamp : Int64

    Reserved1 : Int8[6]

    VendorSpecificInformationLength : UInt16

    EventLength : UInt16

}
