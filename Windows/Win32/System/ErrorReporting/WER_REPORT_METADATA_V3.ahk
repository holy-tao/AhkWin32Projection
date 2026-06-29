#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WER_REPORT_PARAMETER.ahk" { WER_REPORT_PARAMETER }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import ".\WER_REPORT_SIGNATURE.ahk" { WER_REPORT_SIGNATURE }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.ErrorReporting
 */
export default struct WER_REPORT_METADATA_V3 {
    #StructPack 8

    Signature : WER_REPORT_SIGNATURE

    BucketId : Guid

    ReportId : Guid

    CreationTime : FILETIME

    SizeInBytes : Int64

    CabId : WCHAR[260]

    ReportStatus : UInt32

    ReportIntegratorId : Guid

    NumberOfFiles : UInt32

    SizeOfFileNames : UInt32

    FileNames : PWSTR

    FriendlyEventName : WCHAR[128]

    ApplicationName : WCHAR[128]

    ApplicationPath : WCHAR[260]

    Description : WCHAR[512]

    BucketIdString : WCHAR[260]

    LegacyBucketId : Int64

}
