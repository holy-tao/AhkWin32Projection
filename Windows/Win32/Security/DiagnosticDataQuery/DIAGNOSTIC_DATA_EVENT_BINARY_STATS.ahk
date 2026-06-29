#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * A resource that describes this binary and the amount of diagnostic data it has sent.
 * @see https://learn.microsoft.com/windows/win32/api/diagnosticdataquerytypes/ns-diagnosticdataquerytypes-diagnostic_data_event_binary_stats
 * @namespace Windows.Win32.Security.DiagnosticDataQuery
 */
export default struct DIAGNOSTIC_DATA_EVENT_BINARY_STATS {
    #StructPack 8

    /**
     * Type: **[LPWSTR](/windows/desktop/winprog/windows-data-types)**
     * The full name of the module or binary.
     */
    moduleName : PWSTR

    /**
     * Type: **[LPWSTR](/windows/desktop/winprog/windows-data-types)**
     * The friendly name of the module or binary.
     */
    friendlyModuleName : PWSTR

    /**
     * Type: **[UINT32](/windows/desktop/winprog/windows-data-types)**
     * The number of events sent by this module or binary.
     */
    eventCount : UInt32

    /**
     * Type: **[UINT64](/windows/desktop/winprog/windows-data-types)**
     * The number of bytes sent by this module or binary.
     */
    uploadSizeBytes : Int64

}
