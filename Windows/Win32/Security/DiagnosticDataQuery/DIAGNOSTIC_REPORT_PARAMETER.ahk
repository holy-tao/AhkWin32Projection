#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Resource that describes the parameters for an error report.
 * @remarks
 * 
  * For more information about parameters, see the [**WER APIs**](/windows/win32/api/werapi/nf-werapi-werreportsetparameter).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//diagnosticdataquerytypes/ns-diagnosticdataquerytypes-diagnostic_report_parameter
 * @namespace Windows.Win32.Security.DiagnosticDataQuery
 * @version v4.0.30319
 */
class DIAGNOSTIC_REPORT_PARAMETER extends Win32Struct
{
    static sizeof => 778

    static packingSize => 2

    /**
     * Type: **[WCHAR\[\]](/windows/desktop/winprog/windows-data-types)**
     * The name of this parameter.
     * @type {String}
     */
    name {
        get => StrGet(this.ptr + 0, 128, "UTF-16")
        set => StrPut(value, this.ptr + 0, 128, "UTF-16")
    }

    /**
     * Type: **[WCHAR\[\]](/windows/desktop/winprog/windows-data-types)**
     * The value of this parameter.
     * @type {String}
     */
    value {
        get => StrGet(this.ptr + 258, 259, "UTF-16")
        set => StrPut(value, this.ptr + 258, 259, "UTF-16")
    }
}
