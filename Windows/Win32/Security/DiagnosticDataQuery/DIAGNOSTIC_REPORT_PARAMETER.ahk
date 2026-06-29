#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Resource that describes the parameters for an error report.
 * @remarks
 * For more information about parameters, see the [**WER APIs**](/windows/win32/api/werapi/nf-werapi-werreportsetparameter).
 * @see https://learn.microsoft.com/windows/win32/api/diagnosticdataquerytypes/ns-diagnosticdataquerytypes-diagnostic_report_parameter
 * @namespace Windows.Win32.Security.DiagnosticDataQuery
 */
export default struct DIAGNOSTIC_REPORT_PARAMETER {
    #StructPack 2

    /**
     * Type: **[WCHAR\[\]](/windows/desktop/winprog/windows-data-types)**
     * The name of this parameter.
     */
    name : WCHAR[129]

    /**
     * Type: **[WCHAR\[\]](/windows/desktop/winprog/windows-data-types)**
     * The value of this parameter.
     */
    value : WCHAR[260]

}
