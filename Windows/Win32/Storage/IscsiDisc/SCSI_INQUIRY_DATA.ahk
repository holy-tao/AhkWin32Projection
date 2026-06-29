#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
export default struct SCSI_INQUIRY_DATA {
    #StructPack 4

    PathId : Int8

    TargetId : Int8

    Lun : Int8

    DeviceClaimed : BOOLEAN

    InquiryDataLength : UInt32

    NextInquiryDataOffset : UInt32

    InquiryData : Int8[1]

}
