#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DIAGNOSTIC_REPORT_PARAMETER.ahk
#Include .\DIAGNOSTIC_REPORT_SIGNATURE.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * This resource contains information about a diagnostic report.
 * @remarks
 * For general questions about Windows Error Reporting, see the [**WER APIS**](/windows/win32/api/_wer/).
  * For report keys, see the [**WER APIs**](/windows/win32/api/werapi/nf-werapi-werstoregetnextreportkey).
 * @see https://learn.microsoft.com/windows/win32/api/diagnosticdataquerytypes/ns-diagnosticdataquerytypes-diagnostic_report_data
 * @namespace Windows.Win32.Security.DiagnosticDataQuery
 * @version v4.0.30319
 */
class DIAGNOSTIC_REPORT_DATA extends Win32Struct
{
    static sizeof => 344

    static packingSize => 8

    /**
     * Type: **[DIAGNOSTIC_DATA_REPORT_SIGNATURE](/windows/win32/api/diagnosticdataquerytypes/ns-diagnosticdataquerytypes-diagnostic_report_data)**
     * The signature for this report.
     * @type {DIAGNOSTIC_REPORT_SIGNATURE}
     */
    signature{
        get {
            if(!this.HasProp("__signature"))
                this.__signature := DIAGNOSTIC_REPORT_SIGNATURE(this.ptr + 0)
            return this.__signature
        }
    }

    /**
     * Type: **[GUID](../guiddef/ns-guiddef-guid.md)**
     * A hash of the signature. Can be used to cross reference with other crash reports with the same signature (currently not implemented).
     * @type {Pointer<Guid>}
     */
    bucketId {
        get => NumGet(this, 216, "ptr")
        set => NumPut("ptr", value, this, 216)
    }

    /**
     * Type: **[GUID](../guiddef/ns-guiddef-guid.md)**
     * A locally unique identifier for the report.
     * @type {Pointer<Guid>}
     */
    reportId {
        get => NumGet(this, 224, "ptr")
        set => NumPut("ptr", value, this, 224)
    }

    /**
     * Type: **[FILETIME](../minwinbase/ns-minwinbase-filetime.md)**
     * A UTC time stamp of when the report was created.
     * @type {FILETIME}
     */
    creationTime{
        get {
            if(!this.HasProp("__creationTime"))
                this.__creationTime := FILETIME(this.ptr + 232)
            return this.__creationTime
        }
    }

    /**
     * Type: **[ULONGLONG](/windows/win32/winprog/windows-data-types)**
     * The size (on disk) of the individual report and its constituent files. This value only counts files directly contained in a report.
     * @type {Integer}
     */
    sizeInBytes {
        get => NumGet(this, 240, "uint")
        set => NumPut("uint", value, this, 240)
    }

    /**
     * Type: **[LPWSTR](/windows/win32/winprog/windows-data-types)**
     * The ID for the cab.
     * @type {Pointer<Ptr>}
     */
    cabId {
        get => NumGet(this, 248, "ptr")
        set => NumPut("ptr", value, this, 248)
    }

    /**
     * Type: **[DWORD](/windows/win32/winprog/windows-data-types)**
     * The detailed status of the report. Use the ReportStatus decoder to track this bit-field.
     * @type {Integer}
     */
    reportStatus {
        get => NumGet(this, 256, "uint")
        set => NumPut("uint", value, this, 256)
    }

    /**
     * Type: **[GUID](../guiddef/ns-guiddef-guid.md)**
     * The integrator ID of the report.
     * @type {Pointer<Guid>}
     */
    reportIntegratorId {
        get => NumGet(this, 264, "ptr")
        set => NumPut("ptr", value, this, 264)
    }

    /**
     * Type: **[LPWSTR\*](/windows/win32/winprog/windows-data-types)**
     * A pointer to hold the names of the files included in the report.
     * @type {Pointer<Ptr>}
     */
    fileNames {
        get => NumGet(this, 272, "ptr")
        set => NumPut("ptr", value, this, 272)
    }

    /**
     * Type: **[DWORD](/windows/win32/winprog/windows-data-types)**
     * The number of data files included in the report.
     * @type {Integer}
     */
    fileCount {
        get => NumGet(this, 280, "uint")
        set => NumPut("uint", value, this, 280)
    }

    /**
     * Type: **[LPWSTR](/windows/win32/winprog/windows-data-types)**
     * The display name of the application event.
     * @type {Pointer<Ptr>}
     */
    friendlyEventName {
        get => NumGet(this, 288, "ptr")
        set => NumPut("ptr", value, this, 288)
    }

    /**
     * Type: **[LPWSTR](/windows/win32/winprog/windows-data-types)**
     * The name of the application.
     * @type {Pointer<Ptr>}
     */
    applicationName {
        get => NumGet(this, 296, "ptr")
        set => NumPut("ptr", value, this, 296)
    }

    /**
     * Type: **[LPWSTR](/windows/win32/winprog/windows-data-types)**
     * The file path of the application.
     * @type {Pointer<Ptr>}
     */
    applicationPath {
        get => NumGet(this, 304, "ptr")
        set => NumPut("ptr", value, this, 304)
    }

    /**
     * Type: **[LPWSTR](/windows/win32/winprog/windows-data-types)**
     * The description of the problem.
     * @type {Pointer<Ptr>}
     */
    description {
        get => NumGet(this, 312, "ptr")
        set => NumPut("ptr", value, this, 312)
    }

    /**
     * Type: **[LPWSTR](/windows/win32/winprog/windows-data-types)**
     * The bucket ID as a string (possibly truncated).
     * @type {Pointer<Ptr>}
     */
    bucketIdString {
        get => NumGet(this, 320, "ptr")
        set => NumPut("ptr", value, this, 320)
    }

    /**
     * Type: **[UINT64](/windows/win32/winprog/windows-data-types)**
     * The legacy bucket ID.
     * @type {Integer}
     */
    legacyBucketId {
        get => NumGet(this, 328, "uint")
        set => NumPut("uint", value, this, 328)
    }

    /**
     * Type: **[LPWSTR](/windows/win32/winprog/windows-data-types)**
     * The report key.
     * @type {Pointer<Ptr>}
     */
    reportKey {
        get => NumGet(this, 336, "ptr")
        set => NumPut("ptr", value, this, 336)
    }
}
