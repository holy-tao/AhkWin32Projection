#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * A resource that represents a producer. A Producer is an OS component, application or service that emits events. For example, “Microsoft Edge” is the Producer ID for the Microsoft Edge browser.
 * @see https://learn.microsoft.com/windows/win32/api/diagnosticdataquerytypes/ns-diagnosticdataquerytypes-diagnostic_data_event_producer_description
 * @namespace Windows.Win32.Security.DiagnosticDataQuery
 */
export default struct DIAGNOSTIC_DATA_EVENT_PRODUCER_DESCRIPTION {
    #StructPack 8

    /**
     * Type: **[LPWSTR](/windows/desktop/winprog/windows-data-types)**
     * The name of this producer.
     */
    name : PWSTR

}
