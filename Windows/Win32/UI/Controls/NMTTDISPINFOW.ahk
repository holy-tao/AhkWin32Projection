#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\NMHDR.ahk
#Include ..\..\Foundation\HINSTANCE.ahk

/**
 * Contains information used in handling the TTN_GETDISPINFO notification code. This structure supersedes the TOOLTIPTEXT structure. (Unicode)
 * @remarks
 * You need to point the <b>lpszText</b> array to your own private buffer when the text used in the tooltip exceeds 80 <b>TCHAR</b>s in length. The system automatically strips the ampersand (&amp;) accelerator <b>TCHAR</b><b>s</b> from all strings passed to a tooltip control, unless the control has the <a href="https://docs.microsoft.com/windows/desktop/Controls/tooltip-styles">TTS_NOPREFIX</a> style.
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The commctrl.h header defines NMTTDISPINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmttdispinfow
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 * @charset Unicode
 */
class NMTTDISPINFOW extends Win32Struct
{
    static sizeof => 216

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains additional information about the notification.
     * @type {NMHDR}
     */
    hdr{
        get {
            if(!this.HasProp("__hdr"))
                this.__hdr := NMHDR(0, this)
            return this.__hdr
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPTSTR</a></b>
     * 
     * Pointer to a null-terminated string that will be displayed as the tooltip text. If <b>hinst</b> specifies an instance handle, this member must be the identifier of a string resource.
     * @type {PWSTR}
     */
    lpszText {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">TCHAR</a></b>
     * 
     * Buffer that receives the tooltip text. An application can copy the text to this buffer instead of specifying a string address or string resource. For tooltip text that exceeds 80 <b>TCHAR</b><b>s</b>, see comments in the remarks section of this document.
     * @type {String}
     */
    szText {
        get => StrGet(this.ptr + 32, 79, "UTF-16")
        set => StrPut(value, this.ptr + 32, 79, "UTF-16")
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HINSTANCE</a></b>
     * 
     * Handle to the instance that contains a string resource to be used as the tooltip text. If <b>lpszText</b> is the address of the tooltip text string, this member must be <b>NULL</b>.
     * @type {HINSTANCE}
     */
    hinst{
        get {
            if(!this.HasProp("__hinst"))
                this.__hinst := HINSTANCE(192, this)
            return this.__hinst
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Flags that indicates how to interpret the <b>idFrom</b> member of the included <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TTF_IDISHWND"></a><a id="ttf_idishwnd"></a><dl>
     * <dt><b>TTF_IDISHWND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, <b>idFrom</b> is the tool's handle. Otherwise, it is the tool's identifier. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TTF_RTLREADING"></a><a id="ttf_rtlreading"></a><dl>
     * <dt><b>TTF_RTLREADING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows can be 
     * 						<i>mirrored</i> to display languages such as Hebrew or Arabic that read right-to-left (RTL). Normally, tooltip text is read in same direction as the text in its parent window. To have a tooltip read in the opposite direction from its parent window, add the TTF_RTLREADING flag to the 
     * 						<b>uFlags</b> member when processing the notification. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TTF_DI_SETITEM"></a><a id="ttf_di_setitem"></a><dl>
     * <dt><b>TTF_DI_SETITEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 4.70</a>. If you add this flag to <b>uFlags</b> while processing the notification, the tooltip control will retain the supplied information and not request it again. 
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    uFlags {
        get => NumGet(this, 200, "uint")
        set => NumPut("uint", value, this, 200)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPARAM</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 4.70</a>. Application-defined data associated with the tool.
     * @type {LPARAM}
     */
    lParam {
        get => NumGet(this, 208, "ptr")
        set => NumPut("ptr", value, this, 208)
    }
}
