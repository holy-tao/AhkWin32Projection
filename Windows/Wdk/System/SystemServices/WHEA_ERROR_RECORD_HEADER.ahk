#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHEA_ERROR_SEVERITY.ahk" { WHEA_ERROR_SEVERITY }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_ERROR_RECORD_HEADER {
    #StructPack 8

    Signature : UInt32

    Revision : IntPtr

    SignatureEnd : UInt32

    SectionCount : UInt16

    Severity : WHEA_ERROR_SEVERITY

    ValidBits : IntPtr

    Length : UInt32

    Timestamp : IntPtr

    PlatformId : Guid

    PartitionId : Guid

    CreatorId : Guid

    NotifyType : Guid

    RecordId : Int64

    Flags : IntPtr

    PersistenceInfo : IntPtr

    OsBuildNumber : UInt32

    Reserved2 : Int8[8]

    static __New() {
        DefineProp(this.Prototype, 'Reserved', { type: Int8[12], offset: 144 })
        this.DeleteProp("__New")
    }
}
