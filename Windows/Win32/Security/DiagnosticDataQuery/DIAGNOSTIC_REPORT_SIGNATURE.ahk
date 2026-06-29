#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DIAGNOSTIC_REPORT_PARAMETER.ahk" { DIAGNOSTIC_REPORT_PARAMETER }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * This resource describes the signature for a diagnostic report.
 * @see https://learn.microsoft.com/windows/win32/api/diagnosticdataquerytypes/ns-diagnosticdataquerytypes-diagnostic_report_signature
 * @namespace Windows.Win32.Security.DiagnosticDataQuery
 */
export default struct DIAGNOSTIC_REPORT_SIGNATURE {
    #StructPack 2

    /**
     * Type: **[WCHAR\[\]](/windows/desktop/winprog/windows-data-types)**
     * A string that specifies the name of this application event.
     */
    eventName : WCHAR[65]

    /**
     * Type: **[DIAGNOSTIC_DATA_REPORT_PARAMETER\[\]](/windows/win32/api/diagnosticdataquerytypes/ns-diagnosticdataquerytypes-diagnostic_report_parameter)**
     * A list of parameters for this report.
     */
    parameters : DIAGNOSTIC_REPORT_PARAMETER[10]

}
