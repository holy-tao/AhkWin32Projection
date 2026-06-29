#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WER_REPORT_PARAMETER.ahk" { WER_REPORT_PARAMETER }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.ErrorReporting
 */
export default struct WER_REPORT_SIGNATURE {
    #StructPack 2

    EventName : WCHAR[65]

    Parameters : WER_REPORT_PARAMETER[10]

}
