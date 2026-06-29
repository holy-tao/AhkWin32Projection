#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
export default struct SCSI_BUS_DATA {
    #StructPack 4

    NumberOfLogicalUnits : Int8

    InitiatorBusId : Int8

    InquiryDataOffset : UInt32

}
