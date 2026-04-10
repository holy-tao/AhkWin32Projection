#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DIAGNOSTIC_REPORT_PARAMETER.ahk

/**
 * This resource describes the signature for a diagnostic report.
 * @see https://learn.microsoft.com/windows/win32/api/diagnosticdataquerytypes/ns-diagnosticdataquerytypes-diagnostic_report_signature
 * @namespace Windows.Win32.Security.DiagnosticDataQuery
 */
class DIAGNOSTIC_REPORT_SIGNATURE extends Win32Struct {
    static sizeof => 7910

    static packingSize => 2

    /**
     * Type: **[WCHAR\[\]](/windows/desktop/winprog/windows-data-types)**
     * A string that specifies the name of this application event.
     * @type {String}
     */
    eventName {
        get => StrGet(this.ptr + 0, 64, "UTF-16")
        set => StrPut(value, this.ptr + 0, 64, "UTF-16")
    }

    /**
     * Type: **[DIAGNOSTIC_DATA_REPORT_PARAMETER\[\]](/windows/win32/api/diagnosticdataquerytypes/ns-diagnosticdataquerytypes-diagnostic_report_parameter)**
     * A list of parameters for this report.
     * @type {DIAGNOSTIC_REPORT_PARAMETER}
     */
    parameters {
        get {
            if(!this.HasProp("__parametersProxyArray"))
                this.__parametersProxyArray := Win32FixedArray(this.ptr + 130, 10, DIAGNOSTIC_REPORT_PARAMETER, "")
            return this.__parametersProxyArray
        }
    }
}
