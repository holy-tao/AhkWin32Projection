#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DIAGNOSTIC_REPORT_SIGNATURE.ahk
#Include .\DIAGNOSTIC_REPORT_PARAMETER.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * This resource contains information about a diagnostic report.
 * @remarks
 * For general questions about Windows Error Reporting, see the [**WER APIS**](/windows/win32/api/_wer/).
 * For report keys, see the [**WER APIs**](/windows/win32/api/werapi/nf-werapi-werstoregetnextreportkey).
 * @see https://learn.microsoft.com/windows/win32/api/diagnosticdataquerytypes/ns-diagnosticdataquerytypes-diagnostic_report_data
 * @namespace Windows.Win32.Security.DiagnosticDataQuery
 */
class DIAGNOSTIC_REPORT_DATA extends Win32Struct {
    static sizeof => 8040

    static packingSize => 8

    /**
     * Type: **[DIAGNOSTIC_DATA_REPORT_SIGNATURE](/windows/win32/api/diagnosticdataquerytypes/ns-diagnosticdataquerytypes-diagnostic_report_data)**
     * The signature for this report.
     * @type {DIAGNOSTIC_REPORT_SIGNATURE}
     */
    signature {
        get {
            if(!this.HasProp("__signature"))
                this.__signature := DIAGNOSTIC_REPORT_SIGNATURE(0, this)
            return this.__signature
        }
    }

    /**
     * Type: **[GUID](../guiddef/ns-guiddef-guid.md)**
     * A hash of the signature. Can be used to cross reference with other crash reports with the same signature (currently not implemented).
     * @type {Pointer}
     */
    bucketId {
        get => NumGet(this, 7912, "ptr")
        set => NumPut("ptr", value, this, 7912)
    }

    /**
     * Type: **[GUID](../guiddef/ns-guiddef-guid.md)**
     * A locally unique identifier for the report.
     * @type {Pointer}
     */
    reportId {
        get => NumGet(this, 7920, "ptr")
        set => NumPut("ptr", value, this, 7920)
    }

    /**
     * Type: **[FILETIME](../minwinbase/ns-minwinbase-filetime.md)**
     * A UTC time stamp of when the report was created.
     * @type {FILETIME}
     */
    creationTime {
        get {
            if(!this.HasProp("__creationTime"))
                this.__creationTime := FILETIME(7928, this)
            return this.__creationTime
        }
    }

    /**
     * Type: **[ULONGLONG](/windows/win32/winprog/windows-data-types)**
     * The size (on disk) of the individual report and its constituent files. This value only counts files directly contained in a report.
     * @type {Integer}
     */
    sizeInBytes {
        get => NumGet(this, 7936, "uint")
        set => NumPut("uint", value, this, 7936)
    }

    /**
     * Type: **[LPWSTR](/windows/win32/winprog/windows-data-types)**
     * The ID for the cab.
     * @type {PWSTR}
     */
    cabId {
        get => NumGet(this, 7944, "ptr")
        set => NumPut("ptr", value, this, 7944)
    }

    /**
     * Type: **[DWORD](/windows/win32/winprog/windows-data-types)**
     * The detailed status of the report. Use the ReportStatus decoder to track this bit-field.
     * @type {Integer}
     */
    reportStatus {
        get => NumGet(this, 7952, "uint")
        set => NumPut("uint", value, this, 7952)
    }

    /**
     * Type: **[GUID](../guiddef/ns-guiddef-guid.md)**
     * The integrator ID of the report.
     * @type {Pointer}
     */
    reportIntegratorId {
        get => NumGet(this, 7960, "ptr")
        set => NumPut("ptr", value, this, 7960)
    }

    /**
     * Type: **[LPWSTR\*](/windows/win32/winprog/windows-data-types)**
     * A pointer to hold the names of the files included in the report.
     * @type {Pointer<PWSTR>}
     */
    fileNames {
        get => NumGet(this, 7968, "ptr")
        set => NumPut("ptr", value, this, 7968)
    }

    /**
     * Type: **[DWORD](/windows/win32/winprog/windows-data-types)**
     * The number of data files included in the report.
     * @type {Integer}
     */
    fileCount {
        get => NumGet(this, 7976, "uint")
        set => NumPut("uint", value, this, 7976)
    }

    /**
     * Type: **[LPWSTR](/windows/win32/winprog/windows-data-types)**
     * The display name of the application event.
     * @type {PWSTR}
     */
    friendlyEventName {
        get => NumGet(this, 7984, "ptr")
        set => NumPut("ptr", value, this, 7984)
    }

    /**
     * Type: **[LPWSTR](/windows/win32/winprog/windows-data-types)**
     * The name of the application.
     * @type {PWSTR}
     */
    applicationName {
        get => NumGet(this, 7992, "ptr")
        set => NumPut("ptr", value, this, 7992)
    }

    /**
     * Type: **[LPWSTR](/windows/win32/winprog/windows-data-types)**
     * The file path of the application.
     * @type {PWSTR}
     */
    applicationPath {
        get => NumGet(this, 8000, "ptr")
        set => NumPut("ptr", value, this, 8000)
    }

    /**
     * Type: **[LPWSTR](/windows/win32/winprog/windows-data-types)**
     * The description of the problem.
     * @type {PWSTR}
     */
    description {
        get => NumGet(this, 8008, "ptr")
        set => NumPut("ptr", value, this, 8008)
    }

    /**
     * Type: **[LPWSTR](/windows/win32/winprog/windows-data-types)**
     * The bucket ID as a string (possibly truncated).
     * @type {PWSTR}
     */
    bucketIdString {
        get => NumGet(this, 8016, "ptr")
        set => NumPut("ptr", value, this, 8016)
    }

    /**
     * Type: **[UINT64](/windows/win32/winprog/windows-data-types)**
     * The legacy bucket ID.
     * @type {Integer}
     */
    legacyBucketId {
        get => NumGet(this, 8024, "uint")
        set => NumPut("uint", value, this, 8024)
    }

    /**
     * Type: **[LPWSTR](/windows/win32/winprog/windows-data-types)**
     * The report key.
     * @type {PWSTR}
     */
    reportKey {
        get => NumGet(this, 8032, "ptr")
        set => NumPut("ptr", value, this, 8032)
    }
}
