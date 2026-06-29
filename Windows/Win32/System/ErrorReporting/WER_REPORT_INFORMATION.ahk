#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains information used by the WerReportCreate function.
 * @see https://learn.microsoft.com/windows/win32/api/werapi/ns-werapi-wer_report_information
 * @namespace Windows.Win32.System.ErrorReporting
 */
export default struct WER_REPORT_INFORMATION {
    #StructPack 8

    /**
     * The size of this structure, in bytes.
     */
    dwSize : UInt32

    /**
     * A handle to the process for which the report is being generated. If this member is <b>NULL</b>, this is the calling process.
     */
    hProcess : HANDLE

    /**
     * The name used to look up consent settings. If this member is empty, the default is the name specified by the <i>pwzEventType</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-werreportcreate">WerReportCreate</a>.
     */
    wzConsentKey : WCHAR[64]

    /**
     * The display name. If this member is empty, the default is the name specified by <i>pwzEventType</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-werreportcreate">WerReportCreate</a>.
     */
    wzFriendlyEventName : WCHAR[128]

    /**
     * The name of the application. If this parameter is empty, the default is the base name of the image file.
     */
    wzApplicationName : WCHAR[128]

    /**
     * The full path to the application.
     */
    wzApplicationPath : WCHAR[260]

    /**
     * A description of the problem. This description is displayed in <b>Problem Reports and Solutions</b> on Windows Vista or the problem reports pane of the <b>Action Center</b> on Windows 7.
     */
    wzDescription : WCHAR[512]

    /**
     * A handle to the parent window.
     */
    hwndParent : HWND

}
