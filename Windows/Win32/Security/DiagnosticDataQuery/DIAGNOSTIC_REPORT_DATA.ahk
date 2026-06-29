#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DIAGNOSTIC_REPORT_PARAMETER.ahk" { DIAGNOSTIC_REPORT_PARAMETER }
#Import ".\DIAGNOSTIC_REPORT_SIGNATURE.ahk" { DIAGNOSTIC_REPORT_SIGNATURE }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * This resource contains information about a diagnostic report.
 * @remarks
 * For general questions about Windows Error Reporting, see the [**WER APIS**](/windows/win32/api/_wer/).
 * For report keys, see the [**WER APIs**](/windows/win32/api/werapi/nf-werapi-werstoregetnextreportkey).
 * @see https://learn.microsoft.com/windows/win32/api/diagnosticdataquerytypes/ns-diagnosticdataquerytypes-diagnostic_report_data
 * @namespace Windows.Win32.Security.DiagnosticDataQuery
 */
export default struct DIAGNOSTIC_REPORT_DATA {
    #StructPack 8

    /**
     * Type: **[DIAGNOSTIC_DATA_REPORT_SIGNATURE](/windows/win32/api/diagnosticdataquerytypes/ns-diagnosticdataquerytypes-diagnostic_report_data)**
     * The signature for this report.
     */
    signature : DIAGNOSTIC_REPORT_SIGNATURE

    /**
     * Type: **[GUID](../guiddef/ns-guiddef-guid.md)**
     * A hash of the signature. Can be used to cross reference with other crash reports with the same signature (currently not implemented).
     */
    bucketId : Guid

    /**
     * Type: **[GUID](../guiddef/ns-guiddef-guid.md)**
     * A locally unique identifier for the report.
     */
    reportId : Guid

    /**
     * Type: **[FILETIME](../minwinbase/ns-minwinbase-filetime.md)**
     * A UTC time stamp of when the report was created.
     */
    creationTime : FILETIME

    /**
     * Type: **[ULONGLONG](/windows/win32/winprog/windows-data-types)**
     * The size (on disk) of the individual report and its constituent files. This value only counts files directly contained in a report.
     */
    sizeInBytes : Int64

    /**
     * Type: **[LPWSTR](/windows/win32/winprog/windows-data-types)**
     * The ID for the cab.
     */
    cabId : PWSTR

    /**
     * Type: **[DWORD](/windows/win32/winprog/windows-data-types)**
     * The detailed status of the report. Use the ReportStatus decoder to track this bit-field.
     */
    reportStatus : UInt32

    /**
     * Type: **[GUID](../guiddef/ns-guiddef-guid.md)**
     * The integrator ID of the report.
     */
    reportIntegratorId : Guid

    /**
     * Type: **[LPWSTR\*](/windows/win32/winprog/windows-data-types)**
     * A pointer to hold the names of the files included in the report.
     */
    fileNames : PWSTR.Ptr

    /**
     * Type: **[DWORD](/windows/win32/winprog/windows-data-types)**
     * The number of data files included in the report.
     */
    fileCount : UInt32

    /**
     * Type: **[LPWSTR](/windows/win32/winprog/windows-data-types)**
     * The display name of the application event.
     */
    friendlyEventName : PWSTR

    /**
     * Type: **[LPWSTR](/windows/win32/winprog/windows-data-types)**
     * The name of the application.
     */
    applicationName : PWSTR

    /**
     * Type: **[LPWSTR](/windows/win32/winprog/windows-data-types)**
     * The file path of the application.
     */
    applicationPath : PWSTR

    /**
     * Type: **[LPWSTR](/windows/win32/winprog/windows-data-types)**
     * The description of the problem.
     */
    description : PWSTR

    /**
     * Type: **[LPWSTR](/windows/win32/winprog/windows-data-types)**
     * The bucket ID as a string (possibly truncated).
     */
    bucketIdString : PWSTR

    /**
     * Type: **[UINT64](/windows/win32/winprog/windows-data-types)**
     * The legacy bucket ID.
     */
    legacyBucketId : Int64

    /**
     * Type: **[LPWSTR](/windows/win32/winprog/windows-data-types)**
     * The report key.
     */
    reportKey : PWSTR

}
