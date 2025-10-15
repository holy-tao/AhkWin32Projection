#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\Foundation\HWND.ahk

/**
 * Contains information used by the WerReportCreate function.
 * @see https://docs.microsoft.com/windows/win32/api//werapi/ns-werapi-wer_report_information
 * @namespace Windows.Win32.System.ErrorReporting
 * @version v4.0.30319
 */
class WER_REPORT_INFORMATION extends Win32Struct
{
    static sizeof => 2208

    static packingSize => 8

    /**
     * The size of this structure, in bytes.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A handle to the process for which the report is being generated. If this member is <b>NULL</b>, this is the calling process.
     * @type {HANDLE}
     */
    hProcess{
        get {
            if(!this.HasProp("__hProcess"))
                this.__hProcess := HANDLE(this.ptr + 8)
            return this.__hProcess
        }
    }

    /**
     * The name used to look up consent settings. If this member is empty, the default is the name specified by the <i>pwzEventType</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-werreportcreate">WerReportCreate</a>.
     * @type {String}
     */
    wzConsentKey {
        get => StrGet(this.ptr + 16, 63, "UTF-16")
        set => StrPut(value, this.ptr + 16, 63, "UTF-16")
    }

    /**
     * The display name. If this member is empty, the default is the name specified by <i>pwzEventType</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-werreportcreate">WerReportCreate</a>.
     * @type {String}
     */
    wzFriendlyEventName {
        get => StrGet(this.ptr + 144, 127, "UTF-16")
        set => StrPut(value, this.ptr + 144, 127, "UTF-16")
    }

    /**
     * The name of the application. If this parameter is empty, the default is the base name of the image file.
     * @type {String}
     */
    wzApplicationName {
        get => StrGet(this.ptr + 400, 127, "UTF-16")
        set => StrPut(value, this.ptr + 400, 127, "UTF-16")
    }

    /**
     * The full path to the application.
     * @type {String}
     */
    wzApplicationPath {
        get => StrGet(this.ptr + 656, 259, "UTF-16")
        set => StrPut(value, this.ptr + 656, 259, "UTF-16")
    }

    /**
     * A description of the problem. This description is displayed in <b>Problem Reports and Solutions</b> on Windows Vista or the problem reports pane of the <b>Action Center</b> on Windows 7.
     * @type {String}
     */
    wzDescription {
        get => StrGet(this.ptr + 1176, 511, "UTF-16")
        set => StrPut(value, this.ptr + 1176, 511, "UTF-16")
    }

    /**
     * A handle to the parent window.
     * @type {HWND}
     */
    hwndParent{
        get {
            if(!this.HasProp("__hwndParent"))
                this.__hwndParent := HWND(this.ptr + 2200)
            return this.__hwndParent
        }
    }
}
