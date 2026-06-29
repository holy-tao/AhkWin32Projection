#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TASKDIALOG_BUTTON.ahk" { TASKDIALOG_BUTTON }
#Import "..\WindowsAndMessaging\HICON.ahk" { HICON }
#Import ".\TASKDIALOG_FLAGS.ahk" { TASKDIALOG_FLAGS }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\TASKDIALOG_COMMON_BUTTON_FLAGS.ahk" { TASKDIALOG_COMMON_BUTTON_FLAGS }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HINSTANCE.ahk" { HINSTANCE }

/**
 * The TASKDIALOGCONFIG structure contains information used to display a task dialog. The TaskDialogIndirect function uses this structure.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-taskdialogconfig
 * @namespace Windows.Win32.UI.Controls
 */
export default struct TASKDIALOGCONFIG {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Specifies the structure size, in bytes.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * Handle to the parent window. This member can be <b>NULL</b>.
     */
    hwndParent : HWND

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HINSTANCE</a></b>
     * 
     * Handle to the module that contains the icon resource identified by the <b>pszMainIcon</b> or <b>pszFooterIcon</b> members, and the string resources identified by the <b>pszWindowTitle</b>, <b>pszMainInstruction</b>, <b>pszContent</b>, <b>pszVerificationText</b>, <b>pszExpandedInformation</b>, <b>pszExpandedControlText</b>, <b>pszCollapsedControlText</b> or <b>pszFooter</b> members.
     */
    hInstance : HINSTANCE

    /**
     * Type: <b>TASKDIALOG_FLAGS</b>
     * 
     * Specifies the behavior of the task dialog. This parameter can be a combination of flags from the following group:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TDF_ENABLE_HYPERLINKS"></a><a id="tdf_enable_hyperlinks"></a><dl>
     * <dt><b>TDF_ENABLE_HYPERLINKS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enables hyperlink processing for the strings specified in the <b>pszContent</b>, <b>pszExpandedInformation</b> and <b>pszFooter</b> members. When enabled, these members may point to strings that contain hyperlinks in the following form:
     * 
     * 
     * 
     * ```
     * <A HREF="executablestring">Hyperlink Text</A>
     * ```
     * 
     * 
     * <b>Warning: Enabling hyperlinks when using content from an unsafe source may cause security vulnerabilities.</b>
     * 
     * <div class="alert"><b>Note</b>  Task Dialogs will not actually execute any hyperlinks. Hyperlink execution must be handled in the callback function specified by <b>pfCallback</b>. For more details, see <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nc-commctrl-pftaskdialogcallback">TaskDialogCallbackProc</a>.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TDF_USE_HICON_MAIN"></a><a id="tdf_use_hicon_main"></a><dl>
     * <dt><b>TDF_USE_HICON_MAIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the dialog should use the icon referenced by the handle in the <b>hMainIcon</b> member as the primary icon in the task dialog. If this flag is specified, the <b>pszMainIcon</b> member is ignored.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TDF_USE_HICON_FOOTER"></a><a id="tdf_use_hicon_footer"></a><dl>
     * <dt><b>TDF_USE_HICON_FOOTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the dialog should use the icon referenced by the handle in the <b>hFooterIcon</b> member as the footer icon in the task dialog.  If this flag is specified, the <b>pszFooterIcon</b> member is ignored.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TDF_ALLOW_DIALOG_CANCELLATION"></a><a id="tdf_allow_dialog_cancellation"></a><dl>
     * <dt><b>TDF_ALLOW_DIALOG_CANCELLATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the dialog should be able to be closed using Alt-F4, Escape, and the title bar's close button even if no cancel button is specified in either the <b>dwCommonButtons</b> or <b>pButtons</b> members.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TDF_USE_COMMAND_LINKS"></a><a id="tdf_use_command_links"></a><dl>
     * <dt><b>TDF_USE_COMMAND_LINKS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the buttons specified in the <b>pButtons</b> member are to be displayed as command links (using a standard task dialog glyph) instead of push buttons.  When using command links, all characters up to the first new line character in the <b>pszButtonText</b>  member will be treated as the command link's main text, and the remainder will be treated as the command link's note.  This flag is ignored if the <b>cButtons</b> member is zero.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TDF_USE_COMMAND_LINKS_NO_ICON"></a><a id="tdf_use_command_links_no_icon"></a><dl>
     * <dt><b>TDF_USE_COMMAND_LINKS_NO_ICON</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the buttons specified in the <b>pButtons</b> member are to be displayed as command links (without a glyph) instead of push buttons.  When using command links, all characters up to the first new line character in the <b>pszButtonText</b> member will be treated as the command link's main text, and the remainder will be treated as the command link's note.  This flag is ignored if the <b>cButtons</b> member is zero.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TDF_EXPAND_FOOTER_AREA"></a><a id="tdf_expand_footer_area"></a><dl>
     * <dt><b>TDF_EXPAND_FOOTER_AREA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the string specified by the <b>pszExpandedInformation</b> member is displayed at the bottom of the dialog's footer area instead of immediately after the dialog's content. This flag is ignored if the <b>pszExpandedInformation</b> member is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TDF_EXPANDED_BY_DEFAULT"></a><a id="tdf_expanded_by_default"></a><dl>
     * <dt><b>TDF_EXPANDED_BY_DEFAULT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the string specified by the <b>pszExpandedInformation</b> member is displayed when the dialog is initially displayed.  This flag is ignored if the <b>pszExpandedInformation</b> member is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TDF_VERIFICATION_FLAG_CHECKED"></a><a id="tdf_verification_flag_checked"></a><dl>
     * <dt><b>TDF_VERIFICATION_FLAG_CHECKED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the verification checkbox in the dialog is checked when the dialog is initially displayed.  This flag is ignored if the <b>pszVerificationText</b> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TDF_SHOW_PROGRESS_BAR"></a><a id="tdf_show_progress_bar"></a><dl>
     * <dt><b>TDF_SHOW_PROGRESS_BAR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that a Progress Bar is to be displayed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TDF_SHOW_MARQUEE_PROGRESS_BAR"></a><a id="tdf_show_marquee_progress_bar"></a><dl>
     * <dt><b>TDF_SHOW_MARQUEE_PROGRESS_BAR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that an Marquee Progress Bar is to be displayed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TDF_CALLBACK_TIMER"></a><a id="tdf_callback_timer"></a><dl>
     * <dt><b>TDF_CALLBACK_TIMER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the task dialog's callback is to be called approximately every 200 milliseconds.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TDF_POSITION_RELATIVE_TO_WINDOW"></a><a id="tdf_position_relative_to_window"></a><dl>
     * <dt><b>TDF_POSITION_RELATIVE_TO_WINDOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the task dialog is positioned (centered) relative to the window specified by <b>hwndParent</b>. If the flag is not supplied (or no <b>hwndParent</b> member is specified), the task dialog is positioned (centered) relative to the monitor.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TDF_RTL_LAYOUT"></a><a id="tdf_rtl_layout"></a><dl>
     * <dt><b>TDF_RTL_LAYOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that text is displayed reading right to left.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TDF_NO_DEFAULT_RADIO_BUTTON"></a><a id="tdf_no_default_radio_button"></a><dl>
     * <dt><b>TDF_NO_DEFAULT_RADIO_BUTTON</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that no default item will be selected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TDF_CAN_BE_MINIMIZED"></a><a id="tdf_can_be_minimized"></a><dl>
     * <dt><b>TDF_CAN_BE_MINIMIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the task dialog can be minimized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TDIF_SIZE_TO_CONTENT"></a><a id="tdif_size_to_content"></a><dl>
     * <dt><b>TDIF_SIZE_TO_CONTENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This flag is deprecated. Use <b>TDF_SIZE_TO_CONTENT</b> instead.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TDF_SIZE_TO_CONTENT"></a><a id="tdf_size_to_content"></a><dl>
     * <dt><b>TDF_SIZE_TO_CONTENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the width of the task dialog is determined by the width of its content area. This flag is ignored if <b>cxWidth</b> is not set to 0.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwFlags : TASKDIALOG_FLAGS

    /**
     * Type: <b>TASKDIALOG_COMMON_BUTTON_FLAGS</b>
     * 
     * Specifies the push buttons displayed in the task dialog. If no common buttons are specified and no custom buttons are specified using the <b>cButtons</b> and <b>pButtons</b> members, the task dialog will contain the <b>OK</b> button by default. This parameter may be a combination of flags from the following group:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TDCBF_OK_BUTTON"></a><a id="tdcbf_ok_button"></a><dl>
     * <dt><b>TDCBF_OK_BUTTON</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The task dialog contains the push button: <b>OK</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TDCBF_YES_BUTTON"></a><a id="tdcbf_yes_button"></a><dl>
     * <dt><b>TDCBF_YES_BUTTON</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The task dialog contains the push button: <b>Yes</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TDCBF_NO_BUTTON"></a><a id="tdcbf_no_button"></a><dl>
     * <dt><b>TDCBF_NO_BUTTON</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The task dialog contains the push button: <b>No</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TDCBF_CANCEL_BUTTON"></a><a id="tdcbf_cancel_button"></a><dl>
     * <dt><b>TDCBF_CANCEL_BUTTON</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The task dialog contains the push button: <b>Cancel</b>. If this button is specified, the task dialog will respond to typical cancel actions (Alt-F4 and Escape).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TDCBF_RETRY_BUTTON"></a><a id="tdcbf_retry_button"></a><dl>
     * <dt><b>TDCBF_RETRY_BUTTON</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The task dialog contains the push button: <b>Retry</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TDCBF_CLOSE_BUTTON"></a><a id="tdcbf_close_button"></a><dl>
     * <dt><b>TDCBF_CLOSE_BUTTON</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The task dialog contains the push button: <b>Close</b>.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwCommonButtons : TASKDIALOG_COMMON_BUTTON_FLAGS

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">PCWSTR</a></b>
     * 
     * Pointer that references the string to be used for the task dialog title.  This parameter can be either a null-terminated string or an integer resource identifier passed to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a> macro. If this parameter is <b>NULL</b>, the filename of the executable program is used.
     */
    pszWindowTitle : PWSTR

    hMainIcon : HICON

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">PCWSTR</a></b>
     * 
     * Pointer that references the string to be used for the main instruction. This parameter can be either a null-terminated string or an integer resource identifier passed to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a> macro.
     */
    pszMainInstruction : PWSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">PCWSTR</a></b>
     * 
     * Pointer that references the string to be used for the dialog's primary content. This parameter can be either a null-terminated string or an integer resource identifier passed to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a> macro. If the ENABLE_HYPERLINKS flag is specified for the <b>dwFlags</b> member, then this string may contain hyperlinks in the form: &lt;A HREF="executablestring"&gt;Hyperlink Text&lt;/A&gt;.  <b>WARNING: Enabling hyperlinks when using content from an unsafe source may cause security vulnerabilities.</b>
     */
    pszContent : PWSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of entries in the <b>pButtons</b> array that is used to create buttons or command links in the task dialog. If this member is zero and no common buttons have been specified using the <b>dwCommonButtons</b> member, then the task dialog will have a single <b>OK</b> button displayed.
     */
    cButtons : UInt32

    /**
     * Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-taskdialog_button">TASKDIALOG_BUTTON</a>*</b>
     * 
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-taskdialog_button">TASKDIALOG_BUTTON</a> structures containing the definition of the custom buttons that are to be displayed in the task dialog.  This array must contain at least the number of entries that are specified by the <b>cButtons</b> member.
     */
    pButtons : TASKDIALOG_BUTTON.Ptr

    /**
     * Type: <b>int</b>
     * 
     * The default button for the task dialog.  This may be any of the values specified in <b>nButtonID</b> members of one of the <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-taskdialog_button">TASKDIALOG_BUTTON</a> structures in the <b>pButtons</b> array, or one of the IDs corresponding to the buttons specified in the <b>dwCommonButtons</b> member:
     * 
     * <table class="clsStd">
     * <tr>
     * <td>IDCANCEL</td>
     * <td>Make the <b>Cancel</b> button the default.</td>
     * </tr>
     * <tr>
     * <td>IDNO</td>
     * <td>Make the <b>No</b> button the default.</td>
     * </tr>
     * <tr>
     * <td>IDOK</td>
     * <td>Make the <b>OK</b> button the default.</td>
     * </tr>
     * <tr>
     * <td>IDRETRY</td>
     * <td>Make the <b>Retry</b> button the default.</td>
     * </tr>
     * <tr>
     * <td>IDYES</td>
     * <td>Make the <b>Yes</b> button the default.</td>
     * </tr>
     * <tr>
     * <td>IDCLOSE</td>
     * <td>Make the <b>Close</b> button the default.</td>
     * </tr>
     * </table>
     *  
     * 
     * If this member is zero or its value does not correspond to any button ID in the dialog, then the first button in the dialog will be the default.
     */
    nDefaultButton : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of entries in the <b>pRadioButtons</b> array that is used to create radio buttons in the task dialog.
     */
    cRadioButtons : UInt32

    /**
     * Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-taskdialog_button">TASKDIALOG_BUTTON</a>*</b>
     * 
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-taskdialog_button">TASKDIALOG_BUTTON</a> structures containing the definition of the radio buttons that are to be displayed in the task dialog.  This array must contain at least the number of entries that are specified by the <b>cRadioButtons</b> member. This parameter can be <b>NULL</b>.
     */
    pRadioButtons : TASKDIALOG_BUTTON.Ptr

    /**
     * Type: <b>int</b>
     * 
     * The button ID of the radio button that is selected by default. If this value does not correspond to a button ID, the first button in the array is selected by default.
     */
    nDefaultRadioButton : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">PCWSTR</a></b>
     * 
     * Pointer that references the string to be used to label the verification checkbox. This parameter can be either a null-terminated string or an integer resource identifier passed to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a> macro. If this parameter is <b>NULL</b>, the verification checkbox is not displayed in the task dialog. If the <i>pfVerificationFlagChecked</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nf-commctrl-taskdialogindirect">TaskDialogIndirect</a> is <b>NULL</b>, the checkbox is not enabled.
     */
    pszVerificationText : PWSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">PCWSTR</a></b>
     * 
     * Pointer that references the string to be used for displaying additional information. This parameter can be either a null-terminated string or an integer resource identifier passed to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a> macro.   The additional information is displayed either immediately below the content or below the footer text depending on whether the TDF_EXPAND_FOOTER_AREA flag is specified.  If the TDF_ENABLE_HYPERLINKS flag is specified for the <b>dwFlags</b> member, then this string may contain hyperlinks in the form: &lt;A HREF="executablestring"&gt;Hyperlink Text&lt;/A&gt;. <b>WARNING: Enabling hyperlinks when using content from an unsafe source may cause security vulnerabilities.</b>
     */
    pszExpandedInformation : PWSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">PCWSTR</a></b>
     * 
     * Pointer that references the string to be used to label the button for collapsing the expandable information. This parameter can be either a null-terminated string or an integer resource identifier passed to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a> macro. This member is ignored when the <b>pszExpandedInformation</b> member is <b>NULL</b>.  If this member is <b>NULL</b> and the <b>pszCollapsedControlText</b> is specified, then the <b>pszCollapsedControlText</b> value will be used for this member as well.
     */
    pszExpandedControlText : PWSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">PCWSTR</a></b>
     * 
     * Pointer that references the string to be used to label the button for expanding the expandable information. This parameter can be either a null-terminated string or an integer resource identifier passed to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a> macro. This member is ignored when the <b>pszExpandedInformation</b> member is <b>NULL</b>.  If this member is <b>NULL</b> and the <b>pszCollapsedControlText</b> is specified, then the <b>pszCollapsedControlText</b> value will be used for this member as well.
     */
    pszCollapsedControlText : PWSTR

    hFooterIcon : HICON

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">PCWSTR</a></b>
     * 
     * Pointer to the string to be used in the footer area of the task dialog. This parameter can be either a null-terminated string or an integer resource identifier passed to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a> macro. If the TDF_ENABLE_HYPERLINKS flag is specified for the <b>dwFlags</b> member, then this string may contain hyperlinks in this form. 
     * 
     * 
     * 
     * 
     * ```
     * <A HREF="executablestring">Hyperlink Text</A>
     * ```
     * 
     * 
     * <div class="alert"><b>Warning</b>  Enabling hyperlinks when using content from an unsafe source may cause security vulnerabilities.</div>
     * <div> </div>
     */
    pszFooter : PWSTR

    /**
     * Type: <b>PFTASKDIALOGCALLBACK</b>
     * 
     * Pointer to an application-defined callback function. For more information see <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nc-commctrl-pftaskdialogcallback">TaskDialogCallbackProc</a>.
     */
    pfCallback : IntPtr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG_PTR</a></b>
     * 
     * A pointer to application-defined reference data. This value is defined by the caller.
     */
    lpCallbackData : IntPtr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The width of the task dialog's client area, in dialog units. If 0, the task dialog manager will calculate the ideal width.
     */
    cxWidth : UInt32

    static __New() {
        DefineProp(this.Prototype, 'pszMainIcon', { type: PWSTR, offset: 40 })
        DefineProp(this.Prototype, 'pszFooterIcon', { type: PWSTR, offset: 136 })
        this.DeleteProp("__New")
    }
}
