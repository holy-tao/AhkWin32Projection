#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct RUNTIME_REPORT_PACKAGE_HEADER {
    #StructPack 8

    Magic : UInt32

    PackageVersion : UInt16

    NumberOfReports : UInt16

    ReportTypesBitmap : Int64

    PackageSize : UInt32

    ReportDigestType : UInt16

    TotalReportDigestsSize : UInt16

    Reserved : UInt16

    SignatureScheme : UInt16

    SignatureSize : UInt32

    TotalAuthenticatedReportsSize : UInt32

}
