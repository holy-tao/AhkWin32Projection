#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import ".\PROPSHEETPAGEA.ahk" { PROPSHEETPAGEA }
#Import "..\..\Foundation\HINSTANCE.ahk" { HINSTANCE }
#Import ".\TA_PROPERTY.ahk" { TA_PROPERTY }
#Import "..\WindowsAndMessaging\HICON.ahk" { HICON }
#Import ".\IMAGELISTDRAWPARAMS.ahk" { IMAGELISTDRAWPARAMS }
#Import ".\BP_PAINTPARAMS.ahk" { BP_PAINTPARAMS }
#Import ".\TOUCH_HIT_TESTING_INPUT.ahk" { TOUCH_HIT_TESTING_INPUT }
#Import "..\..\Foundation\COLORREF.ahk" { COLORREF }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\TBBUTTON.ahk" { TBBUTTON }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\Graphics\Gdi\DRAW_TEXT_FORMAT.ahk" { DRAW_TEXT_FORMAT }
#Import "..\WindowsAndMessaging\POINTER_INPUT_TYPE.ahk" { POINTER_INPUT_TYPE }
#Import ".\INTLIST.ahk" { INTLIST }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\Input\Pointer\HSYNTHETICPOINTERDEVICE.ahk" { HSYNTHETICPOINTERDEVICE }
#Import "..\..\Graphics\Gdi\HDC.ahk" { HDC }
#Import "..\..\Graphics\Gdi\LOGFONTW.ahk" { LOGFONTW }
#Import ".\GET_THEME_BITMAP_FLAGS.ahk" { GET_THEME_BITMAP_FLAGS }
#Import ".\PROPSHEETHEADERA_V2.ahk" { PROPSHEETHEADERA_V2 }
#Import ".\PROPSHEETHEADERW_V2.ahk" { PROPSHEETHEADERW_V2 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\WindowsAndMessaging\HMENU.ahk" { HMENU }
#Import ".\HDSA.ahk" { HDSA }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\IMAGE_LIST_WRITE_STREAM_FLAGS.ahk" { IMAGE_LIST_WRITE_STREAM_FLAGS }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }
#Import ".\IMAGE_LIST_DRAW_STYLE.ahk" { IMAGE_LIST_DRAW_STYLE }
#Import ".\TASKDIALOG_COMMON_BUTTON_FLAGS.ahk" { TASKDIALOG_COMMON_BUTTON_FLAGS }
#Import "..\..\Graphics\Gdi\HRGN.ahk" { HRGN }
#Import "..\..\Graphics\Gdi\HBRUSH.ahk" { HBRUSH }
#Import ".\DLG_BUTTON_CHECK_STATE.ahk" { DLG_BUTTON_CHECK_STATE }
#Import "..\..\Graphics\Gdi\HBITMAP.ahk" { HBITMAP }
#Import ".\PROPERTYORIGIN.ahk" { PROPERTYORIGIN }
#Import ".\IMAGEINFO.ahk" { IMAGEINFO }
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import ".\THEMESIZE.ahk" { THEMESIZE }
#Import ".\DLG_DIR_LIST_FILE_TYPE.ahk" { DLG_DIR_LIST_FILE_TYPE }
#Import ".\WINDOWTHEMEATTRIBUTETYPE.ahk" { WINDOWTHEMEATTRIBUTETYPE }
#Import ".\INITCOMMONCONTROLSEX.ahk" { INITCOMMONCONTROLSEX as INITCOMMONCONTROLSEX_struct }
#Import ".\HDPA.ahk" { HDPA }
#Import ".\BP_BUFFERFORMAT.ahk" { BP_BUFFERFORMAT }
#Import ".\DTBGOPTS.ahk" { DTBGOPTS }
#Import ".\IMAGELIST_CREATION_FLAGS.ahk" { IMAGELIST_CREATION_FLAGS }
#Import "..\..\Graphics\Gdi\RGBQUAD.ahk" { RGBQUAD }
#Import "..\..\Graphics\Gdi\DRAW_EDGE_FLAGS.ahk" { DRAW_EDGE_FLAGS }
#Import ".\TOUCH_HIT_TESTING_PROXIMITY_EVALUATION.ahk" { TOUCH_HIT_TESTING_PROXIMITY_EVALUATION }
#Import "..\..\Graphics\Gdi\DRAWEDGE_FLAGS.ahk" { DRAWEDGE_FLAGS }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\ENABLE_SCROLL_BAR_ARROWS.ahk" { ENABLE_SCROLL_BAR_ARROWS }
#Import ".\DRAW_THEME_PARENT_BACKGROUND_FLAGS.ahk" { DRAW_THEME_PARENT_BACKGROUND_FLAGS }
#Import "..\WindowsAndMessaging\SCROLLBAR_CONSTANTS.ahk" { SCROLLBAR_CONSTANTS }
#Import ".\SET_THEME_APP_PROPERTIES_FLAGS.ahk" { SET_THEME_APP_PROPERTIES_FLAGS }
#Import ".\IMAGE_LIST_COPY_FLAGS.ahk" { IMAGE_LIST_COPY_FLAGS }
#Import "..\..\Foundation\LRESULT.ahk" { LRESULT }
#Import ".\TASKDIALOGCONFIG.ahk" { TASKDIALOGCONFIG }
#Import "..\..\Graphics\Gdi\TEXTMETRICW.ahk" { TEXTMETRICW }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\Input\Pointer\POINTER_FEEDBACK_MODE.ahk" { POINTER_FEEDBACK_MODE }
#Import ".\BP_ANIMATIONPARAMS.ahk" { BP_ANIMATIONPARAMS }
#Import ".\COMBOBOXINFO.ahk" { COMBOBOXINFO }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\Foundation\WPARAM.ahk" { WPARAM }
#Import "..\WindowsAndMessaging\IMAGE_FLAGS.ahk" { IMAGE_FLAGS }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\HPROPSHEETPAGE.ahk" { HPROPSHEETPAGE }
#Import "..\WindowsAndMessaging\SCROLLINFO.ahk" { SCROLLINFO }
#Import ".\HIT_TEST_BACKGROUND_OPTIONS.ahk" { HIT_TEST_BACKGROUND_OPTIONS }
#Import ".\OPEN_THEME_DATA_FLAGS.ahk" { OPEN_THEME_DATA_FLAGS }
#Import ".\HTHEME.ahk" { HTHEME }
#Import ".\HIMAGELIST.ahk" { HIMAGELIST }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\WSB_PROP.ahk" { WSB_PROP }
#Import ".\PROPSHEETPAGEW.ahk" { PROPSHEETPAGEW }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\_LI_METRIC.ahk" { _LI_METRIC }
#Import ".\MARGINS.ahk" { MARGINS }
#Import ".\DTTOPTS.ahk" { DTTOPTS }
#Import ".\COLORMAP.ahk" { COLORMAP }
#Import ".\FEEDBACK_TYPE.ahk" { FEEDBACK_TYPE }

/**
 * @namespace Windows.Win32.UI.Controls
 */

;@region Functions
/**
 * Creates a new page for a property sheet. (ANSI)
 * @remarks
 * <div class="alert"><b>Note</b>  Before common controls version 7.0, this function did not support visual styles.</div>
 * <div> </div>
 * An application uses the <a href="https://docs.microsoft.com/windows/desktop/api/prsht/nf-prsht-propertysheeta">PropertySheet</a> function to create a property sheet that includes the new page. If you are not using the Aero wizard style (<a href="https://docs.microsoft.com/windows/desktop/api/prsht/ns-prsht-propsheetheadera_v2">PSH_AEROWIZARD</a>), the application can use the <a href="https://docs.microsoft.com/windows/desktop/Controls/psm-addpage">PSM_ADDPAGE</a> message to add the new page to an existing property sheet.
 * 
 * Windows 95: The system can support a maximum of 16,364 window handles.
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The prsht.h header defines CreatePropertySheetPage as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<PROPSHEETPAGEA>} constPropSheetPagePointer Type: <b>LPCPROPSHEETPAGE</b>
 * 
 * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/prsht/ns-prsht-propsheetpagea_v2">PROPSHEETPAGE</a> structure that defines a page to be included in a property sheet.
 * @returns {HPROPSHEETPAGE} Type: <b>HPROPSHEETPAGE</b>
 * 
 * Returns the handle to the new property page if successful, or <b>NULL</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/prsht/nf-prsht-createpropertysheetpagea
 * @since windows6.0.6000
 */
export CreatePropertySheetPageA(constPropSheetPagePointer) {
    result := DllCall("COMCTL32.dll\CreatePropertySheetPageA", PROPSHEETPAGEA.Ptr, constPropSheetPagePointer, HPROPSHEETPAGE.Owned)
    return result
}

/**
 * Creates a new page for a property sheet. (Unicode)
 * @remarks
 * <div class="alert"><b>Note</b>  Before common controls version 7.0, this function did not support visual styles.</div>
 * <div> </div>
 * An application uses the <a href="https://docs.microsoft.com/windows/desktop/api/prsht/nf-prsht-propertysheeta">PropertySheet</a> function to create a property sheet that includes the new page. If you are not using the Aero wizard style (<a href="https://docs.microsoft.com/windows/desktop/api/prsht/ns-prsht-propsheetheadera_v2">PSH_AEROWIZARD</a>), the application can use the <a href="https://docs.microsoft.com/windows/desktop/Controls/psm-addpage">PSM_ADDPAGE</a> message to add the new page to an existing property sheet.
 * 
 * Windows 95: The system can support a maximum of 16,364 window handles.
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The prsht.h header defines CreatePropertySheetPage as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<PROPSHEETPAGEW>} constPropSheetPagePointer Type: <b>LPCPROPSHEETPAGE</b>
 * 
 * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/prsht/ns-prsht-propsheetpagea_v2">PROPSHEETPAGE</a> structure that defines a page to be included in a property sheet.
 * @returns {HPROPSHEETPAGE} Type: <b>HPROPSHEETPAGE</b>
 * 
 * Returns the handle to the new property page if successful, or <b>NULL</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/prsht/nf-prsht-createpropertysheetpagew
 * @since windows6.0.6000
 */
export CreatePropertySheetPageW(constPropSheetPagePointer) {
    result := DllCall("COMCTL32.dll\CreatePropertySheetPageW", PROPSHEETPAGEW.Ptr, constPropSheetPagePointer, HPROPSHEETPAGE.Owned)
    return result
}

/**
 * Destroys a property sheet page. An application must call this function for pages that have not been passed to the PropertySheet function.
 * @param {HPROPSHEETPAGE} param0 
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Returns nonzero if successful, or zero otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/prsht/nf-prsht-destroypropertysheetpage
 * @since windows6.0.6000
 */
export DestroyPropertySheetPage(param0) {
    result := DllCall("COMCTL32.dll\DestroyPropertySheetPage", HPROPSHEETPAGE, param0, BOOL)
    return result
}

/**
 * Creates a property sheet and adds the pages defined in the specified property sheet header structure. (ANSI)
 * @remarks
 * To retrieve extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * 
 * If you attempt to add more than 99 pages to a property sheet, this function will fail, but with no indication of the cause of the error: <b>PropertySheet</b> returns a value of -1, but <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns 0.
 * 
 * <div class="alert"><b>Note</b>  The following remarks refer only to wizards that do not use the Aero wizard style (<a href="https://docs.microsoft.com/windows/desktop/api/prsht/ns-prsht-propsheetheadera_v2">PSH_AEROWIZARD</a>) or non-wizard property sheets.</div>
 * <div> </div>
 * By default, the <b>PropertySheet</b> function creates a modal dialog box. If the <b>dwFlags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/prsht/ns-prsht-propsheetheadera_v2">PROPSHEETHEADER</a> structure specifies the PSH_MODELESS flag, <b>PropertySheet</b> creates a modeless dialog box and returns immediately after it is created. In this case, the <b>PropertySheet</b> return value is the window handle to the modeless dialog box.
 * 
 * For a modeless property sheet, your message loop should use <a href="https://docs.microsoft.com/windows/desktop/Controls/psm-isdialogmessage">PSM_ISDIALOGMESSAGE</a> to pass messages to the property sheet dialog box. Your message loop should use <a href="https://docs.microsoft.com/windows/desktop/Controls/psm-getcurrentpagehwnd">PSM_GETCURRENTPAGEHWND</a> to determine when to destroy the dialog box. When the user clicks the <b>OK</b> or <b>Cancel</b> button, <b>PSM_GETCURRENTPAGEHWND</b> returns <b>NULL</b>. You can then use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-destroywindow">DestroyWindow</a> function to destroy the dialog box.
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 5.80.</a> The <b>PropertySheet</b> return value carries different information for modal and modeless property sheets. In some cases, modeless property sheets might need the information they would have received from <b>PropertySheet</b> if they had been modal. In particular, they may need to know whether ID_PSREBOOTSYSTEM or ID_PSRESTARTWINDOWS would have been returned. A modeless property sheet can retrieve the value that a modal property sheet would have received from <b>PropertySheet</b> by waiting until <a href="https://docs.microsoft.com/windows/desktop/Controls/psm-getcurrentpagehwnd">PSM_GETCURRENTPAGEHWND</a> returns <b>NULL</b> and then sending a <a href="https://docs.microsoft.com/windows/desktop/Controls/psm-getresult">PSM_GETRESULT</a> message.
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The prsht.h header defines PropertySheet as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<PROPSHEETHEADERA_V2>} param0 
 * @returns {Pointer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT_PTR</a></b>
 * 
 * For modal property sheets, the return value is as follows:
 *                 
 *                 
 * 
 * <table class="clsStd">
 * <tr>
 * <td>&gt;=1</td>
 * <td>Changes were saved by the user.</td>
 * </tr>
 * <tr>
 * <td>0</td>
 * <td>No changes were saved by the user.</td>
 * </tr>
 * <tr>
 * <td>-1</td>
 * <td>An error occurred.</td>
 * </tr>
 * </table>
 *  
 * 
 * For modeless property sheets, the return value is  the property sheet's window handle.
 * 
 * The following return values have a special meaning.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ID_PSREBOOTSYSTEM</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A page sent the <a href="https://docs.microsoft.com/windows/desktop/Controls/psm-rebootsystem">PSM_REBOOTSYSTEM</a> message to the property sheet. The computer must be restarted for the user's changes to take effect.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ID_PSRESTARTWINDOWS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A page sent the <a href="https://docs.microsoft.com/windows/desktop/Controls/psm-restartwindows">PSM_RESTARTWINDOWS</a> message to the property sheet. Windows must be restarted for the user's changes to take effect.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/prsht/nf-prsht-propertysheeta
 * @since windows6.0.6000
 */
export PropertySheetA(param0) {
    A_LastError := 0

    result := DllCall("COMCTL32.dll\PropertySheetA", PROPSHEETHEADERA_V2.Ptr, param0, IntPtr)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Creates a property sheet and adds the pages defined in the specified property sheet header structure. (Unicode)
 * @remarks
 * To retrieve extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * 
 * If you attempt to add more than 99 pages to a property sheet, this function will fail, but with no indication of the cause of the error: <b>PropertySheet</b> returns a value of -1, but <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns 0.
 * 
 * <div class="alert"><b>Note</b>  The following remarks refer only to wizards that do not use the Aero wizard style (<a href="https://docs.microsoft.com/windows/desktop/api/prsht/ns-prsht-propsheetheadera_v2">PSH_AEROWIZARD</a>) or non-wizard property sheets.</div>
 * <div> </div>
 * By default, the <b>PropertySheet</b> function creates a modal dialog box. If the <b>dwFlags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/prsht/ns-prsht-propsheetheadera_v2">PROPSHEETHEADER</a> structure specifies the PSH_MODELESS flag, <b>PropertySheet</b> creates a modeless dialog box and returns immediately after it is created. In this case, the <b>PropertySheet</b> return value is the window handle to the modeless dialog box.
 * 
 * For a modeless property sheet, your message loop should use <a href="https://docs.microsoft.com/windows/desktop/Controls/psm-isdialogmessage">PSM_ISDIALOGMESSAGE</a> to pass messages to the property sheet dialog box. Your message loop should use <a href="https://docs.microsoft.com/windows/desktop/Controls/psm-getcurrentpagehwnd">PSM_GETCURRENTPAGEHWND</a> to determine when to destroy the dialog box. When the user clicks the <b>OK</b> or <b>Cancel</b> button, <b>PSM_GETCURRENTPAGEHWND</b> returns <b>NULL</b>. You can then use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-destroywindow">DestroyWindow</a> function to destroy the dialog box.
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 5.80.</a> The <b>PropertySheet</b> return value carries different information for modal and modeless property sheets. In some cases, modeless property sheets might need the information they would have received from <b>PropertySheet</b> if they had been modal. In particular, they may need to know whether ID_PSREBOOTSYSTEM or ID_PSRESTARTWINDOWS would have been returned. A modeless property sheet can retrieve the value that a modal property sheet would have received from <b>PropertySheet</b> by waiting until <a href="https://docs.microsoft.com/windows/desktop/Controls/psm-getcurrentpagehwnd">PSM_GETCURRENTPAGEHWND</a> returns <b>NULL</b> and then sending a <a href="https://docs.microsoft.com/windows/desktop/Controls/psm-getresult">PSM_GETRESULT</a> message.
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The prsht.h header defines PropertySheet as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<PROPSHEETHEADERW_V2>} param0 
 * @returns {Pointer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT_PTR</a></b>
 * 
 * For modal property sheets, the return value is as follows:
 *                 
 *                 
 * 
 * <table class="clsStd">
 * <tr>
 * <td>&gt;=1</td>
 * <td>Changes were saved by the user.</td>
 * </tr>
 * <tr>
 * <td>0</td>
 * <td>No changes were saved by the user.</td>
 * </tr>
 * <tr>
 * <td>-1</td>
 * <td>An error occurred.</td>
 * </tr>
 * </table>
 *  
 * 
 * For modeless property sheets, the return value is  the property sheet's window handle.
 * 
 * The following return values have a special meaning.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ID_PSREBOOTSYSTEM</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A page sent the <a href="https://docs.microsoft.com/windows/desktop/Controls/psm-rebootsystem">PSM_REBOOTSYSTEM</a> message to the property sheet. The computer must be restarted for the user's changes to take effect.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ID_PSRESTARTWINDOWS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A page sent the <a href="https://docs.microsoft.com/windows/desktop/Controls/psm-restartwindows">PSM_RESTARTWINDOWS</a> message to the property sheet. Windows must be restarted for the user's changes to take effect.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/prsht/nf-prsht-propertysheetw
 * @since windows6.0.6000
 */
export PropertySheetW(param0) {
    A_LastError := 0

    result := DllCall("COMCTL32.dll\PropertySheetW", PROPSHEETHEADERW_V2.Ptr, param0, IntPtr)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Registers and initializes certain common control window classes. This function is obsolete. New applications should use the InitCommonControlsEx function.
 * @remarks
 * Under Comctl32.dll version 5.x, only Windows 95 classes (ICC_WIN95_CLASSES) can be registered through <b>InitCommonControls</b>. Programs which require additional common control classes must use the <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nf-commctrl-initcommoncontrolsex">InitCommonControlsEx</a> function.
 * 
 * Under Comctl32.dll version 6.0 and later, <b>InitCommonControls</b> does nothing. Applications must explicitly register all common controls through <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nf-commctrl-initcommoncontrolsex">InitCommonControlsEx</a>.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-initcommoncontrols
 * @since windows6.0.6000
 */
export InitCommonControls() {
    DllCall("COMCTL32.dll\InitCommonControls")
}

/**
 * Ensures that the common control DLL (Comctl32.dll) is loaded, and registers specific common control classes from the DLL. An application must call this function before creating a common control.
 * @remarks
 * The effect of each call to <b>InitCommonControlsEx</b> is cumulative. For example, if <b>InitCommonControlsEx</b> is called with the <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-initcommoncontrolsex">ICC_UPDOWN_CLASS</a> flag, then is later called with the <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-initcommoncontrolsex">ICC_HOTKEY_CLASS</a> flag, the result is that both the up-down and hot key common control classes are registered and available to the application.
 * @param {Pointer<INITCOMMONCONTROLSEX>} picce Type: <b>const LPINITCOMMONCONTROLSEX</b>
 * 
 * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-initcommoncontrolsex">INITCOMMONCONTROLSEX</a> structure that contains information specifying which control classes will be registered.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-initcommoncontrolsex
 * @since windows6.0.6000
 */
export InitCommonControlsEx(picce) {
    result := DllCall("COMCTL32.dll\InitCommonControlsEx", INITCOMMONCONTROLSEX_struct.Ptr, picce, BOOL)
    return result
}

/**
 * Creates a new image list.
 * @remarks
 * When you finish using the image list, destroy it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nf-commctrl-imagelist_destroy">ImageList_Destroy</a> function.  
 * 
 * <div class="alert"><b>Note</b>  Comctl32.dll version 6 is not redistributable but it is included in Windows or later. To use Comctl32.dll version 6, specify it in a manifest. For more information on manifests, see <a href="https://docs.microsoft.com/windows/desktop/Controls/cookbook-overview">Enabling Visual Styles</a>.</div>
 * <div> </div>
 * @param {Integer} cx Type: <b>int</b>
 * 
 * The width, in pixels, of each image.
 * @param {Integer} _cy Type: <b>int</b>
 * 
 * The height, in pixels, of each image.
 * @param {IMAGELIST_CREATION_FLAGS} flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * A set of bit flags that specify the type of image list to create. This parameter can be a combination of the <a href="https://docs.microsoft.com/windows/desktop/Controls/ilc-constants">Image List Creation Flags</a>.
 * @param {Integer} cInitial Type: <b>int</b>
 * 
 * The number of images that the image list initially contains.
 * @param {Integer} cGrow Type: <b>int</b>
 * 
 * The number of images by which the image list can grow when the system needs to make room for new images. This parameter represents the number of new images that the resized image list can contain.
 * @returns {HIMAGELIST} Type: <b>HIMAGELIST</b>
 * 
 * Returns the handle to the image list if successful, or <b>NULL</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-imagelist_create
 * @since windows6.0.6000
 */
export ImageList_Create(cx, _cy, flags, cInitial, cGrow) {
    result := DllCall("COMCTL32.dll\ImageList_Create", "int", cx, "int", _cy, IMAGELIST_CREATION_FLAGS, flags, "int", cInitial, "int", cGrow, HIMAGELIST.Owned)
    return result
}

/**
 * Destroys an image list.
 * @param {HIMAGELIST} himl Type: <b>HIMAGELIST</b>
 * 
 * A handle to the image list to destroy.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Returns nonzero if successful, or zero otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-imagelist_destroy
 * @since windows6.0.6000
 */
export ImageList_Destroy(himl) {
    result := DllCall("COMCTL32.dll\ImageList_Destroy", HIMAGELIST, himl, BOOL)
    return result
}

/**
 * Retrieves the number of images in an image list.
 * @param {HIMAGELIST} himl Type: <b>HIMAGELIST</b>
 * 
 * A handle to the image list.
 * @returns {Integer} Type: <b>int</b>
 * 
 * Returns the number of images.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-imagelist_getimagecount
 * @since windows6.0.6000
 */
export ImageList_GetImageCount(himl) {
    result := DllCall("COMCTL32.dll\ImageList_GetImageCount", HIMAGELIST, himl, Int32)
    return result
}

/**
 * Resizes an existing image list. (ImageList_SetImageCount)
 * @remarks
 * If an application expands an image list with this function, it must add new images by using the <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nf-commctrl-imagelist_replace">ImageList_Replace</a> function. If your application does not add valid images at the new indexes, draw operations that use the new indexes will be unpredictable. 
 * 
 * If you decrease the size of an image list by using this function, the truncated images are freed.
 * @param {HIMAGELIST} himl Type: <b>HIMAGELIST</b>
 * 
 * A handle to the image list that will be resized.
 * @param {Integer} uNewCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * A value specifying the new size of the image list.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Returns nonzero if successful, or zero otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-imagelist_setimagecount
 * @since windows6.0.6000
 */
export ImageList_SetImageCount(himl, uNewCount) {
    result := DllCall("COMCTL32.dll\ImageList_SetImageCount", HIMAGELIST, himl, "uint", uNewCount, BOOL)
    return result
}

/**
 * Adds an image or images to an image list. (ImageList_Add)
 * @remarks
 * The <b>ImageList_Add</b> function copies the bitmap to an internal data structure. Be sure to use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-deleteobject">DeleteObject</a> function to delete 
 * 				<i>hbmImage</i> and 
 * 				<i>hbmMask</i> after the function returns.
 * @param {HIMAGELIST} himl Type: <b>HIMAGELIST</b>
 * 
 * A handle to the image list.
 * @param {HBITMAP} hbmImage Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HBITMAP</a></b>
 * 
 * A handle to the bitmap that contains the image or images. The number of images is inferred from the width of the bitmap.
 * @param {HBITMAP} hbmMask Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HBITMAP</a></b>
 * 
 * A handle to the bitmap that contains the mask. If no mask is used with the image list, this parameter is ignored. This parameter can be <b>NULL</b>.
 * @returns {Integer} Type: <b>int</b>
 * 
 * Returns the index of the first new image if successful, or -1 otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-imagelist_add
 * @since windows6.0.6000
 */
export ImageList_Add(himl, hbmImage, hbmMask) {
    result := DllCall("COMCTL32.dll\ImageList_Add", HIMAGELIST, himl, HBITMAP, hbmImage, HBITMAP, hbmMask, Int32)
    return result
}

/**
 * Replaces an image with an icon or cursor. (ImageList_ReplaceIcon)
 * @remarks
 * Because the system does not save 
 * 				<i>hicon</i>, you can destroy it after the function returns if the icon or cursor was created by the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-createicon">CreateIcon</a> function. You do not need to destroy <i>hicon</i> if it was loaded by the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-loadicona">LoadIcon</a> function; the system automatically frees an icon resource when it is no longer needed.
 * @param {HIMAGELIST} himl Type: <b>HIMAGELIST</b>
 * 
 * A handle to the image list.
 * @param {Integer} i Type: <b>int</b>
 * 
 * The index of the image to replace. If 
 * 					<i>i</i> is -1, the function appends the image to the end of the list.
 * @param {HICON} _hicon Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HICON</a></b>
 * 
 * The handle to the icon or cursor that contains the bitmap and mask for the new image.
 * @returns {Integer} Type: <b>int</b>
 * 
 * Returns the index of the image if successful, or -1 otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-imagelist_replaceicon
 * @since windows6.0.6000
 */
export ImageList_ReplaceIcon(himl, i, _hicon) {
    result := DllCall("COMCTL32.dll\ImageList_ReplaceIcon", HIMAGELIST, himl, "int", i, HICON, _hicon, Int32)
    return result
}

/**
 * Sets the background color for an image list. This function only works if you add an icon or use ImageList_AddMasked with a black and white bitmap. Without a mask, the entire image is drawn; hence the background color is not visible.
 * @param {HIMAGELIST} himl Type: <b>HIMAGELIST</b>
 * 
 * A handle to the image list.
 * @param {COLORREF} clrBk Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
 * 
 * The background color to set. This parameter can be the CLR_NONE value; in that case, images are drawn transparently using the mask.
 * @returns {COLORREF} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
 * 
 * Returns the previous background color if successful, or CLR_NONE otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-imagelist_setbkcolor
 * @since windows6.0.6000
 */
export ImageList_SetBkColor(himl, clrBk) {
    result := DllCall("COMCTL32.dll\ImageList_SetBkColor", HIMAGELIST, himl, COLORREF, clrBk, COLORREF)
    return result
}

/**
 * Retrieves the current background color for an image list.
 * @param {HIMAGELIST} himl Type: <b>HIMAGELIST</b>
 * 
 * A handle to the image list.
 * @returns {COLORREF} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
 * 
 * The return value is the background color.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-imagelist_getbkcolor
 * @since windows6.0.6000
 */
export ImageList_GetBkColor(himl) {
    result := DllCall("COMCTL32.dll\ImageList_GetBkColor", HIMAGELIST, himl, COLORREF)
    return result
}

/**
 * Adds a specified image to the list of images to be used as overlay masks. An image list can have up to four overlay masks in version 4.70 and earlier and up to 15 in version 4.71. The function assigns an overlay mask index to the specified image.
 * @remarks
 * An overlay mask is an image drawn transparently over another image. To draw an overlay mask over an image, call the <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nf-commctrl-imagelist_draw">ImageList_Draw</a> or <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nf-commctrl-imagelist_drawex">ImageList_DrawEx</a> function. The <i>fStyle</i> parameter of these functions can use the <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nf-commctrl-indextooverlaymask">INDEXTOOVERLAYMASK</a> macro to specify an overlay mask index. 
 * 
 * A call to this method fails and returns E_INVALIDARG unless the image list is created using a mask.
 * @param {HIMAGELIST} himl Type: <b>HIMAGELIST</b>
 * 
 * A handle to the image list.
 * @param {Integer} iImage Type: <b>int</b>
 * 
 * The zero-based index of an image in the <i>himl</i> image list. This index identifies the image to use as an overlay mask.
 * @param {Integer} _iOverlay Type: <b>int</b>
 * 
 * The one-based index of the overlay mask.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Returns nonzero if successful, or zero otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-imagelist_setoverlayimage
 * @since windows6.0.6000
 */
export ImageList_SetOverlayImage(himl, iImage, _iOverlay) {
    result := DllCall("COMCTL32.dll\ImageList_SetOverlayImage", HIMAGELIST, himl, "int", iImage, "int", _iOverlay, BOOL)
    return result
}

/**
 * Draws an image list item in the specified device context. (ImageList_Draw)
 * @remarks
 * An overlay image is drawn transparently over the primary image specified in the <i>i</i> parameter. To specify an overlay image in the <i>fStyle</i> parameter, use the <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nf-commctrl-indextooverlaymask">INDEXTOOVERLAYMASK</a> macro to shift the one-based index of the overlay image. Use the OR operator to logically combine the return value of the macro with the drawing style flags specified in the <i>fStyle</i> parameter. You must first specify this image as an overlay image by using the <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nf-commctrl-imagelist_setoverlayimage">ImageList_SetOverlayImage</a> function.
 * @param {HIMAGELIST} himl Type: <b>HIMAGELIST</b>
 * 
 * A handle to the image list.
 * @param {Integer} i Type: <b>int</b>
 * 
 * The zero-based index of the image to draw.
 * @param {HDC} hdcDst Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a></b>
 * 
 * A handle to the destination device context.
 * @param {Integer} x Type: <b>int</b>
 * 
 * The x-coordinate at which to draw within the specified device context.
 * @param {Integer} y Type: <b>int</b>
 * 
 * The y-coordinate at which to draw within the specified device context.
 * @param {IMAGE_LIST_DRAW_STYLE} fStyle Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Returns nonzero if successful, or zero otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-imagelist_draw
 * @since windows6.0.6000
 */
export ImageList_Draw(himl, i, hdcDst, x, y, fStyle) {
    result := DllCall("COMCTL32.dll\ImageList_Draw", HIMAGELIST, himl, "int", i, HDC, hdcDst, "int", x, "int", y, IMAGE_LIST_DRAW_STYLE, fStyle, BOOL)
    return result
}

/**
 * Replaces an image in an image list with a new image. (ImageList_Replace)
 * @remarks
 * The <b>ImageList_Replace</b> function copies the bitmap to an internal data structure. Be sure to use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-deleteobject">DeleteObject</a> function to delete <i>hbmImage</i> and <i>hbmMask</i> after the function returns.
 * @param {HIMAGELIST} himl Type: <b>HIMAGELIST</b>
 * 
 * A handle to the image list.
 * @param {Integer} i Type: <b>int</b>
 * 
 * An index of the image to replace.
 * @param {HBITMAP} hbmImage Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HBITMAP</a></b>
 * 
 * A handle to the bitmap that contains the image.
 * @param {HBITMAP} hbmMask Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HBITMAP</a></b>
 * 
 * A handle to the bitmap that contains the mask. If no mask is used with the image list, this parameter is ignored.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Returns nonzero if successful, or zero otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-imagelist_replace
 * @since windows6.0.6000
 */
export ImageList_Replace(himl, i, hbmImage, hbmMask) {
    result := DllCall("COMCTL32.dll\ImageList_Replace", HIMAGELIST, himl, "int", i, HBITMAP, hbmImage, HBITMAP, hbmMask, BOOL)
    return result
}

/**
 * Adds an image or images to an image list, generating a mask from the specified bitmap. (ImageList_AddMasked)
 * @remarks
 * The <b>ImageList_AddMasked</b> function copies the bitmap to an internal data structure. Bitmaps with color depth greater than 8bpp are not supported. Be sure to use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-deleteobject">DeleteObject</a> function to delete <i>hbmImage</i> after the function returns.
 * @param {HIMAGELIST} himl Type: <b>HIMAGELIST</b>
 * 
 * A handle to the image list.
 * @param {HBITMAP} hbmImage Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HBITMAP</a></b>
 * 
 * A handle to the bitmap that contains one or more images. The number of images is inferred from the width of the bitmap.
 * @param {COLORREF} crMask Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
 * 
 * The color used to generate the mask. Each pixel of this color in the specified bitmap is changed to black, and the corresponding bit in the mask is set to 1. If this parameter is CLR_DEFAULT, then the color of the pixel at (0,0) is used as the mask.
 * @returns {Integer} Type: <b>int</b>
 * 
 * Returns the index of the first new image if successful, or -1 otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-imagelist_addmasked
 * @since windows6.0.6000
 */
export ImageList_AddMasked(himl, hbmImage, crMask) {
    result := DllCall("COMCTL32.dll\ImageList_AddMasked", HIMAGELIST, himl, HBITMAP, hbmImage, COLORREF, crMask, Int32)
    return result
}

/**
 * Draws an image list item in the specified device context. The function uses the specified drawing style and blends the image with the specified color.
 * @remarks
 * An overlay image is drawn transparently over the primary image specified in the <i>i</i> parameter. To specify an overlay image in the <i>fStyle</i> parameter, use the <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nf-commctrl-indextooverlaymask">INDEXTOOVERLAYMASK</a> macro to shift the one-based index of the overlay image. Use the OR operator to logically combine the return value of the macro with the drawing style flags specified in the <i>fStyle</i> parameter. You must first specify this image as an overlay image by using the <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nf-commctrl-imagelist_setoverlayimage">ImageList_SetOverlayImage</a> function.
 * @param {HIMAGELIST} himl Type: <b>HIMAGELIST</b>
 * 
 * A handle to the image list
 * @param {Integer} i Type: <b>int</b>
 * 
 * The index of the image to draw.
 * @param {HDC} hdcDst Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a></b>
 * 
 * A handle to the destination device context.
 * @param {Integer} x Type: <b>int</b>
 * 
 * The x-coordinate at which to draw within the specified device context.
 * @param {Integer} y Type: <b>int</b>
 * 
 * The y-coordinate at which to draw within the specified device context.
 * @param {Integer} dx Type: <b>int</b>
 * 
 * The width of the portion of the image to draw relative to the upper-left corner of the image. If <i>dx</i> and 
 * <i>dy</i> are zero, the function draws the entire image. The function does not ensure that the parameters are valid.
 * @param {Integer} dy Type: <b>int</b>
 * 
 * The height of the portion of the image to draw, relative to the upper-left corner of the image. If 
 * 					<i>dx</i> and 
 * 					<i>dy</i> are zero, the function draws the entire image. The function does not ensure that the parameters are valid.
 * @param {COLORREF} rgbBk Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
 * @param {COLORREF} rgbFg Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
 * @param {IMAGE_LIST_DRAW_STYLE} fStyle Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Returns nonzero if successful, or zero otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-imagelist_drawex
 * @since windows6.0.6000
 */
export ImageList_DrawEx(himl, i, hdcDst, x, y, dx, dy, rgbBk, rgbFg, fStyle) {
    result := DllCall("COMCTL32.dll\ImageList_DrawEx", HIMAGELIST, himl, "int", i, HDC, hdcDst, "int", x, "int", y, "int", dx, "int", dy, COLORREF, rgbBk, COLORREF, rgbFg, IMAGE_LIST_DRAW_STYLE, fStyle, BOOL)
    return result
}

/**
 * Draws an image list image based on an IMAGELISTDRAWPARAMS structure.
 * @param {Pointer<IMAGELISTDRAWPARAMS>} pimldp Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/commoncontrols/ns-commoncontrols-imagelistdrawparams">IMAGELISTDRAWPARAMS</a>*</b>
 * 
 * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/commoncontrols/ns-commoncontrols-imagelistdrawparams">IMAGELISTDRAWPARAMS</a> structure that contains information about the draw operation.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Returns nonzero if successful, and zero otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-imagelist_drawindirect
 * @since windows6.0.6000
 */
export ImageList_DrawIndirect(pimldp) {
    result := DllCall("COMCTL32.dll\ImageList_DrawIndirect", IMAGELISTDRAWPARAMS.Ptr, pimldp, BOOL)
    return result
}

/**
 * Removes an image from an image list. (ImageList_Remove)
 * @remarks
 * When an image is removed, the indexes of the remaining images are adjusted so that the image indexes always range from zero to one less than the number of images in the image list. For example, if you remove the image at index 0, then image 1 becomes image 0, image 2 becomes image 1, and so on.
 * @param {HIMAGELIST} himl Type: <b>HIMAGELIST</b>
 * 
 * A handle to the image list.
 * @param {Integer} i Type: <b>int</b>
 * 
 * The index of the image to remove. If this parameter is -1, the function removes all images.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Returns nonzero if successful, or zero otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-imagelist_remove
 * @since windows6.0.6000
 */
export ImageList_Remove(himl, i) {
    result := DllCall("COMCTL32.dll\ImageList_Remove", HIMAGELIST, himl, "int", i, BOOL)
    return result
}

/**
 * Creates an icon from an image and mask in an image list.
 * @remarks
 * It is the responsibility of the calling application to destroy the icon returned from this function using the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-destroyicon">DestroyIcon</a> function.
 * @param {HIMAGELIST} himl Type: <b>HIMAGELIST</b>
 * 
 * A handle to the image list.
 * @param {Integer} i Type: <b>int</b>
 * 
 * An index of the image.
 * @param {IMAGE_LIST_DRAW_STYLE} flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * A combination of flags that specify the drawing style. For a list of values, see the description of the <i>fStyle</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nf-commctrl-imagelist_draw">ImageList_Draw</a> function.
 * @returns {HICON} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HICON</a></b>
 * 
 * Returns the handle to the icon if successful, or <b>NULL</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-imagelist_geticon
 * @since windows6.0.6000
 */
export ImageList_GetIcon(himl, i, flags) {
    result := DllCall("COMCTL32.dll\ImageList_GetIcon", HIMAGELIST, himl, "int", i, IMAGE_LIST_DRAW_STYLE, flags, HICON.Owned)
    return result
}

/**
 * Creates an image list from the specified bitmap. (ANSI)
 * @remarks
 * LR_LOADTRANSPARENT does not load the image transparently. It creates an opaque image list that only appears transparent because all the background pixels have been changed to COLOR_WINDOW. If the images are drawn over a background that is not the color COLOR_WINDOW, the image does not draw properly. Also, LR_LOADTRANSPARENT and LR_LOADMAP3DCOLORS use the system colors that were in effect at the time that <b>ImageList_LoadImage</b> was called. If the system colors subsequently change, the application must reload the image to remap the colors.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The commctrl.h header defines ImageList_LoadImage as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HINSTANCE} hi Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HINSTANCE</a></b>
 * 
 * A handle to the instance that contains the resource. This parameter can be <b>NULL</b> if you are loading an image from a file or loading an OEM resource.
 * @param {PSTR} lpbmp Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCTSTR</a></b>
 * 
 * The image to load. 
 * 
 * If the <i>uFlags</i> parameter includes LR_LOADFROMFILE, <i>lpbmp</i> is the address of a null-terminated string that names the file containing the image to load.
 * 
 * If the <i>hi</i> parameter is non-<b>NULL</b> and LR_LOADFROMFILE is not specified, <i>lpbmp</i> is the address of a null-terminated string that contains the name of the image resource in the <i>hi</i> module.
 * 
 * If <i>hi</i> is <b>NULL</b> and LR_LOADFROMFILE is not specified, the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms632659(v=vs.85)">LOWORD</a> of this parameter must be the identifier of an OEM image to load. To create this value, use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a> macro with one of the OEM image identifiers defined in Winuser.h. These identifiers have the following prefixes.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="OBM__for_OEM_bitmaps"></a><a id="obm__for_oem_bitmaps"></a><a id="OBM__FOR_OEM_BITMAPS"></a><dl>
 * <dt><b>OBM_ for OEM bitmaps</b></dt>
 * </dl>
 * </td>
 * <td width="60%"></td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="OIC__for_OEM_icons"></a><a id="oic__for_oem_icons"></a><a id="OIC__FOR_OEM_ICONS"></a><dl>
 * <dt><b>OIC_ for OEM icons</b></dt>
 * </dl>
 * </td>
 * <td width="60%"></td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="OCR__for_OEM_cursors"></a><a id="ocr__for_oem_cursors"></a><a id="OCR__FOR_OEM_CURSORS"></a><dl>
 * <dt><b>OCR_ for OEM cursors</b></dt>
 * </dl>
 * </td>
 * <td width="60%"></td>
 * </tr>
 * </table>
 * @param {Integer} cx Type: <b>int</b>
 * 
 * The width of each image. The height of each image and the initial number of images are inferred by the dimensions of the specified resource.
 * @param {Integer} cGrow Type: <b>int</b>
 * 
 * The number of images by which the image list can grow when the system needs to make room for new images. This parameter represents the number of new images that the resized image list can contain.
 * @param {COLORREF} crMask Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
 * 
 * The color used to generate a mask. Each pixel of this color in the specified bitmap, cursor, or icon is changed to black, and the corresponding bit in the mask is set to 1. If this parameter is the CLR_NONE value, no mask is generated. If this parameter is the CLR_DEFAULT value, the color of the pixel at the upper-left corner of the image is treated as the mask color.
 * @param {Integer} uType Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * A flag that specifies the type of image to load. This parameter must be IMAGE_BITMAP to indicate that a bitmap is being loaded. 
 * 
 * 
 * 
 * <div class="alert"><b>Note</b>  <b>ImageList_LoadImage</b> is for use only with bitmap files. No other image types are supported.</div>
 * <div> </div>
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="IMAGE_BITMAP"></a><a id="image_bitmap"></a><dl>
 * <dt><b>IMAGE_BITMAP</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Loads a bitmap.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {IMAGE_FLAGS} uFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * @returns {HIMAGELIST} Type: <b>HIMAGELIST</b>
 * 
 * Returns the handle to the image list if successful, or <b>NULL</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-imagelist_loadimagea
 * @since windows6.0.6000
 */
export ImageList_LoadImageA(hi, lpbmp, cx, cGrow, crMask, uType, uFlags) {
    lpbmp := lpbmp is String ? StrPtr(lpbmp) : lpbmp

    result := DllCall("COMCTL32.dll\ImageList_LoadImageA", HINSTANCE, hi, "ptr", lpbmp, "int", cx, "int", cGrow, COLORREF, crMask, "uint", uType, IMAGE_FLAGS, uFlags, HIMAGELIST.Owned)
    return result
}

/**
 * Creates an image list from the specified bitmap. (Unicode)
 * @remarks
 * LR_LOADTRANSPARENT does not load the image transparently. It creates an opaque image list that only appears transparent because all the background pixels have been changed to COLOR_WINDOW. If the images are drawn over a background that is not the color COLOR_WINDOW, the image does not draw properly. Also, LR_LOADTRANSPARENT and LR_LOADMAP3DCOLORS use the system colors that were in effect at the time that <b>ImageList_LoadImage</b> was called. If the system colors subsequently change, the application must reload the image to remap the colors.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The commctrl.h header defines ImageList_LoadImage as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HINSTANCE} hi Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HINSTANCE</a></b>
 * 
 * A handle to the instance that contains the resource. This parameter can be <b>NULL</b> if you are loading an image from a file or loading an OEM resource.
 * @param {PWSTR} lpbmp Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCTSTR</a></b>
 * 
 * The image to load. 
 * 
 * If the <i>uFlags</i> parameter includes LR_LOADFROMFILE, <i>lpbmp</i> is the address of a null-terminated string that names the file containing the image to load.
 * 
 * If the <i>hi</i> parameter is non-<b>NULL</b> and LR_LOADFROMFILE is not specified, <i>lpbmp</i> is the address of a null-terminated string that contains the name of the image resource in the <i>hi</i> module.
 * 
 * If <i>hi</i> is <b>NULL</b> and LR_LOADFROMFILE is not specified, the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms632659(v=vs.85)">LOWORD</a> of this parameter must be the identifier of an OEM image to load. To create this value, use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a> macro with one of the OEM image identifiers defined in Winuser.h. These identifiers have the following prefixes.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="OBM__for_OEM_bitmaps"></a><a id="obm__for_oem_bitmaps"></a><a id="OBM__FOR_OEM_BITMAPS"></a><dl>
 * <dt><b>OBM_ for OEM bitmaps</b></dt>
 * </dl>
 * </td>
 * <td width="60%"></td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="OIC__for_OEM_icons"></a><a id="oic__for_oem_icons"></a><a id="OIC__FOR_OEM_ICONS"></a><dl>
 * <dt><b>OIC_ for OEM icons</b></dt>
 * </dl>
 * </td>
 * <td width="60%"></td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="OCR__for_OEM_cursors"></a><a id="ocr__for_oem_cursors"></a><a id="OCR__FOR_OEM_CURSORS"></a><dl>
 * <dt><b>OCR_ for OEM cursors</b></dt>
 * </dl>
 * </td>
 * <td width="60%"></td>
 * </tr>
 * </table>
 * @param {Integer} cx Type: <b>int</b>
 * 
 * The width of each image. The height of each image and the initial number of images are inferred by the dimensions of the specified resource.
 * @param {Integer} cGrow Type: <b>int</b>
 * 
 * The number of images by which the image list can grow when the system needs to make room for new images. This parameter represents the number of new images that the resized image list can contain.
 * @param {COLORREF} crMask Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
 * 
 * The color used to generate a mask. Each pixel of this color in the specified bitmap, cursor, or icon is changed to black, and the corresponding bit in the mask is set to 1. If this parameter is the CLR_NONE value, no mask is generated. If this parameter is the CLR_DEFAULT value, the color of the pixel at the upper-left corner of the image is treated as the mask color.
 * @param {Integer} uType Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * A flag that specifies the type of image to load. This parameter must be IMAGE_BITMAP to indicate that a bitmap is being loaded. 
 * 
 * 
 * 
 * <div class="alert"><b>Note</b>  <b>ImageList_LoadImage</b> is for use only with bitmap files. No other image types are supported.</div>
 * <div> </div>
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="IMAGE_BITMAP"></a><a id="image_bitmap"></a><dl>
 * <dt><b>IMAGE_BITMAP</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Loads a bitmap.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {IMAGE_FLAGS} uFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * @returns {HIMAGELIST} Type: <b>HIMAGELIST</b>
 * 
 * Returns the handle to the image list if successful, or <b>NULL</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-imagelist_loadimagew
 * @since windows6.0.6000
 */
export ImageList_LoadImageW(hi, lpbmp, cx, cGrow, crMask, uType, uFlags) {
    lpbmp := lpbmp is String ? StrPtr(lpbmp) : lpbmp

    result := DllCall("COMCTL32.dll\ImageList_LoadImageW", HINSTANCE, hi, "ptr", lpbmp, "int", cx, "int", cGrow, COLORREF, crMask, "uint", uType, IMAGE_FLAGS, uFlags, HIMAGELIST.Owned)
    return result
}

/**
 * Copies images within a given image list.
 * @param {HIMAGELIST} himlDst Type: <b>HIMAGELIST</b>
 * 
 * A handle to an image list that is the target of the copy operation. In current versions of Windows, both <i>himlDst</i> and <i>himlSrc</i> must be identical.
 * @param {Integer} iDst Type: <b>int</b>
 * 
 * The zero-based index of the image to be used as the destination of the copy operation.
 * @param {HIMAGELIST} himlSrc Type: <b>HIMAGELIST</b>
 * 
 * A handle to an image list that is the target of the copy operation. In current versions of Windows, both <i>himlDst</i> and <i>himlSrc</i> must be identical.
 * @param {Integer} iSrc Type: <b>int</b>
 * 
 * The zero-based index of the image to be used as the source of the copy operation.
 * @param {IMAGE_LIST_COPY_FLAGS} uFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Returns nonzero if successful, or zero otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-imagelist_copy
 * @since windows6.0.6000
 */
export ImageList_Copy(himlDst, iDst, himlSrc, iSrc, uFlags) {
    result := DllCall("COMCTL32.dll\ImageList_Copy", HIMAGELIST, himlDst, "int", iDst, HIMAGELIST, himlSrc, "int", iSrc, IMAGE_LIST_COPY_FLAGS, uFlags, BOOL)
    return result
}

/**
 * Begins dragging an image. (ImageList_BeginDrag)
 * @remarks
 * This function creates a temporary image list that is used for dragging. In response to subsequent <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-mousemove">WM_MOUSEMOVE</a> messages, you can move the drag image by using the <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nf-commctrl-imagelist_dragmove">ImageList_DragMove</a> function. To end the drag operation, you can use the <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nf-commctrl-imagelist_enddrag">ImageList_EndDrag</a> function.
 * @param {HIMAGELIST} himlTrack Type: <b>HIMAGELIST</b>
 * 
 * A handle to the image list.
 * @param {Integer} iTrack Type: <b>int</b>
 * 
 * The index of the image to drag.
 * @param {Integer} dxHotspot Type: <b>int</b>
 * 
 * The x-coordinate of the location of the drag position relative to the upper-left corner of the image.
 * @param {Integer} dyHotspot Type: <b>int</b>
 * 
 * The y-coordinate of the location of the drag position relative to the upper-left corner of the image.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Returns nonzero if successful, or zero otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-imagelist_begindrag
 * @since windows6.0.6000
 */
export ImageList_BeginDrag(himlTrack, iTrack, dxHotspot, dyHotspot) {
    result := DllCall("COMCTL32.dll\ImageList_BeginDrag", HIMAGELIST, himlTrack, "int", iTrack, "int", dxHotspot, "int", dyHotspot, BOOL)
    return result
}

/**
 * Ends a drag operation. (ImageList_EndDrag)
 * @remarks
 * The temporary image list is destroyed when the <b>ImageList_EndDrag</b> function is called. To begin a drag operation, use the <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nf-commctrl-imagelist_begindrag">ImageList_BeginDrag</a> function.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-imagelist_enddrag
 * @since windows6.0.6000
 */
export ImageList_EndDrag() {
    DllCall("COMCTL32.dll\ImageList_EndDrag")
}

/**
 * Displays the drag image at the specified position within the window.
 * @remarks
 * To begin a drag operation, use the <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nf-commctrl-imagelist_begindrag">ImageList_BeginDrag</a> function.
 * @param {HWND} hwndLock Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * A handle to the window that owns the drag image.
 * @param {Integer} x Type: <b>int</b>
 * 
 * The x-coordinate at which to display the drag image. The coordinate is relative to the upper-left corner of the window, not the client area.
 * @param {Integer} y Type: <b>int</b>
 * 
 * The y-coordinate at which to display the drag image. The coordinate is relative to the upper-left corner of the window, not the client area.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Returns nonzero if successful, or zero otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-imagelist_dragenter
 * @since windows6.0.6000
 */
export ImageList_DragEnter(hwndLock, x, y) {
    result := DllCall("COMCTL32.dll\ImageList_DragEnter", HWND, hwndLock, "int", x, "int", y, BOOL)
    return result
}

/**
 * Unlocks the specified window and hides the drag image, allowing the window to be updated.
 * @param {HWND} hwndLock Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * A handle to the window that owns the drag image.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Returns nonzero if successful, or zero otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-imagelist_dragleave
 * @since windows6.0.6000
 */
export ImageList_DragLeave(hwndLock) {
    result := DllCall("COMCTL32.dll\ImageList_DragLeave", HWND, hwndLock, BOOL)
    return result
}

/**
 * Moves the image that is being dragged during a drag-and-drop operation. This function is typically called in response to a WM_MOUSEMOVE message. (ImageList_DragMove)
 * @remarks
 * To begin a drag operation, use the <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nf-commctrl-imagelist_begindrag">ImageList_BeginDrag</a> function.
 * @param {Integer} x Type: <b>int</b>
 * 
 * The x-coordinate at which to display the drag image. The coordinate is relative to the upper-left corner of the window, not the client area.
 * @param {Integer} y Type: <b>int</b>
 * 
 * The y-coordinate at which to display the drag image. The coordinate is relative to the upper-left corner of the window, not the client area.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Returns nonzero if successful, or zero otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-imagelist_dragmove
 * @since windows6.0.6000
 */
export ImageList_DragMove(x, y) {
    result := DllCall("COMCTL32.dll\ImageList_DragMove", "int", x, "int", y, BOOL)
    return result
}

/**
 * Creates a new drag image by combining the specified image (typically a mouse cursor image) with the current drag image.
 * @param {HIMAGELIST} himlDrag Type: <b>HIMAGELIST</b>
 * 
 * A handle to the image list that contains the new image to combine with the drag image.
 * @param {Integer} iDrag Type: <b>int</b>
 * 
 * The index of the new image to combine with the drag image.
 * @param {Integer} dxHotspot Type: <b>int</b>
 * 
 * The x-position of the hot spot within the new image.
 * @param {Integer} dyHotspot Type: <b>int</b>
 * 
 * The y-position of the hot spot within the new image.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Returns nonzero if successful, or zero otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-imagelist_setdragcursorimage
 * @since windows6.0.6000
 */
export ImageList_SetDragCursorImage(himlDrag, iDrag, dxHotspot, dyHotspot) {
    result := DllCall("COMCTL32.dll\ImageList_SetDragCursorImage", HIMAGELIST, himlDrag, "int", iDrag, "int", dxHotspot, "int", dyHotspot, BOOL)
    return result
}

/**
 * Shows or hides the image being dragged. (ImageList_DragShowNolock)
 * @param {BOOL} fShow Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * A value specifying whether to show or hide the image being dragged. Specify <b>TRUE</b> to show the image or <b>FALSE</b> to hide the image.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Returns nonzero if successful, or zero otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-imagelist_dragshownolock
 * @since windows6.0.6000
 */
export ImageList_DragShowNolock(fShow) {
    result := DllCall("COMCTL32.dll\ImageList_DragShowNolock", BOOL, fShow, BOOL)
    return result
}

/**
 * Retrieves the temporary image list that is used for the drag image. The function also retrieves the current drag position and the offset of the drag image relative to the drag position.
 * @remarks
 * The temporary image list is destroyed when the <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nf-commctrl-imagelist_enddrag">ImageList_EndDrag</a> function is called. To begin a drag operation, use the <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nf-commctrl-imagelist_begindrag">ImageList_BeginDrag</a> function.
 * @param {Pointer<POINT>} ppt Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a>*</b>
 * 
 * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a> structure that receives the current drag position. Can be <b>NULL</b>.
 * @param {Pointer<POINT>} pptHotspot Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a>*</b>
 * 
 * A pointer to a <b>POINT</b> structure that receives the offset of the drag image relative to the drag position. Can be <b>NULL</b>.
 * @returns {HIMAGELIST} Type: <b>HIMAGELIST</b>
 * 
 * Returns the handle to the image list if successful, or <b>NULL</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-imagelist_getdragimage
 * @since windows6.0.6000
 */
export ImageList_GetDragImage(ppt, pptHotspot) {
    result := DllCall("COMCTL32.dll\ImageList_GetDragImage", POINT.Ptr, ppt, POINT.Ptr, pptHotspot, HIMAGELIST.Owned)
    return result
}

/**
 * Reads an image list from a stream.
 * @param {IStream} pstm Type: <b>LPSTREAM</b>
 * 
 * A pointer to the stream.
 * @returns {HIMAGELIST} Type: <b>HIMAGELIST</b>
 * 
 * Returns the handle to the image list if successful, or <b>NULL</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-imagelist_read
 * @since windows6.0.6000
 */
export ImageList_Read(pstm) {
    result := DllCall("COMCTL32.dll\ImageList_Read", "ptr", pstm, HIMAGELIST.Owned)
    return result
}

/**
 * Writes an image list to a stream. (ImageList_Write)
 * @param {HIMAGELIST} himl Type: <b>HIMAGELIST</b>
 * 
 * A handle to the image list.
 * @param {IStream} pstm Type: <b>LPSTREAM</b>
 * 
 * A pointer to the stream.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Returns nonzero if successful, or zero otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-imagelist_write
 * @since windows6.0.6000
 */
export ImageList_Write(himl, pstm) {
    result := DllCall("COMCTL32.dll\ImageList_Write", HIMAGELIST, himl, "ptr", pstm, BOOL)
    return result
}

/**
 * Reads an image list from a stream, and returns an IImageList interface to the image list.
 * @remarks
 * To use <b>ImageList_ReadEx</b>, the application must specify Comctl32.dll version 6 in the manifest. For more information on manifests, see <a href="https://docs.microsoft.com/windows/desktop/Controls/cookbook-overview">Enabling Visual Styles</a>.
 * @param {Integer} dwFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
 * 
 * A flag that specifies how the stream is read.
 * 
 * 
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ILP_NORMAL"></a><a id="ilp_normal"></a><dl>
 * <dt><b>ILP_NORMAL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Expects an image list that was written with the ILP_NORMAL flag specified.
 * 			
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ILP_DOWNLEVEL"></a><a id="ilp_downlevel"></a><dl>
 * <dt><b>ILP_DOWNLEVEL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Expects an image list that was written with the ILP_DOWNLEVEL flag specified.
 * 			
 * 
 * </td>
 * </tr>
 * </table>
 * @param {IStream} pstm Type: <b>LPSTREAM</b>
 * 
 * The address of the stream.
 * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
 * 
 * An IID for the image list.
 * @returns {Pointer<Void>} Type: <b>void**</b>
 * 
 * The address of a pointer to the interface for the image list if successful, <b>NULL</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-imagelist_readex
 * @since windows6.0.6000
 */
export ImageList_ReadEx(dwFlags, pstm, riid) {
    result := DllCall("COMCTL32.dll\ImageList_ReadEx", "uint", dwFlags, "ptr", pstm, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
    return ppv
}

/**
 * Writes an image list to a stream. (ImageList_WriteEx)
 * @remarks
 * You should not create an image list that is written with the ILP_DOWNLEVEL flag with <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nf-commctrl-imagelist_create">ILC_COLOR32</a>.  
 * 	
 * 
 * To use <b>ImageList_WriteEx</b>, the application must specify Comctl32.dll version 6 in the manifest. For more information on manifests, see <a href="https://docs.microsoft.com/windows/desktop/Controls/cookbook-overview">Enabling Visual Styles</a>.
 * @param {HIMAGELIST} himl Type: <b>HIMAGELIST</b>
 * 
 * A handle to the image list.
 * @param {IMAGE_LIST_WRITE_STREAM_FLAGS} dwFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
 * 
 * A flag that specifies how the stream is written.
 * 
 * 
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ILP_NORMAL"></a><a id="ilp_normal"></a><dl>
 * <dt><b>ILP_NORMAL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Writes to the stream using the file format for <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Common Controls 6.0</a>, which includes information about image list attributes new to this version.  
 * 			
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="ILP_DOWNLEVEL"></a><a id="ilp_downlevel"></a><dl>
 * <dt><b>ILP_DOWNLEVEL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Writes to the stream using a file format previous to version 6.0.  Specify this flag if you need to save image lists loaded under Common Controls versions earlier than version 6.0.
 * 			
 * 
 * </td>
 * </tr>
 * </table>
 * @param {IStream} pstm Type: <b>LPSTREAM</b>
 * 
 * The address of the stream.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-imagelist_writeex
 * @since windows6.0.6000
 */
export ImageList_WriteEx(himl, dwFlags, pstm) {
    result := DllCall("COMCTL32.dll\ImageList_WriteEx", HIMAGELIST, himl, IMAGE_LIST_WRITE_STREAM_FLAGS, dwFlags, "ptr", pstm, "HRESULT")
    return result
}

/**
 * Retrieves the dimensions of images in an image list. All images in an image list have the same dimensions.
 * @param {HIMAGELIST} himl Type: <b>HIMAGELIST</b>
 * 
 * A handle to the image list.
 * @param {Pointer<Integer>} cx Type: <b>int*</b>
 * 
 * A pointer to an integer variable that receives the width, in pixels, of each image.
 * @param {Pointer<Integer>} _cy Type: <b>int*</b>
 * 
 * A pointer to an integer variable that receives the height, in pixels, of each image.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Returns nonzero if successful, or zero otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-imagelist_geticonsize
 * @since windows6.0.6000
 */
export ImageList_GetIconSize(himl, cx, _cy) {
    cxMarshal := cx is VarRef ? "int*" : "ptr"
    _cyMarshal := _cy is VarRef ? "int*" : "ptr"

    result := DllCall("COMCTL32.dll\ImageList_GetIconSize", HIMAGELIST, himl, cxMarshal, cx, _cyMarshal, _cy, BOOL)
    return result
}

/**
 * Sets the dimensions of images in an image list and removes all images from the list. (ImageList_SetIconSize)
 * @param {HIMAGELIST} himl Type: <b>HIMAGELIST</b>
 * 
 * A handle to the image list.
 * @param {Integer} cx Type: <b>int</b>
 * 
 * The width, in pixels, of the images in the image list. All images in an image list have the same dimensions.
 * @param {Integer} _cy Type: <b>int</b>
 * 
 * The height, in pixels, of the images in the image list. All images in an image list have the same dimensions.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Returns nonzero if successful, or zero otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-imagelist_seticonsize
 * @since windows6.0.6000
 */
export ImageList_SetIconSize(himl, cx, _cy) {
    result := DllCall("COMCTL32.dll\ImageList_SetIconSize", HIMAGELIST, himl, "int", cx, "int", _cy, BOOL)
    return result
}

/**
 * Retrieves information about an image.
 * @remarks
 * An application should not call <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-deleteobject">DeleteObject</a> to destroy the bitmaps retrieved by <b>ImageList_GetImageInfo</b>. The system destroys the bitmaps when the application calls the <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nf-commctrl-imagelist_destroy">ImageList_Destroy</a> function.
 * @param {HIMAGELIST} himl Type: <b>HIMAGELIST</b>
 * 
 * A handle to the image list.
 * @param {Integer} i Type: <b>int</b>
 * 
 * The index of the image.
 * @param {Pointer<IMAGEINFO>} pImageInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/commoncontrols/ns-commoncontrols-imageinfo">IMAGEINFO</a>*</b>
 * 
 * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/commoncontrols/ns-commoncontrols-imageinfo">IMAGEINFO</a> structure that receives information about the image. The information in this structure can be used to directly manipulate the bitmaps for the image.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Returns nonzero if successful, or zero otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-imagelist_getimageinfo
 * @since windows6.0.6000
 */
export ImageList_GetImageInfo(himl, i, pImageInfo) {
    result := DllCall("COMCTL32.dll\ImageList_GetImageInfo", HIMAGELIST, himl, "int", i, IMAGEINFO.Ptr, pImageInfo, BOOL)
    return result
}

/**
 * Creates a new image by combining two existing images. The function also creates a new image list in which to store the image.
 * @remarks
 * The new image consists of the second existing image drawn transparently over the first. The mask for the new image is the result of performing a logical OR operation on the masks of the two existing images.
 * @param {HIMAGELIST} himl1 Type: <b>HIMAGELIST</b>
 * 
 * A handle to the first image list.
 * @param {Integer} i1 Type: <b>int</b>
 * 
 * The index of the first existing image.
 * @param {HIMAGELIST} himl2 Type: <b>HIMAGELIST</b>
 * 
 * A handle to the second image list.
 * @param {Integer} i2 Type: <b>int</b>
 * 
 * The index of the second existing image.
 * @param {Integer} dx Type: <b>int</b>
 * 
 * The x-offset of the second image relative to the first image.
 * @param {Integer} dy Type: <b>int</b>
 * 
 * The y-offset of the second image relative to the first image.
 * @returns {HIMAGELIST} Type: <b>HIMAGELIST</b>
 * 
 * Returns the handle to the new image list if successful, or <b>NULL</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-imagelist_merge
 * @since windows6.0.6000
 */
export ImageList_Merge(himl1, i1, himl2, i2, dx, dy) {
    result := DllCall("COMCTL32.dll\ImageList_Merge", HIMAGELIST, himl1, "int", i1, HIMAGELIST, himl2, "int", i2, "int", dx, "int", dy, HIMAGELIST.Owned)
    return result
}

/**
 * Creates a duplicate of an existing image list.
 * @param {HIMAGELIST} himl Type: <b>HIMAGELIST</b>
 * 
 * A handle to the image list to be duplicated. All information contained in the original image list for normal images is copied to the new image list. Overlay images are not copied.
 * @returns {HIMAGELIST} Type: <b>HIMAGELIST</b>
 * 
 * Returns the handle to the new duplicate image list if successful, or <b>NULL</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-imagelist_duplicate
 * @since windows6.0.6000
 */
export ImageList_Duplicate(himl) {
    result := DllCall("COMCTL32.dll\ImageList_Duplicate", HIMAGELIST, himl, HIMAGELIST.Owned)
    return result
}

/**
 * Retrieves a pointer to an IImageList or IImageList2 object that corresponds to the image list's HIMAGELIST handle.
 * @param {HIMAGELIST} himl Type: <b>HIMAGELIST</b>
 * 
 * The handle to the image list.
 * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
 * 
 * The identifier of the interface being requested. Normally IID_IImageList or IID_IImageList2.
 * @returns {Pointer<Void>} Type: <b>void**</b>
 * 
 * When this method returns, contains the address of the interface pointer requested in <i>riid</i>. If the object does not support the interface specified in <i>riid</i>, <i>ppv</i> is <b>NULL</b>.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-himagelist_queryinterface
 * @since windows6.0.6000
 */
export HIMAGELIST_QueryInterface(himl, riid) {
    result := DllCall("COMCTL32.dll\HIMAGELIST_QueryInterface", HIMAGELIST, himl, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
    return ppv
}

/**
 * Creates a toolbar window and adds the specified buttons to the toolbar.
 * @remarks
 * Windows 95: The system can support a maximum of 16,364 window handles.
 * @param {HWND} _hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * Handle to the parent window for the toolbar.
 * @param {Integer} ws Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
 * 
 * Window styles for the toolbar. The <a href="https://docs.microsoft.com/windows/desktop/winmsg/window-styles">WS_CHILD</a> style is included by default. This parameter can also include a combination of styles as discussed in <a href="https://docs.microsoft.com/windows/desktop/Controls/toolbar-control-and-button-styles">Toolbar Control and Button Styles</a>.
 * @param {Integer} wID Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * Control identifier for the toolbar.
 * @param {Integer} nBitmaps Type: <b>int</b>
 * 
 * Number of button images contained in the bitmap specified by 
 * 					<i>hBMInst</i> and 
 * 					<i>wBMID</i>.
 * @param {HINSTANCE} hBMInst Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HINSTANCE</a></b>
 * 
 * Module instance with the executable file that contains the bitmap resource.
 * @param {Pointer} wBMID Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT_PTR</a></b>
 * 
 * Resource identifier for the bitmap resource. If 
 * 					<i>hBMInst</i> is <b>NULL</b>, this parameter must be a valid bitmap handle.
 * @param {Pointer<TBBUTTON>} lpButtons Type: <b>LPCTBBUTTON</b>
 * 
 * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-tbbutton">TBBUTTON</a> structures that contain information about the buttons to add to the toolbar.
 * @param {Integer} iNumButtons Type: <b>int</b>
 * 
 * Number of buttons to add to the toolbar.
 * @param {Integer} dxButton Type: <b>int</b>
 * 
 * Width, in pixels, of the buttons to add to the toolbar.
 * @param {Integer} dyButton Type: <b>int</b>
 * 
 * Height, in pixels, of the buttons to add to the toolbar.
 * @param {Integer} dxBitmap Type: <b>int</b>
 * 
 * Width, in pixels, of the button images to add to the buttons in the toolbar.
 * @param {Integer} dyBitmap Type: <b>int</b>
 * 
 * Height, in pixels, of the button images to add to the buttons in the toolbar.
 * @param {Integer} uStructSize Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * Size of a <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-tbbutton">TBBUTTON</a> structure.
 * @returns {HWND} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * Returns the window handle to the toolbar if successful, or <b>NULL</b> otherwise. To retrieve extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-createtoolbarex
 * @since windows6.0.6000
 */
export CreateToolbarEx(_hwnd, ws, wID, nBitmaps, hBMInst, wBMID, lpButtons, iNumButtons, dxButton, dyButton, dxBitmap, dyBitmap, uStructSize) {
    A_LastError := 0

    result := DllCall("COMCTL32.dll\CreateToolbarEx", HWND, _hwnd, "uint", ws, "uint", wID, "int", nBitmaps, HINSTANCE, hBMInst, "ptr", wBMID, TBBUTTON.Ptr, lpButtons, "int", iNumButtons, "int", dxButton, "int", dyButton, "int", dxBitmap, "int", dyBitmap, "uint", uStructSize, HWND)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Creates a bitmap for use in a toolbar.
 * @remarks
 * The function creates a new bitmap using the bitmap data and colors specified by the bitmap resource and the color mapping information. 
 * 
 * This function is fully supported only for images with color maps; that is, images with 256 or fewer colors.
 * @param {HINSTANCE} _hInstance Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HINSTANCE</a></b>
 * 
 * Handle to the module instance with the executable file that contains the bitmap resource.
 * @param {Pointer} idBitmap Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT_PTR</a></b>
 * 
 * Resource identifier of the bitmap resource.
 * @param {Integer} wFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * Bitmap flag. This parameter can be zero or the following value: 
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="CMB_MASKED"></a><a id="cmb_masked"></a><dl>
 * <dt><b>CMB_MASKED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Uses a bitmap as a mask.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<COLORMAP>} lpColorMap Type: <b>LPCOLORMAP</b>
 * 
 * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-colormap">COLORMAP</a> structure that contains the color information needed to map the bitmaps. If this parameter is <b>NULL</b>, the function uses the default color map.
 * @param {Integer} iNumMaps Type: <b>int</b>
 * 
 * Number of color maps pointed to by 
 * 					<i>lpColorMap</i>.
 * @returns {HBITMAP} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HBITMAP</a></b>
 * 
 * Returns the handle to the bitmap if successful, or <b>NULL</b> otherwise. To retrieve extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-createmappedbitmap
 * @since windows6.0.6000
 */
export CreateMappedBitmap(_hInstance, idBitmap, wFlags, lpColorMap, iNumMaps) {
    A_LastError := 0

    result := DllCall("COMCTL32.dll\CreateMappedBitmap", HINSTANCE, _hInstance, "ptr", idBitmap, "uint", wFlags, COLORMAP.Ptr, lpColorMap, "int", iNumMaps, HBITMAP.Owned)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The DrawStatusText function draws the specified text in the style of a status window with borders. (ANSI)
 * @remarks
 * Normal windows display text left-to-right (LTR). Windows can be <i>mirrored</i> to display languages such as Hebrew or Arabic that read right-to-left (RTL). Normally, the <i>pszText</i> string will be displayed in the same direction as the text in its parent window. If SBT_RTLREADING is set, the <i>pszText</i> string will read in the opposite direction from the text in the parent window.
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The commctrl.h header defines DrawStatusText as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HDC} _hDC Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a></b>
 * 
 * Handle to the display context for the window.
 * @param {Pointer<RECT>} lprc Type: <b>LPCRECT</b>
 * 
 * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains the position, in client coordinates, of the rectangle in which the text is drawn. The function draws the borders just inside the edges of the specified rectangle.
 * @param {PSTR} pszText Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCTSTR</a></b>
 * 
 * Pointer to a null-terminated string that specifies the text to display. Tab characters in the string determine whether the string is left-aligned, right-aligned, or centered.
 * @param {Integer} uFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * Text drawing flags. This parameter can be a combination of these values: 
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SBT_NOBORDERS"></a><a id="sbt_noborders"></a><dl>
 * <dt><b>SBT_NOBORDERS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Prevents borders from being drawn around the specified text.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SBT_POPOUT"></a><a id="sbt_popout"></a><dl>
 * <dt><b>SBT_POPOUT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Draws highlighted borders that make the text stand out.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SBT_RTLREADING"></a><a id="sbt_rtlreading"></a><dl>
 * <dt><b>SBT_RTLREADING</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Indicates that the string pointed to by 
 * 						<i>pszText</i> will be displayed in the opposite direction to the text in the parent window. 
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-drawstatustexta
 * @since windows6.0.6000
 */
export DrawStatusTextA(_hDC, lprc, pszText, uFlags) {
    pszText := pszText is String ? StrPtr(pszText) : pszText

    DllCall("COMCTL32.dll\DrawStatusTextA", HDC, _hDC, RECT.Ptr, lprc, "ptr", pszText, "uint", uFlags)
}

/**
 * The DrawStatusText function draws the specified text in the style of a status window with borders. (Unicode)
 * @remarks
 * Normal windows display text left-to-right (LTR). Windows can be <i>mirrored</i> to display languages such as Hebrew or Arabic that read right-to-left (RTL). Normally, the <i>pszText</i> string will be displayed in the same direction as the text in its parent window. If SBT_RTLREADING is set, the <i>pszText</i> string will read in the opposite direction from the text in the parent window.
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The commctrl.h header defines DrawStatusText as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HDC} _hDC Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a></b>
 * 
 * Handle to the display context for the window.
 * @param {Pointer<RECT>} lprc Type: <b>LPCRECT</b>
 * 
 * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains the position, in client coordinates, of the rectangle in which the text is drawn. The function draws the borders just inside the edges of the specified rectangle.
 * @param {PWSTR} pszText Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCTSTR</a></b>
 * 
 * Pointer to a null-terminated string that specifies the text to display. Tab characters in the string determine whether the string is left-aligned, right-aligned, or centered.
 * @param {Integer} uFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * Text drawing flags. This parameter can be a combination of these values: 
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SBT_NOBORDERS"></a><a id="sbt_noborders"></a><dl>
 * <dt><b>SBT_NOBORDERS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Prevents borders from being drawn around the specified text.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SBT_POPOUT"></a><a id="sbt_popout"></a><dl>
 * <dt><b>SBT_POPOUT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Draws highlighted borders that make the text stand out.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SBT_RTLREADING"></a><a id="sbt_rtlreading"></a><dl>
 * <dt><b>SBT_RTLREADING</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Indicates that the string pointed to by 
 * 						<i>pszText</i> will be displayed in the opposite direction to the text in the parent window. 
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-drawstatustextw
 * @since windows6.0.6000
 */
export DrawStatusTextW(_hDC, lprc, pszText, uFlags) {
    pszText := pszText is String ? StrPtr(pszText) : pszText

    DllCall("COMCTL32.dll\DrawStatusTextW", HDC, _hDC, RECT.Ptr, lprc, "ptr", pszText, "uint", uFlags)
}

/**
 * Creates a status window, which is typically used to display the status of an application. (ANSI)
 * @remarks
 * The <b>CreateStatusWindow</b> function calls the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-createwindowa">CreateWindow</a> function to create the window. It passes the parameters to  without modification and sets the position, width, and height parameters to <b>CreateWindow</b> default values. 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The commctrl.h header defines CreateStatusWindow as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Integer} style Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
 * 
 * Window styles for the status window. This parameter must include the <a href="https://docs.microsoft.com/windows/desktop/winmsg/window-styles">WS_CHILD</a> style and should also include the <a href="https://docs.microsoft.com/windows/desktop/winmsg/window-styles">WS_VISIBLE</a> style.
 * @param {PSTR} lpszText Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCTSTR</a></b>
 * 
 * Pointer to a null-terminated string that specifies the status text for the first part.
 * @param {HWND} hwndParent Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * handle to the parent window.
 * @param {Integer} wID Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * Control identifier for the status window. The window procedure uses this value to identify messages it sends to the parent window.
 * @returns {HWND} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * Returns the handle to the status window if successful, or <b>NULL</b> otherwise. To retrieve extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-createstatuswindowa
 * @since windows6.0.6000
 */
export CreateStatusWindowA(style, lpszText, hwndParent, wID) {
    lpszText := lpszText is String ? StrPtr(lpszText) : lpszText

    A_LastError := 0

    result := DllCall("COMCTL32.dll\CreateStatusWindowA", "int", style, "ptr", lpszText, HWND, hwndParent, "uint", wID, HWND)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Creates a status window, which is typically used to display the status of an application. (Unicode)
 * @remarks
 * The <b>CreateStatusWindow</b> function calls the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-createwindowa">CreateWindow</a> function to create the window. It passes the parameters to  without modification and sets the position, width, and height parameters to <b>CreateWindow</b> default values. 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The commctrl.h header defines CreateStatusWindow as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Integer} style Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
 * 
 * Window styles for the status window. This parameter must include the <a href="https://docs.microsoft.com/windows/desktop/winmsg/window-styles">WS_CHILD</a> style and should also include the <a href="https://docs.microsoft.com/windows/desktop/winmsg/window-styles">WS_VISIBLE</a> style.
 * @param {PWSTR} lpszText Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCTSTR</a></b>
 * 
 * Pointer to a null-terminated string that specifies the status text for the first part.
 * @param {HWND} hwndParent Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * handle to the parent window.
 * @param {Integer} wID Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * Control identifier for the status window. The window procedure uses this value to identify messages it sends to the parent window.
 * @returns {HWND} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * Returns the handle to the status window if successful, or <b>NULL</b> otherwise. To retrieve extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-createstatuswindoww
 * @since windows6.0.6000
 */
export CreateStatusWindowW(style, lpszText, hwndParent, wID) {
    lpszText := lpszText is String ? StrPtr(lpszText) : lpszText

    A_LastError := 0

    result := DllCall("COMCTL32.dll\CreateStatusWindowW", "int", style, "ptr", lpszText, HWND, hwndParent, "uint", wID, HWND)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Processes WM_MENUSELECT and WM_COMMAND messages and displays Help text about the current menu in the specified status window.
 * @remarks
 * The <b>MenuHelp</b> function is a helper function. Helper functions are available as a convenience to programming. They combine into one call a sequence of frequently used calls. You use <b>MenuHelp</b> to send <a href="https://docs.microsoft.com/windows/desktop/menurc/wm-menuselect">WM_MENUSELECT</a> and <a href="https://docs.microsoft.com/windows/desktop/menurc/wm-command">WM_COMMAND</a> messages.
 * @param {Integer} uMsg Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * Message being processed. This can be either <a href="https://docs.microsoft.com/windows/desktop/menurc/wm-menuselect">WM_MENUSELECT</a> or <a href="https://docs.microsoft.com/windows/desktop/menurc/wm-command">WM_COMMAND</a>.
 * @param {WPARAM} _wParam Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WPARAM</a></b>
 * 
 * wParam of the message specified in 
 * 					<i>uMsg</i>.
 * @param {LPARAM} _lParam Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPARAM</a></b>
 * 
 * lParam of the message specified in 
 * 					<i>uMsg</i>.
 * @param {HMENU} hMainMenu Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HMENU</a></b>
 * 
 * Handle to the application's main menu.
 * @param {HINSTANCE} hInst Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HINSTANCE</a></b>
 * 
 * Handle to the module that contains the string resources.
 * @param {HWND} hwndStatus Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * Handle to the status window.
 * @param {Pointer<Integer>} lpwIDs Type: <b>LPUINT</b>
 * 
 * Pointer to an array of values that contains pairs of string resource identifiers and menu handles. The function searches the array for the handle to the selected menu and, if found, uses the corresponding resource identifier to load the appropriate Help string.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-menuhelp
 * @since windows6.0.6000
 */
export MenuHelp(uMsg, _wParam, _lParam, hMainMenu, hInst, hwndStatus, lpwIDs) {
    lpwIDsMarshal := lpwIDs is VarRef ? "uint*" : "ptr"

    DllCall("COMCTL32.dll\MenuHelp", "uint", uMsg, WPARAM, _wParam, LPARAM, _lParam, HMENU, hMainMenu, HINSTANCE, hInst, HWND, hwndStatus, lpwIDsMarshal, lpwIDs)
}

/**
 * Sets or removes the specified menu item's check mark attribute and shows or hides the corresponding control.
 * @param {HWND} _hWnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * A handle to the window that contains the menu and controls.
 * @param {Pointer} uFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT_PTR</a></b>
 * 
 * The identifier of the menu item to receive or lose a check mark.
 * @param {Pointer<Integer>} lpInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPINT</a></b>
 * 
 * A pointer to an array that contains pairs of values. The second value in the first pair must be the handle to the application's main menu. Each subsequent pair consists of a menu item identifier and a control window identifier. The function searches the array for a value that matches <i>uFlags</i> and, if the value is found, checks or unchecks the menu item and shows or hides the corresponding control.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Returns nonzero if successful, or zero otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-showhidemenuctl
 * @since windows6.0.6000
 */
export ShowHideMenuCtl(_hWnd, uFlags, lpInfo) {
    lpInfoMarshal := lpInfo is VarRef ? "int*" : "ptr"

    result := DllCall("COMCTL32.dll\ShowHideMenuCtl", HWND, _hWnd, "ptr", uFlags, lpInfoMarshal, lpInfo, BOOL)
    return result
}

/**
 * Calculates the dimensions of a rectangle in the client area that contains all the specified controls.
 * @remarks
 * If a window in the <i>lprc</i> array is visible, or will be visible when its parent becomes visible, its rectangle is subtracted from the effective client rectangle.
 * @param {HWND} _hWnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * A handle to the window that has the client area to check.
 * @param {Pointer<RECT>} lprc Type: <b>LPRECT</b>
 * 
 * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that receives the dimensions of the rectangle.
 * @param {Pointer<Integer>} lpInfo Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a>*</b>
 * 
 * A pointer to a null-terminated array of integers that identify controls in the client area. Each control requires a pair of consecutive elements. The first element of the pair must be nonzero and the second element of the pair must be the control identifier. The first pair represents the menu and is ignored. The last element must be zero to identify the end of the array.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-geteffectiveclientrect
 * @since windows6.0.6000
 */
export GetEffectiveClientRect(_hWnd, lprc, lpInfo) {
    lpInfoMarshal := lpInfo is VarRef ? "int*" : "ptr"

    DllCall("COMCTL32.dll\GetEffectiveClientRect", HWND, _hWnd, RECT.Ptr, lprc, lpInfoMarshal, lpInfo)
}

/**
 * Changes the specified single-selection list box to a drag list box.
 * @param {HWND} hLB Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * A handle to the single-selection list box.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Returns nonzero if successful, or zero otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-makedraglist
 * @since windows6.0.6000
 */
export MakeDragList(hLB) {
    result := DllCall("COMCTL32.dll\MakeDragList", HWND, hLB, BOOL)
    return result
}

/**
 * Draws the insert icon in the parent window of the specified drag list box.
 * @param {HWND} handParent Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * A handle to the parent window of the drag list box.
 * @param {HWND} hLB Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * A handle to the drag list box.
 * @param {Integer} nItem Type: <b>int</b>
 * 
 * The identifier of the icon item to be drawn.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-drawinsert
 * @since windows6.0.6000
 */
export DrawInsert(handParent, hLB, nItem) {
    DllCall("COMCTL32.dll\DrawInsert", HWND, handParent, HWND, hLB, "int", nItem)
}

/**
 * Retrieves the index of the item at the specified point in a list box.
 * @remarks
 * The <b>LBItemFromPt</b> function only scrolls the list box if a minimum amount of time has passed since it last did so. Timing prevents the list box from scrolling too quickly if the function is called repeatedly in rapid succession—for example, when <a href="https://docs.microsoft.com/windows/desktop/Controls/dl-dragging">DL_DRAGGING</a> notification codes or <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-mousemove">WM_MOUSEMOVE</a> messages are processed. 
 * 
 * If the specified point is outside the client area of the list box and 
 * 				<i>bAutoScroll</i> is <b>TRUE</b>, the function scrolls the list box instead of returning an item identifier.
 * @param {HWND} hLB Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * A handle to the list box to check.
 * @param {POINT} pt Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a></b>
 * 
 * A <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a> structure that contains the screen coordinates to check.
 * @param {BOOL} bAutoScroll Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * A scroll flag. If this parameter is <b>TRUE</b> and the point is directly above or below the list box, the function scrolls the list box by one line and returns -1. Otherwise, the function does not scroll the list box.
 * @returns {Integer} Type: <b>int</b>
 * 
 * Returns the item identifier if the point is over a list item, or -1 otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-lbitemfrompt
 * @since windows6.0.6000
 */
export LBItemFromPt(hLB, pt, bAutoScroll) {
    result := DllCall("COMCTL32.dll\LBItemFromPt", HWND, hLB, POINT, pt, BOOL, bAutoScroll, Int32)
    return result
}

/**
 * Creates an up-down control. Note:\_This function is obsolete. It is a 16 bit function and cannot handle 32 bit values for range and position.
 * @param {Integer} dwStyle Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
 * 
 * Window styles for the control. This parameter should include the <a href="https://docs.microsoft.com/windows/desktop/winmsg/window-styles">WS_CHILD</a>, <a href="https://docs.microsoft.com/windows/desktop/winmsg/window-styles">WS_BORDER</a>, and <a href="https://docs.microsoft.com/windows/desktop/winmsg/window-styles">WS_VISIBLE</a> styles, and it may include any of the window styles specific to the up-down control.
 * @param {Integer} x Type: <b>int</b>
 * 
 * Horizontal coordinate, in client coordinates, of the upper-left corner of the control.
 * @param {Integer} y Type: <b>int</b>
 * 
 * Vertical coordinate, in client coordinates, of the upper-left corner of the control.
 * @param {Integer} cx Type: <b>int</b>
 * 
 * Width, in pixels, of the up-down control.
 * @param {Integer} _cy Type: <b>int</b>
 * 
 * Height, in pixels, of the up-down control.
 * @param {HWND} hParent Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * Handle to the parent window of the up-down control.
 * @param {Integer} nID Type: <b>int</b>
 * 
 * Identifier for the up-down control.
 * @param {HINSTANCE} hInst Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HINSTANCE</a></b>
 * 
 * Handle to the module instance of the application creating the up-down control.
 * @param {HWND} hBuddy Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * Handle to the window associated with the up-down control. If this parameter is <b>NULL</b>, the control has no buddy window.
 * @param {Integer} nUpper Type: <b>int</b>
 * 
 * Upper limit (range) of the up-down control.
 * @param {Integer} nLower Type: <b>int</b>
 * 
 * Lower limit (range) of the up-down control.
 * @param {Integer} nPos Type: <b>int</b>
 * 
 * Position of the control.
 * @returns {HWND} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * If the function succeeds, the return value is the window handle to the up-down control. If the function fails, the return value is <b>NULL</b>.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-createupdowncontrol
 * @since windows6.0.6000
 */
export CreateUpDownControl(dwStyle, x, y, cx, _cy, hParent, nID, hInst, hBuddy, nUpper, nLower, nPos) {
    result := DllCall("COMCTL32.dll\CreateUpDownControl", "uint", dwStyle, "int", x, "int", y, "int", cx, "int", _cy, HWND, hParent, "int", nID, HINSTANCE, hInst, HWND, hBuddy, "int", nUpper, "int", nLower, "int", nPos, HWND)
    return result
}

/**
 * The TaskDialogIndirect function creates, displays, and operates a task dialog.
 * @remarks
 * When you use a task dialog box to indicate that the system is low on memory, the strings pointed to by the various string and icon members in the <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-taskdialogconfig">TASKDIALOGCONFIG</a> structure should not be taken from a resource file since an attempt to load the resource may fail.
 * 
 *  If you create a task dialog while a dialog box is present, use a handle to the dialog box as the <i>hWndParent</i> parameter. The <i>hWndParent</i> parameter should not identify a child window, such as a control in a dialog box. 
 * 
 * The parent window should not be hidden or disabled when this function is called. 
 * 
 * 
 * ```
 * 
 * int nButtonPressed                  = 0;
 * TASKDIALOGCONFIG config             = {0};
 * const TASKDIALOG_BUTTON buttons[]   = { 
 *                                         { IDOK, L"Change password" }
 *                                       };
 * config.cbSize                       = sizeof(config);
 * config.hInstance                    = hInst;
 * config.dwCommonButtons              = TDCBF_CANCEL_BUTTON;
 * config.pszMainIcon                  = TD_WARNING_ICON;
 * config.pszMainInstruction           = L"Change Password";
 * config.pszContent                   = L"Remember your changed password.";
 * config.pButtons                     = buttons;
 * config.cButtons                     = ARRAYSIZE(buttons);
 * 
 * TaskDialogIndirect(&config, &nButtonPressed, NULL, NULL);
 * switch (nButtonPressed)
 * {
 *     case IDOK:
 *         break; // the user pressed button 0 (change password).
 *     case IDCANCEL:
 *         break; // user canceled the dialog
 *     default:
 *         break; // should never happen
 * }
 * ```
 * @param {Pointer<TASKDIALOGCONFIG>} pTaskConfig Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-taskdialogconfig">TASKDIALOGCONFIG</a>*</b>
 * 
 * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-taskdialogconfig">TASKDIALOGCONFIG</a> structure that contains information used to display the task dialog.
 * @param {Pointer<Integer>} pnButton Type: <b>int*</b>
 * 
 * Address of a variable that receives either:
 * 				<ul>
 * <li>one of the button IDs specified in the <b>pButtons</b> member of the <i>pTaskConfig</i> parameter</li>
 * @param {Pointer<Integer>} pnRadioButton Type: <b>int*</b>
 * 
 * Address of a variable that receives one of the button IDs specified in the <b>pRadioButtons</b> member of the <i>pTaskConfig</i> parameter. If this parameter is <b>NULL</b>, no value is returned.
 * @param {Pointer<BOOL>} pfVerificationFlagChecked Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * This function can return one of these values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>S_OK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The operation completed successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_OUTOFMEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * There is insufficient memory to complete the operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One or more arguments are not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_FAIL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The operation failed.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-taskdialogindirect
 * @since windows6.0.6000
 */
export TaskDialogIndirect(pTaskConfig, pnButton, pnRadioButton, pfVerificationFlagChecked) {
    pnButtonMarshal := pnButton is VarRef ? "int*" : "ptr"
    pnRadioButtonMarshal := pnRadioButton is VarRef ? "int*" : "ptr"
    pfVerificationFlagCheckedMarshal := pfVerificationFlagChecked is VarRef ? "int*" : "ptr"

    result := DllCall("COMCTL32.dll\TaskDialogIndirect", TASKDIALOGCONFIG.Ptr, pTaskConfig, pnButtonMarshal, pnButton, pnRadioButtonMarshal, pnRadioButton, pfVerificationFlagCheckedMarshal, pfVerificationFlagChecked, "HRESULT")
    return result
}

/**
 * The TaskDialog function creates, displays, and operates a task dialog.
 * @remarks
 * When you use a task dialog box to indicate that the system is low on memory, the strings pointed to by the <i>pszMainInstruction</i> and <i>pszWindowTitle</i> parameters should not be taken from a resource file since an attempt to load the resource may fail. 
 * 
 *  If you create a task dialog while a dialog box is present, use a handle to the dialog box as the <i>hWndParent</i> parameter. The <i>hWndParent</i> parameter should not identify a child window, such as a control in a dialog box. 
 * 
 * Because task dialog boxes use the correct system-defined UI elements, you should use them instead of using message boxes created with the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-messagebox">MessageBox</a> function. To achieve more functionality, use <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nf-commctrl-taskdialogindirect">TaskDialogIndirect</a>.
 * 
 * The following example code, to be included as part of a larger program, shows how to create a task dialog and capture input.
 * 			
 * 			
 * 
 * 
 * ```
 * 
 * int nButtonPressed = 0;
 * TaskDialog(NULL, hInst, 
 *     MAKEINTRESOURCE(IDS_APPLICATION_TITLE),
 *     MAKEINTRESOURCE(IDS_DOSOMETHING), 
 *     MAKEINTRESOURCE(IDS_SOMECONTENT), 
 *     TDCBF_OK_BUTTON | TDCBF_CANCEL_BUTTON,
 *     TD_WARNING_ICON, 
 *     &nButtonPressed);
 * 
 * if (IDOK == nButtonPressed)
 * {
 *     // OK button pressed
 * }
 * else if (IDCANCEL == nButtonPressed)
 * {
 *     // Cancel pressed
 * }
 * ```
 * @param {HWND} hwndOwner Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * Handle to the owner window of the task dialog to be created. If this parameter is <b>NULL</b>, the task dialog has no owner window.
 * @param {HINSTANCE} _hInstance Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HINSTANCE</a></b>
 * 
 * Handle to the module that contains the icon resource identified by the <i>pszIcon</i> member, and the string resources identified by the <i>pszWindowTitle</i> and <i>pszMainInstruction</i> members.  If this parameter is <b>NULL</b>, <i>pszIcon</i> must be <b>NULL</b> or a pointer to a null-terminated, Unicode string that contains a system resource identifier, for example, TD_ERROR_ICON.
 * @param {PWSTR} pszWindowTitle Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">PCWSTR</a></b>
 * 
 * Pointer to the string to be used for the task dialog title. This parameter is a null-terminated, Unicode string that contains either text, or an integer resource identifier passed through the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a> macro.  If this parameter is <b>NULL</b>, the filename of the executable program is used.
 * @param {PWSTR} pszMainInstruction Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">PCWSTR</a></b>
 * 
 * Pointer to the string to be used for the main instruction. This parameter is a null-terminated, Unicode string that contains either text, or an integer resource identifier passed through the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a> macro.  This parameter can be <b>NULL</b> if no main instruction is wanted.
 * @param {PWSTR} pszContent Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">PCWSTR</a></b>
 * 
 * Pointer to a string used for additional text that appears below the main instruction, in a smaller font. This parameter is a null-terminated, Unicode string that contains either text, or an integer resource identifier passed through the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a> macro. Can be <b>NULL</b> if no additional text is wanted.
 * @param {TASKDIALOG_COMMON_BUTTON_FLAGS} dwCommonButtons Type: <b>TASKDIALOG_COMMON_BUTTON_FLAGS</b>
 * 
 * Specifies the push buttons displayed in the dialog box. This parameter may be a combination of flags from the following group.
 * 
 * <div class="alert"><b>Note</b>  If no buttons are specified, the dialog box will contain the <b>OK</b> button by default.</div>
 * <div> </div>
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
 * The task dialog contains the push button: <b>Cancel</b>. This button must be specified for the dialog box to respond to typical cancel actions (Alt-F4 and Escape).
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
 * @param {PWSTR} pszIcon Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">PCWSTR</a></b>
 * 
 * Pointer to a string that identifies the icon to display in the task dialog. This parameter must be an integer resource identifier passed to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a> macro or one of the following predefined values. If this parameter is <b>NULL</b>, no icon will be displayed. If the <i>hInstance</i> parameter is <b>NULL</b> and one of the predefined values is not used, the <b>TaskDialog</b> function fails.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="TD_ERROR_ICON"></a><a id="td_error_icon"></a><dl>
 * <dt><b>TD_ERROR_ICON</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A stop-sign icon appears in the task dialog.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="TD_INFORMATION_ICON"></a><a id="td_information_icon"></a><dl>
 * <dt><b>TD_INFORMATION_ICON</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An icon consisting of a lowercase letter i in a circle appears in the task dialog.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="TD_SHIELD_ICON"></a><a id="td_shield_icon"></a><dl>
 * <dt><b>TD_SHIELD_ICON</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A security shield icon appears in the task dialog.
 * 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="TD_WARNING_ICON"></a><a id="td_warning_icon"></a><dl>
 * <dt><b>TD_WARNING_ICON</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An exclamation-point icon appears in the task dialog.
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {Integer} Type: <b>int*</b>
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-taskdialog
 * @since windows6.0.6000
 */
export TaskDialog(hwndOwner, _hInstance, pszWindowTitle, pszMainInstruction, pszContent, dwCommonButtons, pszIcon) {
    pszWindowTitle := pszWindowTitle is String ? StrPtr(pszWindowTitle) : pszWindowTitle
    pszMainInstruction := pszMainInstruction is String ? StrPtr(pszMainInstruction) : pszMainInstruction
    pszContent := pszContent is String ? StrPtr(pszContent) : pszContent
    pszIcon := pszIcon is String ? StrPtr(pszIcon) : pszIcon

    result := DllCall("COMCTL32.dll\TaskDialog", HWND, hwndOwner, HINSTANCE, _hInstance, "ptr", pszWindowTitle, "ptr", pszMainInstruction, "ptr", pszContent, TASKDIALOG_COMMON_BUTTON_FLAGS, dwCommonButtons, "ptr", pszIcon, "int*", &pnButton := 0, "HRESULT")
    return pnButton
}

/**
 * Enables an application to specify a language to be used with the common controls that is different from the system language.
 * @remarks
 * This function enables an application to override the system language setting, and specify a different language for the common controls. The selected language only applies to the process that <b>InitMUILanguage</b> is called from. See <a href="https://docs.microsoft.com/windows/desktop/Intl/international-support">Internationalization for Windows Applications</a> for further discussion of localization.
 * @param {Integer} uiLang Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LANGID</a></b>
 * 
 * The  <a href="https://docs.microsoft.com/windows/desktop/Intl/language-identifiers">language identifier</a> of the language to be used by the common controls.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-initmuilanguage
 * @since windows6.0.6000
 */
export InitMUILanguage(uiLang) {
    DllCall("COMCTL32.dll\InitMUILanguage", "ushort", uiLang)
}

/**
 * Gets the language currently in use by the common controls for a particular process.
 * @remarks
 * See <a href="https://docs.microsoft.com/windows/desktop/Intl/international-support">Internationalization for Windows Applications</a> for further discussion of localization.
 * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LANGID</a></b>
 * 
 * Returns the <a href="https://docs.microsoft.com/windows/desktop/Intl/language-identifiers">language identifier</a> of the language an application has specified for the common controls by calling <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nf-commctrl-initmuilanguage">InitMUILanguage</a>. <b>GetMUILanguage</b> returns the value for the process from which it is called. If 
 * 						<b>InitMUILanguage</b> has not been called or was not called from the same process, <b>GetMUILanguage</b> returns the language-neutral LANGID, <a href="https://docs.microsoft.com/windows/desktop/api/winnt/nf-winnt-makelangid">MAKELANGID</a>(LANG_NEUTRAL, SUBLANG_NEUTRAL).
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-getmuilanguage
 * @since windows6.0.6000
 */
export GetMUILanguage() {
    result := DllCall("COMCTL32.dll\GetMUILanguage", UInt16)
    return result
}

/**
 * Creates a dynamic structure array (DSA).
 * @remarks
 * Unlike a dynamic pointer array (DPA), a DSA can contain elements of any size. This allows structures to be stored directly in the array.
 * @param {Integer} cbItem Type: <b>int</b>
 * 
 * The size, in bytes, of the item.
 * @param {Integer} cItemGrow Type: <b>int</b>
 * 
 * The number of items by which the array should be incremented, if the DSA needs to be enlarged.
 * @returns {HDSA} Type: <b>HDSA</b>
 * 
 * Returns a handle to a DSA if successful, or <b>NULL</b> if the creation fails.
 * @see https://learn.microsoft.com/windows/win32/api/dpa_dsa/nf-dpa_dsa-dsa_create
 * @since windows6.0.6000
 */
export DSA_Create(cbItem, cItemGrow) {
    result := DllCall("COMCTL32.dll\DSA_Create", "int", cbItem, "int", cItemGrow, HDSA.Owned)
    return result
}

/**
 * Frees a dynamic structure array (DSA).
 * @param {HDSA} _hdsa Type: <b>HDSA</b>
 * 
 * A handle to a DSA to destroy.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Returns <b>TRUE</b> on success, <b>FALSE</b> on failure.
 * @see https://learn.microsoft.com/windows/win32/api/dpa_dsa/nf-dpa_dsa-dsa_destroy
 * @since windows6.0.6000
 */
export DSA_Destroy(_hdsa) {
    result := DllCall("COMCTL32.dll\DSA_Destroy", HDSA, _hdsa, BOOL)
    return result
}

/**
 * Iterates through a dynamic structure array (DSA), calling a specified callback function on each item. Upon reaching the end of the array, the DSA is freed.
 * @param {HDSA} _hdsa Type: <b>HDSA</b>
 * 
 * A handle to a DSA to walk and destroy.
 * @param {Pointer<PFNDAENUMCALLBACK>} pfnCB Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dpa_dsa/nc-dpa_dsa-pfndaenumcallback">PFNDSAENUMCALLBACK</a></b>
 * 
 * A callback function pointer. For the callback function prototype, see <a href="https://docs.microsoft.com/windows/desktop/api/dpa_dsa/nc-dpa_dsa-pfndaenumcallback">PFNDSAENUMCALLBACK</a>.
 * @param {Pointer<Void>} pData Type: <b>void*</b>
 * 
 * A callback data pointer. This pointer is, in turn, passed as a parameter to <i>pfnCB</i>.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/dpa_dsa/nf-dpa_dsa-dsa_destroycallback
 * @since windows6.0.6000
 */
export DSA_DestroyCallback(_hdsa, pfnCB, pData) {
    pDataMarshal := pData is VarRef ? "ptr" : "ptr"

    DllCall("COMCTL32.dll\DSA_DestroyCallback", HDSA, _hdsa, "ptr", pfnCB, pDataMarshal, pData)
}

/**
 * Deletes an item from a dynamic structure array (DSA).
 * @remarks
 * <b>DSA_DeleteItem</b> is not exported by name. To use it, you must use <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> and request ordinal 326 from ComCtl32.dll to obtain a function pointer.
 * @param {HDSA} _hdsa Type: <b>HDSA</b>
 * 
 * A handle to an existing DSA.
 * @param {Integer} i Type: <b>int</b>
 * 
 * The zero-based index of the item to delete.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * <b>TRUE</b> if the item was successfully deleted; otherwise, <b>FALSE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/dpa_dsa/nf-dpa_dsa-dsa_deleteitem
 * @since windows6.0.6000
 */
export DSA_DeleteItem(_hdsa, i) {
    result := DllCall("COMCTL32.dll\DSA_DeleteItem", HDSA, _hdsa, "int", i, BOOL)
    return result
}

/**
 * Deletes all items from a dynamic structure array (DSA).
 * @param {HDSA} _hdsa Type: <b>HDSA</b>
 * 
 * A handle to an existing DSA.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * <b>TRUE</b> if the items were successfully deleted; otherwise, <b>FALSE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/dpa_dsa/nf-dpa_dsa-dsa_deleteallitems
 * @since windows6.0.6000
 */
export DSA_DeleteAllItems(_hdsa) {
    result := DllCall("COMCTL32.dll\DSA_DeleteAllItems", HDSA, _hdsa, BOOL)
    return result
}

/**
 * Iterates through the dynamic structure array (DSA) and calls pfnCB on each item.
 * @param {HDSA} _hdsa Type: <b>HDSA</b>
 * 
 * A handle to an existing DSA.
 * @param {Pointer<PFNDAENUMCALLBACK>} pfnCB Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dpa_dsa/nc-dpa_dsa-pfndaenumcallback">PFNDAENUMCALLBACK</a>*</b>
 * 
 * A callback function pointer. See <a href="https://docs.microsoft.com/windows/desktop/api/dpa_dsa/nc-dpa_dsa-pfndaenumcallback">PFNDSAENUMCALLBACK</a> for the callback function prototype.
 * @param {Pointer<Void>} pData Type: <b>void*</b>
 * 
 * A callback data pointer. <i>pData</i> is passed as a parameter to <i>pfnCB</i>.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/dpa_dsa/nf-dpa_dsa-dsa_enumcallback
 * @since windows6.0.6000
 */
export DSA_EnumCallback(_hdsa, pfnCB, pData) {
    pDataMarshal := pData is VarRef ? "ptr" : "ptr"

    DllCall("COMCTL32.dll\DSA_EnumCallback", HDSA, _hdsa, "ptr", pfnCB, pDataMarshal, pData)
}

/**
 * Inserts a new item into a dynamic structure array (DSA). If necessary, the DSA expands to accommodate the new item.
 * @remarks
 * The actual data pointed to by <i>pItem</i> is copied into the DSA. Subsequent actions performed on that item do not affect the original copy.
 * @param {HDSA} _hdsa Type: <b>HDSA</b>
 * 
 * A handle to the DSA in which to insert the item.
 * @param {Integer} i Type: <b>int</b>
 * 
 * The position in the DSA where new item is to be inserted, or DSA_APPEND to insert the item at the end of the array.
 * @param {Pointer<Void>} pitem Type: <b>void*</b>
 * 
 * A pointer to the item that is to be inserted.
 * @returns {Integer} Type: <b>int</b>
 * 
 * Returns the index of the new item if the insertion succeeds, or DSA_ERR (<c>-1</c>) if the insertion fails.
 * @see https://learn.microsoft.com/windows/win32/api/dpa_dsa/nf-dpa_dsa-dsa_insertitem
 * @since windows6.0.6000
 */
export DSA_InsertItem(_hdsa, i, pitem) {
    pitemMarshal := pitem is VarRef ? "ptr" : "ptr"

    result := DllCall("COMCTL32.dll\DSA_InsertItem", HDSA, _hdsa, "int", i, pitemMarshal, pitem, Int32)
    return result
}

/**
 * Gets a pointer to an element from a dynamic structure array (DSA).
 * @remarks
 * Using the element pointer that this function returns, you can modify the data in that element directly. However, be aware that a subsequent insert or destroy operation could cause this pointer value to become invalid or to point to a different element.
 * @param {HDSA} _hdsa Type: <b>HDSA</b>
 * 
 * A handle to the DSA containing the element.
 * @param {Integer} i Type: <b>int</b>
 * 
 * The index of the element to be retrieved (zero-based).
 * @returns {Pointer<Void>} Returns a pointer to the specified element or <b>NULL</b> if the call fails.
 * @see https://learn.microsoft.com/windows/win32/api/dpa_dsa/nf-dpa_dsa-dsa_getitemptr
 * @since windows6.0.6000
 */
export DSA_GetItemPtr(_hdsa, i) {
    result := DllCall("COMCTL32.dll\DSA_GetItemPtr", HDSA, _hdsa, "int", i, IntPtr)
    return result
}

/**
 * Gets an element from a dynamic structure array (DSA).
 * @remarks
 * <b>DSA_GetItem</b> is not exported by name. To use it, you must use <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> and request ordinal 322 from ComCtl32.dll to obtain a function pointer.
 * 
 * Using the element pointer that this function retrieves, you can modify the data in that element directly. However, be aware that a subsequent insert or destroy operation could cause this pointer value to become invalid or to point to a different element.
 * @param {HDSA} _hdsa Type: <b>HDSA</b>
 * 
 * A handle to the DSA containing the element.
 * @param {Integer} i Type: <b>int</b>
 * 
 * The index of the element to be retrieved (zero-based).
 * @param {Pointer<Void>} pitem Type: <b>void*</b>
 * 
 * A pointer to a buffer which is filled with a copy of the specified element of the DSA.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Returns <b>TRUE</b> if successful or <b>FALSE</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/dpa_dsa/nf-dpa_dsa-dsa_getitem
 * @since windows6.0.6000
 */
export DSA_GetItem(_hdsa, i, pitem) {
    pitemMarshal := pitem is VarRef ? "ptr" : "ptr"

    result := DllCall("COMCTL32.dll\DSA_GetItem", HDSA, _hdsa, "int", i, pitemMarshal, pitem, BOOL)
    return result
}

/**
 * Sets the contents of an element in a dynamic structure array (DSA).
 * @remarks
 * <b>DSA_SetItem</b> is not exported by name. To use it, you must use <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> and request ordinal 325 from ComCtl32.dll to obtain a function pointer.
 * @param {HDSA} _hdsa Type: <b>HDSA</b>
 * 
 * A handle to an existing DSA that contains the element.
 * @param {Integer} i Type: <b>int</b>
 * 
 * The zero-based index of the item to set.
 * @param {Pointer<Void>} pitem Type: <b>void*</b>
 * 
 * A pointer to the item that will replace the specified item in the array.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * <b>TRUE</b> if successful; otherwise, <b>FALSE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/dpa_dsa/nf-dpa_dsa-dsa_setitem
 * @since windows6.0.6000
 */
export DSA_SetItem(_hdsa, i, pitem) {
    pitemMarshal := pitem is VarRef ? "ptr" : "ptr"

    result := DllCall("COMCTL32.dll\DSA_SetItem", HDSA, _hdsa, "int", i, pitemMarshal, pitem, BOOL)
    return result
}

/**
 * Duplicates a dynamic structure array (DSA).
 * @remarks
 * The clone consists of a copy of the structures stored in the original DSA. Subsequent changes to the original DSA do not affect the clone.
 * @param {HDSA} _hdsa Type: <b>HDSA</b>
 * 
 * A handle to an existing DSA.
 * @returns {HDSA} Type: <b>HDSA</b>
 * 
 * Returns a handle to the clone, or <b>NULL</b> if the operation fails.
 * @see https://learn.microsoft.com/windows/win32/api/dpa_dsa/nf-dpa_dsa-dsa_clone
 * @since windows6.0.6000
 */
export DSA_Clone(_hdsa) {
    result := DllCall("COMCTL32.dll\DSA_Clone", HDSA, _hdsa, HDSA.Owned)
    return result
}

/**
 * Gets the size of the dynamic structure array (DSA).
 * @param {HDSA} _hdsa Type: <b>HDSA</b>
 * 
 * A handle to an existing DSA.
 * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">ULONGLONG</a></b>
 * 
 * Returns the size of the DSA, including the internal bookkeeping information, in bytes. If <i>hdsa</i> is <b>NULL</b>, the function returns zero.
 * @see https://learn.microsoft.com/windows/win32/api/dpa_dsa/nf-dpa_dsa-dsa_getsize
 * @since windows6.0.6000
 */
export DSA_GetSize(_hdsa) {
    result := DllCall("COMCTL32.dll\DSA_GetSize", HDSA, _hdsa, Int64)
    return result
}

/**
 * Sorts the items in a dynamic structure array (DSA).
 * @param {HDSA} pdsa Type: <b>HDSA</b>
 * 
 * A handle to an existing DSA.
 * @param {Pointer<PFNDACOMPARE>} pfnCompare Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dpa_dsa/nc-dpa_dsa-pfndacompare">PFNDACOMPARE</a></b>
 * 
 * A comparison function pointer. See <a href="https://docs.microsoft.com/windows/desktop/api/dpa_dsa/nc-dpa_dsa-pfndacompare">PFNDPACOMPARE</a> for the comparison function prototype.
 * @param {LPARAM} _lParam Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPARAM</a></b>
 * 
 * An additional parameter to be passed to <i>pfnCmp</i>.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Returns <b>TRUE</b> on success or <b>FALSE</b> on failure.
 * @see https://learn.microsoft.com/windows/win32/api/dpa_dsa/nf-dpa_dsa-dsa_sort
 * @since windows6.0.6000
 */
export DSA_Sort(pdsa, pfnCompare, _lParam) {
    result := DllCall("COMCTL32.dll\DSA_Sort", HDSA, pdsa, "ptr", pfnCompare, LPARAM, _lParam, BOOL)
    return result
}

/**
 * Creates a dynamic pointer array (DPA).
 * @param {Integer} cItemGrow Type: <b>int</b>
 * 
 * The number of elements by which the array should be expanded, if the DPA needs to be enlarged.
 * @returns {HDPA} Type: <b>HDPA</b>
 * 
 * Returns a handle to a DPA if successful, or <b>NULL</b> if the call fails.
 * @see https://learn.microsoft.com/windows/win32/api/dpa_dsa/nf-dpa_dsa-dpa_create
 * @since windows6.0.6000
 */
export DPA_Create(cItemGrow) {
    result := DllCall("COMCTL32.dll\DPA_Create", "int", cItemGrow, HDPA.Owned)
    return result
}

/**
 * Creates a dynamic pointer array (DPA) using a given specified size and heap location.
 * @remarks
 * <b>DPA_CreateEx</b> is not exported by name. To use it, you must use <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> and request ordinal 340 from ComCtl32.dll to obtain a function pointer.
 * @param {Integer} cpGrow Type: <b>int</b>
 * 
 * The number of elements by which the array should be expanded, if the DPA needs to be enlarged.
 * @param {HANDLE} hheap Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HANDLE</a></b>
 * 
 * A handle to the heap where the array is stored.
 * @returns {HDPA} Type: <b>HDPA</b>
 * 
 * Returns a handle to a DPA if successful, or <b>NULL</b> if the call fails.
 * @see https://learn.microsoft.com/windows/win32/api/dpa_dsa/nf-dpa_dsa-dpa_createex
 * @since windows6.0.6000
 */
export DPA_CreateEx(cpGrow, hheap) {
    result := DllCall("COMCTL32.dll\DPA_CreateEx", "int", cpGrow, HANDLE, hheap, HDPA.Owned)
    return result
}

/**
 * Duplicates a dynamic pointer array (DPA).
 * @remarks
 * <b>DPA_Clone</b> is not exported by name or declared in a public header file. To use it, you must use <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> and request ordinal 331 from ComCtl32.dll to obtain a function pointer.
 * @param {HDPA} _hdpa Type: <b>const HDPA</b>
 * 
 * A handle to an existing DPA to copy.
 * @param {HDPA} hdpaNew Type: <b>HDPA</b>
 * 
 * When <b>NULL</b>, a new array is copied from <i>hdpaSource</i>. 
 * 
 *                     
 * 
 * This parameter can also contain an array created with <a href="https://docs.microsoft.com/windows/desktop/api/dpa_dsa/nf-dpa_dsa-dpa_create">DPA_Create</a> or <a href="https://docs.microsoft.com/windows/desktop/api/dpa_dsa/nf-dpa_dsa-dpa_createex">DPA_CreateEx</a>. The data is overwritten but the original delta size and heap handle retained.
 * @returns {HDPA} Type: <b>HDPA</b>
 * 
 * The handle to the new or altered DPA (<i>hdpaNew</i>) if successful; otherwise, <b>NULL</b>.
 * @see https://learn.microsoft.com/windows/win32/api/dpa_dsa/nf-dpa_dsa-dpa_clone
 * @since windows6.0.6000
 */
export DPA_Clone(_hdpa, hdpaNew) {
    result := DllCall("COMCTL32.dll\DPA_Clone", HDPA, _hdpa, HDPA, hdpaNew, HDPA.Owned)
    return result
}

/**
 * Frees a Dynamic Pointer Array (DPA).
 * @param {HDPA} _hdpa Type: <b>HDPA</b>
 * 
 * A handle to a DPA.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Returns <b>TRUE</b> on success, <b>FALSE</b> on failure.
 * @see https://learn.microsoft.com/windows/win32/api/dpa_dsa/nf-dpa_dsa-dpa_destroy
 * @since windows6.0.6000
 */
export DPA_Destroy(_hdpa) {
    result := DllCall("COMCTL32.dll\DPA_Destroy", HDPA, _hdpa, BOOL)
    return result
}

/**
 * Calls pfnCB on each element of the dynamic pointer array (DPA), then frees the DPA.
 * @param {HDPA} _hdpa Type: <b>HDPA</b>
 * 
 * A handle to a DPA.
 * @param {Pointer<PFNDAENUMCALLBACK>} pfnCB Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dpa_dsa/nc-dpa_dsa-pfndaenumcallback">PFNDPAENUMCALLBACK</a></b>
 * 
 * A callback function pointer. See <a href="https://docs.microsoft.com/windows/desktop/api/dpa_dsa/nc-dpa_dsa-pfndaenumcallback">PFNDPAENUMCALLBACK</a> for the callback function prototype.
 * @param {Pointer<Void>} pData Type: <b>void*</b>
 * 
 * A callback data pointer. <i>pData</i> is passed as a parameter to <i>pfnCB</i>.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/dpa_dsa/nf-dpa_dsa-dpa_destroycallback
 * @since windows6.0.6000
 */
export DPA_DestroyCallback(_hdpa, pfnCB, pData) {
    pDataMarshal := pData is VarRef ? "ptr" : "ptr"

    DllCall("COMCTL32.dll\DPA_DestroyCallback", HDPA, _hdpa, "ptr", pfnCB, pDataMarshal, pData)
}

/**
 * Removes an item from a dynamic pointer array (DPA). The DPA shrinks if necessary to accommodate the removed item.
 * @param {HDPA} _hdpa Type: <b>HDPA</b>
 * 
 * A handle to a DPA.
 * @param {Integer} i Type: <b>int</b>
 * 
 * An index of item to be removed from DPA.
 * @returns {Pointer<Void>} Returns the removed item or <b>NULL</b>, if the call fails.
 * @see https://learn.microsoft.com/windows/win32/api/dpa_dsa/nf-dpa_dsa-dpa_deleteptr
 * @since windows6.0.6000
 */
export DPA_DeletePtr(_hdpa, i) {
    result := DllCall("COMCTL32.dll\DPA_DeletePtr", HDPA, _hdpa, "int", i, IntPtr)
    return result
}

/**
 * Removes all items from a dynamic pointer array (DPA) and shrinks the DPA accordingly.
 * @param {HDPA} _hdpa Type: <b>HDPA</b>
 * 
 * Handle to a DPA.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Returns <b>TRUE</b> on success or <b>FALSE</b> on failure.
 * @see https://learn.microsoft.com/windows/win32/api/dpa_dsa/nf-dpa_dsa-dpa_deleteallptrs
 * @since windows6.0.6000
 */
export DPA_DeleteAllPtrs(_hdpa) {
    result := DllCall("COMCTL32.dll\DPA_DeleteAllPtrs", HDPA, _hdpa, BOOL)
    return result
}

/**
 * Iterates through the Dynamic Pointer Array (DPA) and calls pfnCB on each item.
 * @param {HDPA} _hdpa Type: <b>HDPA</b>
 * 
 * A handle to a DPA.
 * @param {Pointer<PFNDAENUMCALLBACK>} pfnCB Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dpa_dsa/nc-dpa_dsa-pfndaenumcallback">PFNDPAENUMCALLBACK</a></b>
 * 
 * A callback function pointer. See <a href="https://docs.microsoft.com/windows/desktop/api/dpa_dsa/nc-dpa_dsa-pfndaenumcallback">PFNDPAENUMCALLBACK</a> for the callback function prototype.
 * @param {Pointer<Void>} pData Type: <b>void*</b>
 * 
 * A callback data pointer. <i>pData</i> is passed as a parameter to <i>pfnCB</i>.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/dpa_dsa/nf-dpa_dsa-dpa_enumcallback
 * @since windows6.0.6000
 */
export DPA_EnumCallback(_hdpa, pfnCB, pData) {
    pDataMarshal := pData is VarRef ? "ptr" : "ptr"

    DllCall("COMCTL32.dll\DPA_EnumCallback", HDPA, _hdpa, "ptr", pfnCB, pDataMarshal, pData)
}

/**
 * Changes the number of pointers in a dynamic pointer array (DPA).
 * @remarks
 * If <i>cp</i> is less than the number of pointers already in the DPA, the DPA is left unchanged. If <i>cp</i> is greater than the number of pointers in the DPA, the added pointers are initialized to <b>NULL</b>.
 * @param {HDPA} pdpa Type: <b>HDPA</b>
 * 
 * A handle to an existing DPA.
 * @param {Integer} cp Type: <b>int</b>
 * 
 * The number of pointers desired in the DPA.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/dpa_dsa/nf-dpa_dsa-dpa_grow
 * @since windows6.0.6000
 */
export DPA_Grow(pdpa, cp) {
    result := DllCall("COMCTL32.dll\DPA_Grow", HDPA, pdpa, "int", cp, BOOL)
    return result
}

/**
 * Inserts a new item at a specified position in a dynamic pointer array (DPA). If necessary, the DPA expands to accommodate the new item.
 * @param {HDPA} _hdpa Type: <b>HDPA</b>
 * 
 * A handle to a DPA.
 * @param {Integer} i Type: <b>int</b>
 * 
 * Tbe position where new item is to be inserted.
 * @param {Pointer<Void>} p Type: <b>void*</b>
 * 
 * A pointer to the item that is to be inserted.
 * @returns {Integer} Type: <b>int</b>
 * 
 * Returns the index of the new item or <c>-1</c>, if the insertion fails.
 * @see https://learn.microsoft.com/windows/win32/api/dpa_dsa/nf-dpa_dsa-dpa_insertptr
 * @since windows6.0.6000
 */
export DPA_InsertPtr(_hdpa, i, p) {
    pMarshal := p is VarRef ? "ptr" : "ptr"

    result := DllCall("COMCTL32.dll\DPA_InsertPtr", HDPA, _hdpa, "int", i, pMarshal, p, Int32)
    return result
}

/**
 * Assigns a value to an item in a dynamic pointer array (DPA).
 * @param {HDPA} _hdpa Type: <b>HDPA</b>
 * 
 * A handle to a DPA.
 * @param {Integer} i Type: <b>int</b>
 * 
 * The index of the item in the DPA. 
 * 
 * <div class="alert"><b>Note</b>  If the index is beyond the current size of the DPA, the DPA expands to accommodate it. You do not need to assign items contiguously.</div>
 * <div> </div>
 * @param {Pointer<Void>} p Type: <b>void*</b>
 * 
 * A pointer to the value to assign to the specified DPA item.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/dpa_dsa/nf-dpa_dsa-dpa_setptr
 * @since windows6.0.6000
 */
export DPA_SetPtr(_hdpa, i, p) {
    pMarshal := p is VarRef ? "ptr" : "ptr"

    result := DllCall("COMCTL32.dll\DPA_SetPtr", HDPA, _hdpa, "int", i, pMarshal, p, BOOL)
    return result
}

/**
 * Gets an item from a dynamic pointer array (DPA).
 * @param {HDPA} _hdpa Type: <b>HDPA</b>
 * 
 * A handle to a DPA.
 * @param {Pointer} i Type: <b>int</b>
 * 
 * The index of item to be retrieved.
 * @returns {Pointer<Void>} Returns the specified item or <b>NULL</b>, if the call fails.
 * @see https://learn.microsoft.com/windows/win32/api/dpa_dsa/nf-dpa_dsa-dpa_getptr
 * @since windows6.0.6000
 */
export DPA_GetPtr(_hdpa, i) {
    result := DllCall("COMCTL32.dll\DPA_GetPtr", HDPA, _hdpa, "ptr", i, IntPtr)
    return result
}

/**
 * Gets the index of a matching item found in a dynamic pointer array (DPA).
 * @remarks
 * <b>DPA_GetPtrIndex</b> is not exported by name. To use it, you must use <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> and request ordinal 333 from ComCtl32.dll to obtain a function pointer.
 * @param {HDPA} _hdpa Type: <b>HDPA</b>
 * 
 * A handle to an existing DPA.
 * @param {Pointer<Void>} p Type: <b>const void*</b>
 * 
 * A pointer to an item to locate in <i>hdpa</i>.
 * @returns {Integer} Type: <b>int</b>
 * 
 * The index of the item pointed to by <i>pvoid</i>, if found; otherwise, -1.
 * @see https://learn.microsoft.com/windows/win32/api/dpa_dsa/nf-dpa_dsa-dpa_getptrindex
 * @since windows6.0.6000
 */
export DPA_GetPtrIndex(_hdpa, p) {
    pMarshal := p is VarRef ? "ptr" : "ptr"

    result := DllCall("COMCTL32.dll\DPA_GetPtrIndex", HDPA, _hdpa, pMarshal, p, Int32)
    return result
}

/**
 * Gets the size of a dynamic pointer array (DPA).
 * @param {HDPA} _hdpa Type: <b>HDPA</b>
 * 
 * A handle to an existing DPA.
 * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">ULONGLONG</a></b>
 * 
 * Returns the size of the DPA, including the internal bookkeeping information. If <i>pdpa</i> is <b>NULL</b>, the function returns zero.
 * @see https://learn.microsoft.com/windows/win32/api/dpa_dsa/nf-dpa_dsa-dpa_getsize
 * @since windows6.0.6000
 */
export DPA_GetSize(_hdpa) {
    result := DllCall("COMCTL32.dll\DPA_GetSize", HDPA, _hdpa, Int64)
    return result
}

/**
 * Sorts the items in a Dynamic Pointer Array (DPA).
 * @param {HDPA} _hdpa Type: <b>HDPA</b>
 * 
 * A handle to a DPA.
 * @param {Pointer<PFNDACOMPARE>} pfnCompare Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dpa_dsa/nc-dpa_dsa-pfndacompare">PFNDPACOMPARE</a></b>
 * 
 * A comparison function pointer. See <a href="https://docs.microsoft.com/windows/desktop/api/dpa_dsa/nc-dpa_dsa-pfndacompare">PFNDPACOMPARE</a> for the comparison function prototype.
 * @param {LPARAM} _lParam Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPARAM</a></b>
 * 
 * An additional parameter to be passed to <i>pfnCmp</i>.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Returns <b>TRUE</b> on success or <b>FALSE</b> on failure.
 * @see https://learn.microsoft.com/windows/win32/api/dpa_dsa/nf-dpa_dsa-dpa_sort
 * @since windows6.0.6000
 */
export DPA_Sort(_hdpa, pfnCompare, _lParam) {
    result := DllCall("COMCTL32.dll\DPA_Sort", HDPA, _hdpa, "ptr", pfnCompare, LPARAM, _lParam, BOOL)
    return result
}

/**
 * Loads the dynamic pointer array (DPA) from a stream by calling the specified callback function to read each element.
 * @remarks
 * This function must be called directly from ComCtl32.dll. It is ordinal 9.
 * 
 * The callback is responsible for writing the <i>pvInstData</i> data to the stream.
 * @param {Pointer<PFNDPASTREAM>} _pfn Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dpa_dsa/nc-dpa_dsa-pfndpastream">PFNDPASTREAM</a></b>
 * 
 * The callback function. See <a href="https://docs.microsoft.com/windows/desktop/api/dpa_dsa/nc-dpa_dsa-pfndpastream">PFNDPASTREAM</a> for the callback function prototype.
 * @param {IStream} pstream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
 * 
 * An <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> object.
 * @param {Pointer<Void>} pvInstData Type: <b>void*</b>
 * 
 * A pointer to callback data. <i>pvInstData</i> is passed as a parameter to <i>pfn</i>.
 * @returns {HDPA} Type: <b>HDPA*</b>
 * 
 * A handle to a DPA.
 * @see https://learn.microsoft.com/windows/win32/api/dpa_dsa/nf-dpa_dsa-dpa_loadstream
 * @since windows6.0.6000
 */
export DPA_LoadStream(_pfn, pstream, pvInstData) {
    pvInstDataMarshal := pvInstData is VarRef ? "ptr" : "ptr"

    phdpa := HDPA.Owned()
    result := DllCall("COMCTL32.dll\DPA_LoadStream", HDPA.Ptr, phdpa, "ptr", _pfn, "ptr", pstream, pvInstDataMarshal, pvInstData, "HRESULT")
    return phdpa
}

/**
 * Saves the dynamic pointer array (DPA) to a stream by writing out a header, and then calling the specified callback function to write each element.
 * @remarks
 * This function must be called directly from ComCtl32.dll. It is ordinal 10.
 * 
 * The callback is responsible for writing the <i>pvInstData</i> data to the stream.
 * @param {HDPA} _hdpa Type: <b>HDPA</b>
 * 
 * Receives a handle to a DPA.
 * @param {Pointer<PFNDPASTREAM>} _pfn Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dpa_dsa/nc-dpa_dsa-pfndpastream">PFNDPASTREAM</a></b>
 * 
 * The callback function. See <a href="https://docs.microsoft.com/windows/desktop/api/dpa_dsa/nc-dpa_dsa-pfndpastream">PFNDPASTREAM</a> for the callback function prototype.
 * @param {IStream} pstream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
 * 
 * An <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> object.
 * @param {Pointer<Void>} pvInstData Type: <b>void*</b>
 * 
 * A pointer to callback data. <i>pvInstData</i> is passed as a parameter to <i>pfn</i>.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns one of the following values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>S_OK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Indicates that the callback function was unsuccessful in saving the element; however, the process should continue. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>S_FALSE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Indicates that even though the callback was unsuccessful, the process was uninterrupted. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Indicates that one or more of the parameters is invalid. 
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/dpa_dsa/nf-dpa_dsa-dpa_savestream
 * @since windows6.0.6000
 */
export DPA_SaveStream(_hdpa, _pfn, pstream, pvInstData) {
    pvInstDataMarshal := pvInstData is VarRef ? "ptr" : "ptr"

    result := DllCall("COMCTL32.dll\DPA_SaveStream", HDPA, _hdpa, "ptr", _pfn, "ptr", pstream, pvInstDataMarshal, pvInstData, "HRESULT")
    return result
}

/**
 * Combines the contents of two dynamic pointer arrays (DPAs).
 * @remarks
 * <b>DPA_Merge</b> is not exported by name. To use it, you must use <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> and request ordinal 11 from ComCtl32.dll to obtain a function pointer.
 * @param {HDPA} hdpaDest Type: <b>HDPA</b>
 * 
 * A handle to the first DPA. This array can be optionally presorted. When this function returns, contains the handle to the merged array.
 * @param {HDPA} hdpaSrc Type: <b>HDPA</b>
 * 
 * A handle to the second DPA. This array can be optionally presorted.
 * @param {Integer} dwFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
 * 
 * Options determining the method used to merge the two arrays. DPAM_NORMAL, DPAM_UNION, and DPAM_UNION are mutually exclusive—only one of those flags can be set, optionally in conjunction with DPAM_SORTED.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="DPAM_SORTED"></a><a id="dpam_sorted"></a><dl>
 * <dt><b>DPAM_SORTED</b></dt>
 * <dt>0x00000001</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The arrays are presorted; skip sorting. If this flag is not set, the arrays are sorted before they are merged.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="DPAM_NORMAL"></a><a id="dpam_normal"></a><dl>
 * <dt><b>DPAM_NORMAL</b></dt>
 * <dt>0x00000002</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The final array consists of all of the elements originally present in <i>hdpaDest</i>. If any of those elements are also found in <i>hdpaSrc</i>, those elements are merged in the final array. The <a href="https://docs.microsoft.com/windows/desktop/api/dpa_dsa/nc-dpa_dsa-pfndpamerge">PFNDPAMERGE</a> callback function is called with the DPAMM_MERGE message.
 * 
 *                         
 * 
 * When this flag is set, the final size of the array at <i>hdpaDest</i> is the same as its initial size.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="DPAM_UNION"></a><a id="dpam_union"></a><dl>
 * <dt><b>DPAM_UNION</b></dt>
 * <dt>0x00000004</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The final array is the union of all elements in both arrays. Elements found in both arrays are merged in the final array. Elements found in only one array or the other are added as found. When this flag is set, the <a href="https://docs.microsoft.com/windows/desktop/api/dpa_dsa/nc-dpa_dsa-pfndpamerge">PFNDPAMERGE</a> callback function can be called with the DPAMM_MERGE or DPAMM_INSERT message. 
 * 
 *                         
 * 
 * The final size of the array is at least the size of the larger of <i>hdpaDest</i> and <i>hdpaSrc</i>, and at most the sum of the two.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="DPAM_INTERSECT"></a><a id="dpam_intersect"></a><dl>
 * <dt><b>DPAM_INTERSECT</b></dt>
 * <dt>0x00000008</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Only elements found in both <i>hdpaSrc</i> and <i>hdpaDest</i> are merged to form the final array. When this flag is set, the <a href="https://docs.microsoft.com/windows/desktop/api/dpa_dsa/nc-dpa_dsa-pfndpamerge">PFNDPAMERGE</a> callback function can be called with the DPAMM_MERGE or DPAMM_DELETE message. 
 * 
 *                         
 * 
 * The final size of the array can range between 0 and the smaller of <i>hdpaDest</i> and <i>hdpaSrc</i>.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<PFNDACOMPARE>} pfnCompare Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dpa_dsa/nc-dpa_dsa-pfndacompare">PFNDPACOMPARE</a></b>
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/dpa_dsa/nc-dpa_dsa-pfndacompare">PFNDPACOMPARE</a> callback function that compares two elements, one from each DPA, to determine whether they are the same item. If so, the callback function pointed to by <i>pfnCompare</i> is called.
 * @param {Pointer<PFNDPAMERGE>} pfnMerge Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dpa_dsa/nc-dpa_dsa-pfndpamerge">PFNDPAMERGE</a></b>
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/dpa_dsa/nc-dpa_dsa-pfndpamerge">PFNDPAMERGE</a> callback function that merges the contents when an element is found in both DPAs and is found to be the same item by <a href="https://docs.microsoft.com/windows/desktop/api/dpa_dsa/nc-dpa_dsa-pfndacompare">PFNDPACOMPARE</a>.
 * @param {LPARAM} _lParam Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPARAM</a></b>
 * 
 * Additional parameter used to declare the basis of comparison upon which equality is determined.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * <b>TRUE</b> if successful; otherwise, <b>FALSE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/dpa_dsa/nf-dpa_dsa-dpa_merge
 * @since windows6.0.6000
 */
export DPA_Merge(hdpaDest, hdpaSrc, dwFlags, pfnCompare, pfnMerge, _lParam) {
    result := DllCall("COMCTL32.dll\DPA_Merge", HDPA, hdpaDest, HDPA, hdpaSrc, "uint", dwFlags, "ptr", pfnCompare, "ptr", pfnMerge, LPARAM, _lParam, BOOL)
    return result
}

/**
 * Finds an item in a dynamic pointer array (DPA).
 * @param {HDPA} _hdpa Type: <b>HDPA</b>
 * 
 * A handle to a DPA.
 * @param {Pointer<Void>} pFind Type: <b>void*</b>
 * 
 * A pointer to search for.
 * @param {Integer} iStart Type: <b>int</b>
 * 
 * The index at which to start search.
 * @param {Pointer<PFNDACOMPARE>} pfnCompare Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dpa_dsa/nc-dpa_dsa-pfndacompare">PFNDPACOMPARE</a></b>
 * 
 * A comparison function pointer. See <a href="https://docs.microsoft.com/windows/desktop/api/dpa_dsa/nc-dpa_dsa-pfndacompare">PFNDPACOMPARE</a> for the comparison function prototype.
 * @param {LPARAM} _lParam Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPARAM</a></b>
 * 
 * An additional parameter to be passed to <i>pfnCmp</i>.
 * @param {Integer} options Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * This parameter may be one or more of the following.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="DPAS_SORTED"></a><a id="dpas_sorted"></a><dl>
 * <dt><b>DPAS_SORTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Indicates that the DPA is sorted.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="DPAS_INSERTBEFORE"></a><a id="dpas_insertbefore"></a><dl>
 * <dt><b>DPAS_INSERTBEFORE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * This value is only valid in conjunction with DPAS_SORTED. If the item is not found, return the position where the item is expected to be found in the sorted DPA.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="DPAS_INSERTAFTER"></a><a id="dpas_insertafter"></a><dl>
 * <dt><b>DPAS_INSERTAFTER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * This value is only valid in conjunction with DPAS_SORTED. If the item is not found, return the position where the item is expected to be found in the sorted DPA.
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {Integer} Type: <b>int</b>
 * 
 * Returns the index where the item was found in the DPA or <c>-1</c> if the item was not found.
 * @see https://learn.microsoft.com/windows/win32/api/dpa_dsa/nf-dpa_dsa-dpa_search
 * @since windows6.0.6000
 */
export DPA_Search(_hdpa, pFind, iStart, pfnCompare, _lParam, options) {
    pFindMarshal := pFind is VarRef ? "ptr" : "ptr"

    result := DllCall("COMCTL32.dll\DPA_Search", HDPA, _hdpa, pFindMarshal, pFind, "int", iStart, "ptr", pfnCompare, LPARAM, _lParam, "uint", options, Int32)
    return result
}

/**
 * Sets ppszCurrent to a copy of pszNew and frees the previous value, if necessary.
 * @remarks
 * The ANSI version of <b>Str_SetPtrW</b>, <b>Str_SetPtrA</b>, is not exported by name or declared in a public header file. To use it, you must use <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> and request ordinal 234 from ComCtl32.dll to obtain a function pointer.
 * @param {Pointer<PWSTR>} ppsz Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPTSTR</a>*</b>
 * 
 * The address of a pointer to the current string. The current string is freed and the pointer is set to a copy of <i>pszNew</i>.
 * @param {PWSTR} psz Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCTSTR</a></b>
 * 
 * A pointer to the string to copy into <i>ppszCurrent</i>.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Returns <b>TRUE</b> if successful; otherwise, <b>FALSE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/dpa_dsa/nf-dpa_dsa-str_setptrw
 * @since windows6.0.6000
 */
export Str_SetPtrW(ppsz, psz) {
    psz := psz is String ? StrPtr(psz) : psz

    ppszMarshal := ppsz is VarRef ? "ptr*" : "ptr"

    result := DllCall("COMCTL32.dll\Str_SetPtrW", ppszMarshal, ppsz, "ptr", psz, BOOL)
    return result
}

/**
 * Enables or disables one or both flat scroll bar direction buttons. If flat scroll bars are not initialized for the window, this function calls the standard EnableScrollBar function.
 * @remarks
 * <div class="alert"><b>Note</b>  Flat scroll bar functions are implemented in Comctl32.dll versions 4.71 through 5.82. Comctl32.dll versions 6.00 and higher do not support flat scroll bars.</div>
 * <div> </div>
 * @param {HWND} param0 
 * @param {Integer} param1 
 * @param {Integer} param2 
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Returns nonzero if the scroll bar changes, or zero otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-flatsb_enablescrollbar
 * @since windows6.0.6000
 */
export FlatSB_EnableScrollBar(param0, param1, param2) {
    result := DllCall("COMCTL32.dll\FlatSB_EnableScrollBar", HWND, param0, "int", param1, "uint", param2, BOOL)
    return result
}

/**
 * Shows or hides a flat scroll bar. If flat scroll bars are not initialized for the window, this function calls the standard ShowScrollBar function.
 * @remarks
 * <div class="alert"><b>Note</b>  Flat scroll bar functions are implemented in Comctl32.dll versions 4.71 through 5.82. Comctl32.dll versions 6.00 and higher do not support flat scroll bars.</div>
 * <div> </div>
 * @param {HWND} param0 
 * @param {SCROLLBAR_CONSTANTS} code Type: <b>int</b>
 * @param {BOOL} param2 
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Returns nonzero if successful, or zero otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-flatsb_showscrollbar
 * @since windows6.0.6000
 */
export FlatSB_ShowScrollBar(param0, code, param2) {
    result := DllCall("COMCTL32.dll\FlatSB_ShowScrollBar", HWND, param0, SCROLLBAR_CONSTANTS, code, BOOL, param2, BOOL)
    return result
}

/**
 * Gets the scroll range for a flat scroll bar. If flat scroll bars are not initialized for the window, this function calls the standard GetScrollRange function.
 * @remarks
 * <div class="alert"><b>Note</b>  Flat scroll bar functions are implemented in Comctl32.dll versions 4.71 through 5.82. Comctl32.dll versions 6.00 and higher do not support flat scroll bars.</div>
 * <div> </div>
 * @param {HWND} param0 
 * @param {SCROLLBAR_CONSTANTS} code Type: <b>int</b>
 * @param {Pointer<Integer>} param2 
 * @param {Pointer<Integer>} param3 
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Returns nonzero if successful, or zero otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-flatsb_getscrollrange
 * @since windows6.0.6000
 */
export FlatSB_GetScrollRange(param0, code, param2, param3) {
    param2Marshal := param2 is VarRef ? "int*" : "ptr"
    param3Marshal := param3 is VarRef ? "int*" : "ptr"

    result := DllCall("COMCTL32.dll\FlatSB_GetScrollRange", HWND, param0, SCROLLBAR_CONSTANTS, code, param2Marshal, param2, param3Marshal, param3, BOOL)
    return result
}

/**
 * Gets the information for a flat scroll bar. If flat scroll bars are not initialized for the window, this function calls the standard GetScrollInfo function.
 * @remarks
 * <div class="alert"><b>Note</b>  Flat scroll bar functions are implemented in Comctl32.dll versions 4.71 through 5.82. Comctl32.dll versions 6.00 and higher do not support flat scroll bars.</div>
 * <div> </div>
 * @param {HWND} param0 
 * @param {SCROLLBAR_CONSTANTS} code Type: <b>int</b>
 * @param {Pointer<SCROLLINFO>} param2 
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Returns nonzero if successful, or zero otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-flatsb_getscrollinfo
 * @since windows6.0.6000
 */
export FlatSB_GetScrollInfo(param0, code, param2) {
    result := DllCall("COMCTL32.dll\FlatSB_GetScrollInfo", HWND, param0, SCROLLBAR_CONSTANTS, code, SCROLLINFO.Ptr, param2, BOOL)
    return result
}

/**
 * Gets the thumb position in a flat scroll bar. If flat scroll bars are not initialized for the window, this function calls the standard GetScrollPos function.
 * @remarks
 * <div class="alert"><b>Note</b>  Flat scroll bar functions are implemented in Comctl32.dll versions 4.71 through 5.82. Comctl32.dll versions 6.00 and higher do not support flat scroll bars.</div>
 * <div> </div>
 * @param {HWND} param0 
 * @param {SCROLLBAR_CONSTANTS} code Type: <b>int</b>
 * @returns {Integer} Type: <b>int</b>
 * 
 * Returns the current thumb position of the specified flat scroll bar.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-flatsb_getscrollpos
 * @since windows6.0.6000
 */
export FlatSB_GetScrollPos(param0, code) {
    result := DllCall("COMCTL32.dll\FlatSB_GetScrollPos", HWND, param0, SCROLLBAR_CONSTANTS, code, Int32)
    return result
}

/**
 * Gets the properties for a flat scroll bar. This function can also be used to determine if InitializeFlatSB has been called for this window.
 * @remarks
 * <div class="alert"><b>Note</b>  Flat scroll bar functions are implemented in Comctl32.dll versions 4.71 through 5.82. Comctl32.dll versions 6.00 and higher do not support flat scroll bars.</div>
 * <div> </div>
 * @param {HWND} param0 
 * @param {WSB_PROP} propIndex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * The parameter that determines what
 * @param {Pointer<Integer>} param2 
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Returns nonzero if successful, or zero otherwise. If 
 * 						<i>index</i> is WSB_PROP_HSTYLE, the return is nonzero if <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nf-commctrl-initializeflatsb">InitializeFlatSB</a> has been called for this window, or zero otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-flatsb_getscrollprop
 * @since windows6.0.6000
 */
export FlatSB_GetScrollProp(param0, propIndex, param2) {
    param2Marshal := param2 is VarRef ? "int*" : "ptr"

    result := DllCall("COMCTL32.dll\FlatSB_GetScrollProp", HWND, param0, WSB_PROP, propIndex, param2Marshal, param2, BOOL)
    return result
}

/**
 * Sets the current position of the thumb in a flat scroll bar. If flat scroll bars are not initialized for the window, this function calls the standard SetScrollPos function.
 * @remarks
 * <div class="alert"><b>Note</b>  Flat scroll bar functions are implemented in Comctl32.dll versions 4.71 through 5.82. Comctl32.dll versions 6.00 and higher do not support flat scroll bars.</div>
 * <div> </div>
 * @param {HWND} param0 
 * @param {SCROLLBAR_CONSTANTS} code Type: <b>int</b>
 * @param {Integer} pos Type: <b>int</b>
 * 
 * The new thumb position.
 * @param {BOOL} fRedraw Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Specifies whether the scroll bar should be redrawn immediately to reflect the change. If this parameter is <b>TRUE</b>, the scroll bar is redrawn; if it is <b>FALSE</b>, the scroll bar is not redrawn.
 * @returns {Integer} Type: <b>int</b>
 * 
 * Returns the previous position of the thumb in the specified flat scroll bar.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-flatsb_setscrollpos
 * @since windows6.0.6000
 */
export FlatSB_SetScrollPos(param0, code, pos, fRedraw) {
    result := DllCall("COMCTL32.dll\FlatSB_SetScrollPos", HWND, param0, SCROLLBAR_CONSTANTS, code, "int", pos, BOOL, fRedraw, Int32)
    return result
}

/**
 * Sets the information for a flat scroll bar. If flat scroll bars are not initialized for the window, this function calls the standard SetScrollInfo function.
 * @remarks
 * <div class="alert"><b>Note</b>  Flat scroll bar functions are implemented in Comctl32.dll versions 4.71 through 5.82. Comctl32.dll versions 6.00 and higher do not support flat scroll bars.</div>
 * <div> </div>
 * @param {HWND} param0 
 * @param {SCROLLBAR_CONSTANTS} code Type: <b>int</b>
 * @param {Pointer<SCROLLINFO>} psi Type: <b>LPSCROLLINFO</b>
 * 
 * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-scrollinfo">SCROLLINFO</a> structure that contains the new information for the specified scroll bar. The <b>cbSize</b> and
 * @param {BOOL} fRedraw Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Specifies whether the scroll bar should be redrawn immediately to reflect the change. If this parameter is <b>TRUE</b>, the scroll bar is redrawn; if it is <b>FALSE</b>, the scroll bar is not redrawn.
 * @returns {Integer} Type: <b>int</b>
 * 
 * Returns the current scroll position. If the call to <b>FlatSB_SetScrollInfo</b> changes the scroll position, then the previous position is returned.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-flatsb_setscrollinfo
 * @since windows6.0.6000
 */
export FlatSB_SetScrollInfo(param0, code, psi, fRedraw) {
    result := DllCall("COMCTL32.dll\FlatSB_SetScrollInfo", HWND, param0, SCROLLBAR_CONSTANTS, code, SCROLLINFO.Ptr, psi, BOOL, fRedraw, Int32)
    return result
}

/**
 * Sets the scroll range of a flat scroll bar. If flat scroll bars are not initialized for the window, this function calls the standard SetScrollRange function.
 * @remarks
 * <div class="alert"><b>Note</b>  Flat scroll bar functions are implemented in Comctl32.dll versions 4.71 through 5.82. Comctl32.dll versions 6.00 and higher do not support flat scroll bars.</div>
 * <div> </div>
 * @param {HWND} param0 
 * @param {SCROLLBAR_CONSTANTS} code Type: <b>int</b>
 * @param {Integer} min Type: <b>int</b>
 * 
 * The new minimum scroll range value.
 * @param {Integer} max Type: <b>int</b>
 * 
 * The new maximum scroll range value.
 * @param {BOOL} fRedraw Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Specifies whether the scroll bar should be redrawn immediately to reflect the change. If this parameter is <b>TRUE</b>, the scroll bar is redrawn; if it is <b>FALSE</b>, the scroll bar is not redrawn.
 * @returns {Integer} Type: <b>int</b>
 * 
 * Returns nonzero if successful, or zero otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-flatsb_setscrollrange
 * @since windows6.0.6000
 */
export FlatSB_SetScrollRange(param0, code, min, max, fRedraw) {
    result := DllCall("COMCTL32.dll\FlatSB_SetScrollRange", HWND, param0, SCROLLBAR_CONSTANTS, code, "int", min, "int", max, BOOL, fRedraw, Int32)
    return result
}

/**
 * Sets the properties for a flat scroll bar.
 * @remarks
 * <div class="alert"><b>Note</b>  Flat scroll bar functions are implemented in Comctl32.dll versions 4.71 through 5.82. Comctl32.dll versions 6.00 and higher do not support flat scroll bars.</div>
 * <div> </div>
 * @param {HWND} param0 
 * @param {Integer} index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * Determines what
 * @param {Pointer} newValue Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT_PTR</a></b>
 * 
 * A new value to set. This parameter depends on the flag passed in 
 * 					<i>index</i>.
 * @param {BOOL} param3 
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Returns nonzero if successful, or zero otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-flatsb_setscrollprop
 * @since windows6.0.6000
 */
export FlatSB_SetScrollProp(param0, index, newValue, param3) {
    result := DllCall("COMCTL32.dll\FlatSB_SetScrollProp", HWND, param0, "uint", index, "ptr", newValue, BOOL, param3, BOOL)
    return result
}

/**
 * Initializes flat scroll bars for a particular window.
 * @remarks
 * This function must be called before any other flat scroll bar functions are called. The window will receive flat scroll bars by default. The scroll bar style can be changed with the <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nf-commctrl-flatsb_setscrollprop">FlatSB_SetScrollProp</a> function. 
 * 
 * <div class="alert"><b>Note</b>  Flat scroll bar functions are implemented in Comctl32.dll versions 4.71 through 5.82. Comctl32.dll versions 6.00 and higher do not support flat scroll bars.</div>
 * <div> </div>
 * @param {HWND} param0 
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Returns nonzero if successful, or zero otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-initializeflatsb
 * @since windows6.0.6000
 */
export InitializeFlatSB(param0) {
    result := DllCall("COMCTL32.dll\InitializeFlatSB", HWND, param0, BOOL)
    return result
}

/**
 * Uninitializes flat scroll bars for a particular window. The specified window will revert to standard scroll bars.
 * @remarks
 * <div class="alert"><b>Note</b>  Flat scroll bar functions are implemented in Comctl32.dll versions 4.71 through 5.82. Comctl32.dll versions 6.00 and higher do not support flat scroll bars.</div>
 * <div> </div>
 * @param {HWND} param0 
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns one of the following values. 
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_FAIL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One of the window's scroll bars is currently in use. The operation cannot be completed at this time. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>S_FALSE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The window does not have flat scroll bars initialized. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>S_OK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The operation was successful. 
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-uninitializeflatsb
 * @since windows6.0.6000
 */
export UninitializeFlatSB(param0) {
    result := DllCall("COMCTL32.dll\UninitializeFlatSB", HWND, param0, "HRESULT")
    return result
}

/**
 * Loads a specified icon resource with a client-specified system metric.
 * @remarks
 * <b>LoadIconMetric</b> is similar to <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-loadicona">LoadIcon</a>, but with the capability to specify the icon metric. It is used in place of <b>LoadIcon</b> when the calling application wants to ensure a high quality icon. This is particularly useful in high dots per inch (dpi) situations.
 * 
 * Icons are extracted or created as follows.
 * 
 *                 
 * 
 * <ol>
 * <li>If an exact size match is found in the resource, that icon is used.</li>
 * <li>If an exact size match cannot be found and a larger icon is available, a new icon is created by scaling the larger version down to the desired size.</li>
 * <li>If an exact size match cannot be found and no larger icon is available, a new icon is created by scaling a smaller icon up to the desired size.</li>
 * </ol>
 * Comparative calls are shown here for <b>LoadIconMetric</b> and <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-loadicona">LoadIcon</a>.
 * 
 * 
 * ``` syntax
 * NOTIFYICONDATA  nidIconData  = {0};
 * nidIconData.hIcon = LoadIcon(hInstance, MAKEINTRESOURCE(IDI_ICON));
 * 
 * // Or...
 * 
 * HRESULT hr = LoadIconMetric(hInstance, MAKEINTRESOURCE(IDI_ICON), LIM_SMALL, &amp;nidIconData.hIcon);
 * ```
 * 
 * The application is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-destroyicon">DestroyIcon</a> on the retrieved icon.
 * @param {HINSTANCE} hinst Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HINSTANCE</a></b>
 * 
 * A handle to the module of either a DLL or executable (.exe) file that contains the icon to be loaded. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getmodulehandlea">GetModuleHandle</a>.
 * 
 *                     
 * 
 * To load a predefined icon or a standalone icon file, set this parameter to <b>NULL</b>.
 * @param {PWSTR} pszName Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">PCWSTR</a></b>
 * 
 * A pointer to a null-terminated, Unicode buffer that contains location information about the icon to load. It is interpreted as follows:
 *         
 *                     
 * 
 * If <i>hinst</i> is <b>NULL</b>, <i>pszName</i> can specify one of two things.
 * 
 * <ol>
 * <li>The name of a standalone icon (.ico) file.</li>
 * <li>The identifier of a predefined icon to load. These identifiers are recognized:</li>
 * 
 * <ul>
 * <li>IDI_APPLICATION</li>
 * <li>IDI_INFORMATION</li>
 * <li>IDI_ERROR</li>
 * <li>IDI_WARNING</li>
 * <li>IDI_SHIELD</li>
 * <li>IDI_QUESTION
 * 
 * To pass these constants to the <b>LoadIconMetric</b> function, use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a> macro. For example, to load the IDI_ERROR icon, pass <c>MAKEINTRESOURCE(IDI_ERROR)</c> as the <i>pszName</i> parameter and <b>NULL</b> as the <i>hinst</i> parameter.
 * </ul>
 * </ol>
 * 
 * If <i>hinst</i> is non-null, <i>pszName</i> can specify one of two things.
 * 
 * <ol>
 * <li>The name of the icon resource, if the icon resource is to be loaded by name from the module.</li>
 * <li>The icon ordinal, if the icon resource is to be loaded by ordinal from the module. This ordinal must be packaged by using the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a> macro.</li>
 * </ol>
 * @param {_LI_METRIC} lims Type: <b>int</b>
 * @returns {HICON} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HICON</a>*</b>
 * 
 * When this function returns, contains a pointer to the handle of the loaded icon.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-loadiconmetric
 * @since windows6.0.6000
 */
export LoadIconMetric(hinst, pszName, lims) {
    pszName := pszName is String ? StrPtr(pszName) : pszName

    phico := HICON.Owned()
    result := DllCall("COMCTL32.dll\LoadIconMetric", HINSTANCE, hinst, "ptr", pszName, _LI_METRIC, lims, HICON.Ptr, phico, "HRESULT")
    return phico
}

/**
 * Loads an icon. If the icon is not a standard size, this function scales down a larger image instead of scaling up a smaller image.
 * @remarks
 * This function will first search the icon file for an icon having exactly the same size. If a match is not found, then unless both <i>cx</i> and <i>cy</i> match one of the standard icon sizes—16, 32, 48, or 256 pixels— the next largest icon is selected and then scaled down to the desired size. For example, if an icon with an x dimension of 40 pixels is requested by the callign application, the 48-pixel icon is used and scaled down to 40 pixels. In contrast, the <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nf-commctrl-imagelist_loadimagea">LoadImage</a> function selects the 32-pixel icon and scales it up to 40 pixels.
 * 
 * If the function is unable to locate a larger icon, it defaults to the standard behavior of finding the next smallest icon and scaling it up to the desired size.
 * @param {HINSTANCE} hinst Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HINSTANCE</a></b>
 * 
 * A handle to the module of either a DLL or executable (.exe) file that contains the icon to be loaded. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getmodulehandleexa">GetModuleHandle</a>.
 * 
 *                     
 * 
 * To load a predefined icon or a standalone icon file, set this parameter to <b>NULL</b>.
 * @param {PWSTR} pszName Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">PCWSTR</a></b>
 * 
 * A pointer to a null-terminated, Unicode buffer that contains location information about the icon to load. 
 * 
 * 
 *                     
 * 
 * If <i>hinst</i> is non-<b>NULL</b>, <i>pszName</i>  specifies the icon resource either by name or ordinal. This ordinal must be packaged by using the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a> macro.
 * 
 * If <i>hinst</i> is <b>NULL</b>, <i>pszName</i> specifies either the name of a standalone icon (.ico) file or the identifier of a predefined icon to load. The following identifiers are recognized. To pass these constants to the <b>LoadIconWithScaleDown</b> function, use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a> macro. For example, to load the IDI_ERROR icon, pass <c>MAKEINTRESOURCE(IDI_ERROR)</c> as the <i>pszName</i> parameter and <b>NULL</b> as the <i>hinst</i> parameter.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="IDI_APPLICATION"></a><a id="idi_application"></a><dl>
 * <dt><b>IDI_APPLICATION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Default application icon.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="IDI_ASTERISK"></a><a id="idi_asterisk"></a><dl>
 * <dt><b>IDI_ASTERISK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Same as IDI_INFORMATION.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="IDI_ERROR"></a><a id="idi_error"></a><dl>
 * <dt><b>IDI_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Hand-shaped icon.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="IDI_EXCLAMATION"></a><a id="idi_exclamation"></a><dl>
 * <dt><b>IDI_EXCLAMATION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Same as IDI_WARNING.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="IDI_HAND"></a><a id="idi_hand"></a><dl>
 * <dt><b>IDI_HAND</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Same as IDI_ERROR. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="IDI_INFORMATION"></a><a id="idi_information"></a><dl>
 * <dt><b>IDI_INFORMATION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Asterisk icon.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="IDI_QUESTION"></a><a id="idi_question"></a><dl>
 * <dt><b>IDI_QUESTION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Question mark icon.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="IDI_WARNING"></a><a id="idi_warning"></a><dl>
 * <dt><b>IDI_WARNING</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Exclamation point icon.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="IDI_WINLOGO"></a><a id="idi_winlogo"></a><dl>
 * <dt><b>IDI_WINLOGO</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Windows logo icon. 
 * 						
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="IDI_SHIELD"></a><a id="idi_shield"></a><dl>
 * <dt><b>IDI_SHIELD</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Security Shield icon.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Integer} cx Type: <b>int</b>
 * 
 * The desired width, in pixels, of the icon.
 * @param {Integer} _cy Type: <b>int</b>
 * 
 * The desired height, in pixels, of the icon.
 * @returns {HICON} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HICON</a>*</b>
 * 
 * When this function returns, contains a pointer to the handle of the loaded icon.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-loadiconwithscaledown
 * @since windows6.0.6000
 */
export LoadIconWithScaleDown(hinst, pszName, cx, _cy) {
    pszName := pszName is String ? StrPtr(pszName) : pszName

    phico := HICON.Owned()
    result := DllCall("COMCTL32.dll\LoadIconWithScaleDown", HINSTANCE, hinst, "ptr", pszName, "int", cx, "int", _cy, HICON.Ptr, phico, "HRESULT")
    return phico
}

/**
 * Draws text that has a shadow.
 * @remarks
 * To use <b>DrawShadowText</b>, specify Comctl32.dll version 6 in the manifest. For more information on manifests, see <a href="https://docs.microsoft.com/windows/desktop/Controls/cookbook-overview">Enabling Visual Styles</a>.
 * @param {HDC} _hdc Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a></b>
 * 
 * HDC.
 * @param {PWSTR} pszText Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
 * 
 * A pointer to a string that contains the text to be drawn.
 * @param {Integer} cch Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * A <b>UINT</b> that specifies the number of characters in the string that is to be drawn.
 * @param {Pointer<RECT>} prc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
 * 
 * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains, in logical coordinates, the rectangle in which the text is to be drawn.
 * @param {Integer} dwFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
 * 
 * A <b>DWORD</b> that specifies how the text is to be drawn. See <a href="https://docs.microsoft.com/windows/desktop/Controls/theme-format-values">Format Values</a> for possible parameter values.
 * @param {COLORREF} crText Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
 * 
 * A <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> structure that contains the color of the text.
 * @param {COLORREF} crShadow Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
 * 
 * A <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> structure that contains the color of the text shadow.
 * @param {Integer} ixOffset Type: <b>int</b>
 * 
 * A value of type <b>int</b> that specifies the x-coordinate of where the text should begin.
 * @param {Integer} iyOffset Type: <b>int</b>
 * 
 * A value of type <b>int</b> that specifies the y-coordinate of where the text should begin.
 * @returns {Integer} Type: <b>int</b>
 * 
 * Returns the height of the text in logical units if the function succeeds, otherwise returns zero.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-drawshadowtext
 * @since windows6.0.6000
 */
export DrawShadowText(_hdc, pszText, cch, prc, dwFlags, crText, crShadow, ixOffset, iyOffset) {
    pszText := pszText is String ? StrPtr(pszText) : pszText

    result := DllCall("COMCTL32.dll\DrawShadowText", HDC, _hdc, "ptr", pszText, "uint", cch, RECT.Ptr, prc, "uint", dwFlags, COLORREF, crText, COLORREF, crShadow, "int", ixOffset, "int", iyOffset, Int32)
    return result
}

/**
 * Creates a single instance of an imagelist and returns an interface pointer to it.
 * @remarks
 * Before calling this function, COM must be initialized by calling <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-coinitialize">CoInitialize</a> or <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializeex">CoInitializeEx</a>.
 * 
 * Call <b>ImageList_CoCreateInstance</b> for a customized image list; otherwise, call <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-shgetimagelist">SHGetImageList</a> to load the system image list. Call <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-shgetfileinfoa">SHGetFileInfo</a> with the <i>uflag</i> parameter set to <b>SHGFI_SYSICONINDEX</b> to retrieve a handle to the system image list.
 * @param {Pointer<Guid>} rclsid Type: <b>REFCLSID</b>
 * 
 * A reference to the CLSID—a GUID that identifies the COM object to be created. This should be <b>CLSID_ImageList</b>.
 * @param {IUnknown} punkOuter Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
 * 
 * A pointer to the outer <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface that aggregates the object created by this function, or <b>NULL</b> if no aggregation is desired.
 * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
 * 
 * Reference to the desired interface ID.
 * @returns {Pointer<Void>} Type: <b>void**</b>
 * 
 * When this method returns, contains the interface pointer requested in <i>riid</i>. This is normally <a href="https://docs.microsoft.com/windows/desktop/api/commoncontrols/nn-commoncontrols-iimagelist2">IImageList2</a>, which provides the <a href="https://docs.microsoft.com/windows/desktop/api/commoncontrols/nf-commoncontrols-iimagelist2-initialize">Initialize</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/commoncontrols/nf-commoncontrols-imagelist_cocreateinstance
 * @since windows6.0.6000
 */
export ImageList_CoCreateInstance(rclsid, punkOuter, riid) {
    result := DllCall("COMCTL32.dll\ImageList_CoCreateInstance", Guid.Ptr, rclsid, "ptr", punkOuter, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
    return ppv
}

/**
 * Notifies the system to send feedback about a target window affected by panning gestures.
 * @remarks
 * This function must be called before either the <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-updatepanningfeedback">UpdatePanningFeedback</a> or <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-endpanningfeedback">EndPanningFeedback</a> functions can be called.
 * @param {HWND} _hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * The handle to the target window that will receive feedback.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * TRUE, if successful.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-beginpanningfeedback
 * @since windows6.1
 */
export BeginPanningFeedback(_hwnd) {
    result := DllCall("UxTheme.dll\BeginPanningFeedback", HWND, _hwnd, BOOL)
    return result
}

/**
 * Updates clients about state of a window resulting from a panning gesture. This function can only be called after a BeginPanningFeedback call.
 * @remarks
 * Incremental calls to this function should always pass the sum of the increments and not just the latest increment itself.
 * @param {HWND} _hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * The handle to the target window that will receive feedback. For the method to succeed, this must be the same HWND as provided in <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-beginpanningfeedback">BeginPanningFeedback</a>.
 * @param {Integer} lTotalOverpanOffsetX Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
 * 
 * The total displacement that the window has moved in the horizontal direction since the end of scrollable region was reached. A maximum displacement of 30 pixels is allowed.
 * @param {Integer} lTotalOverpanOffsetY Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
 * 
 * The total displacement that the window has moved in the vertical direction since the end of scrollable region was reached. A maximum displacement of 30 pixels is allowed.
 * @param {BOOL} fInInertia Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Flag indicating whether the application is handling a WM_GESTURE message with the GF_INERTIA FLAG set.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * <b>TRUE</b> if successful.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-updatepanningfeedback
 * @since windows6.1
 */
export UpdatePanningFeedback(_hwnd, lTotalOverpanOffsetX, lTotalOverpanOffsetY, fInInertia) {
    result := DllCall("UxTheme.dll\UpdatePanningFeedback", HWND, _hwnd, "int", lTotalOverpanOffsetX, "int", lTotalOverpanOffsetY, BOOL, fInInertia, BOOL)
    return result
}

/**
 * Terminates any existing animation that was in process or set up by BeginPanningFeedback and UpdatePanningFeedback.
 * @remarks
 * This function can only be called after a <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-beginpanningfeedback">BeginPanningFeedback</a> call.
 * @param {HWND} _hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * The handle to the target window that will receive feedback.
 * @param {BOOL} fAnimateBack Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Flag that indicates whether the displaced window should return to the original position using animation. If <b>FALSE</b>, the method restore the moved window using a direct jump.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * <b>TRUE</b> if successful.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-endpanningfeedback
 * @since windows6.1
 */
export EndPanningFeedback(_hwnd, fAnimateBack) {
    result := DllCall("UxTheme.dll\EndPanningFeedback", HWND, _hwnd, BOOL, fAnimateBack, BOOL)
    return result
}

/**
 * Gets a theme animation property based on the storyboard id and the target id.
 * @param {HTHEME} _hTheme An opened theme handle.
 * @param {Integer} iStoryboardId A predefined storyboard identifier.
 * @param {Integer} iTargetId A predefined target identifier.
 * @param {TA_PROPERTY} eProperty The property that is associated with the animation storyboard and target.
 * @param {Integer} pvProperty The buffer to receive the returned property value.
 * @param {Integer} cbSize The byte size of a buffer that is pointed by <i>pvProperty</i>.
 * @returns {Integer} The                                    byte  size of the returned 
 * property.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-getthemeanimationproperty
 * @since windows8.0
 */
export GetThemeAnimationProperty(_hTheme, iStoryboardId, iTargetId, eProperty, pvProperty, cbSize) {
    result := DllCall("UXTHEME.dll\GetThemeAnimationProperty", HTHEME, _hTheme, "int", iStoryboardId, "int", iTargetId, TA_PROPERTY, eProperty, "ptr", pvProperty, "uint", cbSize, "uint*", &pcbSizeOut := 0, "HRESULT")
    return pcbSizeOut
}

/**
 * Gets an animation transform operation based on storyboard id, target id and transform index.
 * @param {HTHEME} _hTheme An opened theme handle.
 * @param {Integer} iStoryboardId A predefined storyboard identifier.
 * @param {Integer} iTargetId A predefined target identifier.
 * @param {Integer} dwTransformIndex The zero-based index of a transform operation.
 * @param {Integer} pTransform A pointer to a buffer to receive a transform structure.
 * @param {Integer} cbSize The byte size of the buffer pointed by <i>pTransform</i>.
 * @returns {Integer} The                                    byte  size of a transform operation structure.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-getthemeanimationtransform
 * @since windows8.0
 */
export GetThemeAnimationTransform(_hTheme, iStoryboardId, iTargetId, dwTransformIndex, pTransform, cbSize) {
    result := DllCall("UXTHEME.dll\GetThemeAnimationTransform", HTHEME, _hTheme, "int", iStoryboardId, "int", iTargetId, "uint", dwTransformIndex, "ptr", pTransform, "uint", cbSize, "uint*", &pcbSizeOut := 0, "HRESULT")
    return pcbSizeOut
}

/**
 * Gets a predefined timing function based on a timing function identifier.
 * @param {HTHEME} _hTheme An opened theme handle.
 * @param {Integer} iTimingFunctionId A timing function identifier.
 * @param {Integer} pTimingFunction A buffer to receive a predefined timing function pointer.
 * @param {Integer} cbSize The byte size of the buffer pointed by <i>pTimingFunction</i>.
 * @returns {Integer} The byte size of
 * the timing function structure.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-getthemetimingfunction
 * @since windows8.0
 */
export GetThemeTimingFunction(_hTheme, iTimingFunctionId, pTimingFunction, cbSize) {
    result := DllCall("UXTHEME.dll\GetThemeTimingFunction", HTHEME, _hTheme, "int", iTimingFunctionId, "ptr", pTimingFunction, "uint", cbSize, "uint*", &pcbSizeOut := 0, "HRESULT")
    return pcbSizeOut
}

/**
 * Opens the theme data for a window and its associated class.
 * @remarks
 * The <i>pszClassList</i> parameter contains a list, not just a single name, to provide the class an opportunity to get the best match between the class and the current visual style. For example, a button might pass L"OkButton;Button" 
 * if its ID is ID_OK. If the current visual style has an entry for OkButton, that is used; otherwise no visual style is applied.
 * 
 * Class names for the Aero theme are defined in AeroStyle.xml.
 * @param {HWND} _hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * Handle of the window for which theme data is required.
 * @param {PWSTR} pszClassList Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
 * 
 * Pointer to a string that contains a semicolon-separated list of classes.
 * @returns {HTHEME} Type: <b>HTHEME</b>
 * 
 * <b>OpenThemeData</b> tries to match each class, one at a time, to a class data section in the active theme. If a match is found, an associated HTHEME handle is returned. If no match is found <b>NULL</b> is returned.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-openthemedata
 * @since windows6.0.6000
 */
export OpenThemeData(_hwnd, pszClassList) {
    pszClassList := pszClassList is String ? StrPtr(pszClassList) : pszClassList

    result := DllCall("UXTHEME.dll\OpenThemeData", HWND, _hwnd, "ptr", pszClassList, HTHEME.Owned)
    return result
}

/**
 * Opens the theme data associated with a window for specified theme classes.
 * @remarks
 * The string specified by <i>pszClassIdList</i> will be tokenized using semicolons as a delimiter. The names are matched against class names one token at a time. If no match is found for a particular token, the next token will be matched. If a match is found, the return value of the function will be the theme handle associated with the matched class.
 * 
 * Class names for the Aero theme are defined in AeroStyle.xml.
 * @param {HWND} _hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * A handle to a window or control that the theme is to be retrieved from.
 * @param {PWSTR} pszClassList Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
 * 
 * A semicolon-separated list of class names to match.
 * @param {OPEN_THEME_DATA_FLAGS} dwFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
 * @returns {HTHEME} Type: <b>HTHEME</b>
 * 
 * If a match is found, a valid handle to a theme is returned. Otherwise, a <b>NULL</b> value will be returned.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-openthemedataex
 * @since windows6.0.6000
 */
export OpenThemeDataEx(_hwnd, pszClassList, dwFlags) {
    pszClassList := pszClassList is String ? StrPtr(pszClassList) : pszClassList

    result := DllCall("UXTHEME.dll\OpenThemeDataEx", HWND, _hwnd, "ptr", pszClassList, OPEN_THEME_DATA_FLAGS, dwFlags, HTHEME.Owned)
    return result
}

/**
 * Closes the theme data handle.
 * @remarks
 * The <b>CloseThemeData</b> function should be called when a window that has a visual style applied is destroyed. This function should also be called whenever a window receives a <a href="https://docs.microsoft.com/windows/desktop/winmsg/wm-themechanged">WM_THEMECHANGED</a> message. This call should be followed by an attempt to create a new theme data handle if a call to the <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-isthemeactive">IsThemeActive</a> function returns <b>TRUE</b>.
 * @param {HTHEME} _hTheme Type: <b>HTHEME</b>
 * 
 * Handle to a window's specified theme data. Use <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-openthemedata">OpenThemeData</a> to create an <b>HTHEME</b>.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-closethemedata
 * @since windows6.0.6000
 */
export CloseThemeData(_hTheme) {
    result := DllCall("UXTHEME.dll\CloseThemeData", HTHEME, _hTheme, "HRESULT")
    return result
}

/**
 * Draws the border and fill defined by the visual style for the specified control part.
 * @remarks
 * Drawing operations are scaled to fit and not exceed the rectangle specified in <i>pRect</i>. Your application should not draw outside the rectangle specified by <i>pClipRect</i>.
 * @param {HTHEME} _hTheme Type: <b>HTHEME</b>
 * 
 * Handle to a window's specified theme data. Use <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-openthemedata">OpenThemeData</a> to create an HTHEME.
 * @param {HDC} _hdc Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a></b>
 * 
 * HDC used for drawing the theme-defined background image.
 * @param {Integer} iPartId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the part to draw. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {Integer} iStateId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the state of the part to draw. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {Pointer<RECT>} pRect Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
 * 
 * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains the rectangle, in logical coordinates, in which the background image is drawn.
 * @param {Pointer<RECT>} pClipRect Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
 * 
 * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains a clipping rectangle. This parameter may be set to <b>NULL</b>.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-drawthemebackground
 * @since windows6.0.6000
 */
export DrawThemeBackground(_hTheme, _hdc, iPartId, iStateId, pRect, pClipRect) {
    result := DllCall("UXTHEME.dll\DrawThemeBackground", HTHEME, _hTheme, HDC, _hdc, "int", iPartId, "int", iStateId, RECT.Ptr, pRect, RECT.Ptr, pClipRect, "HRESULT")
    return result
}

/**
 * Draws the background image defined by the visual style for the specified control part.
 * @remarks
 * Drawing operations are scaled to fit and to not exceed the rectangle specified in <i>pRect</i>.
 * @param {HTHEME} _hTheme Type: <b>HTHEME</b>
 * 
 * Handle to a window's specified theme data. Use <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-openthemedata">OpenThemeData</a> to create an HTHEME.
 * @param {HDC} _hdc Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a></b>
 * 
 * HDC used for drawing the theme-defined background image.
 * @param {Integer} iPartId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the part to draw. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {Integer} iStateId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the state of the part to draw. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {Pointer<RECT>} pRect Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
 * 
 * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains the rectangle, in logical coordinates, in which the background image is drawn.
 * @param {Pointer<DTBGOPTS>} pOptions Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/ns-uxtheme-dtbgopts">DTBGOPTS</a>*</b>
 * 
 * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/ns-uxtheme-dtbgopts">DTBGOPTS</a> structure that contains clipping information. This parameter may be set to <b>NULL</b>.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-drawthemebackgroundex
 * @since windows6.0.6000
 */
export DrawThemeBackgroundEx(_hTheme, _hdc, iPartId, iStateId, pRect, pOptions) {
    result := DllCall("UXTHEME.dll\DrawThemeBackgroundEx", HTHEME, _hTheme, HDC, _hdc, "int", iPartId, "int", iStateId, RECT.Ptr, pRect, DTBGOPTS.Ptr, pOptions, "HRESULT")
    return result
}

/**
 * Draws text using the color and font defined by the visual style.
 * @remarks
 * The function always uses the themed font for the specified part and state if one is defined. Otherwise it uses the font currently selected into the device context. To find out if a themed font is defined, you can call <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-getthemefont">GetThemeFont</a> or <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-getthemepropertyorigin">GetThemePropertyOrigin</a> with TMT_FONT as the property identifier.
 * @param {HTHEME} _hTheme Type: <b>HTHEME</b>
 * 
 * Handle to a window's theme data. Use <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-openthemedata">OpenThemeData</a> to create an HTHEME.
 * @param {HDC} _hdc Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a></b>
 * 
 * HDC to use for drawing.
 * @param {Integer} iPartId Type: <b>int</b>
 * 
 * The control part that has the desired text appearance. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>. If this value is 0, the text is drawn in the default font, or a font selected into the device context.
 * @param {Integer} iStateId Type: <b>int</b>
 * 
 * The control state that has the desired text appearance. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {PWSTR} pszText Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
 * 
 * Pointer to a string that contains the text to draw.
 * @param {Integer} cchText Type: <b>int</b>
 * 
 * Value of type <b>int</b> that contains the number of characters to draw. If the parameter is set to -1, all the characters in the string are drawn.
 * @param {DRAW_TEXT_FORMAT} dwTextFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
 * 
 * <b>DWORD</b> that contains one or more values that specify the string's formatting. See <a href="https://docs.microsoft.com/windows/desktop/Controls/theme-format-values">Format Values</a> for possible parameter values. 
 * 
 * <div class="alert"><b>Note</b>  DrawThemeText does not support DT_CALCRECT.  However, <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-drawthemetextex">DrawThemeTextEx</a> does support DT_CALCRECT.</div>
 * <div> </div>
 * @param {Integer} dwTextFlags2 Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
 * 
 * Not used. Set to zero.
 * @param {Pointer<RECT>} pRect Type: <b>LPCRECT</b>
 * 
 * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains the rectangle, in logical coordinates, in which the text is to be drawn.  It is recommended to use <b>pExtentRect</b> from <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-getthemetextextent">GetThemeTextExtent</a> to retrieve the correct coordinates.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-drawthemetext
 * @since windows6.0.6000
 */
export DrawThemeText(_hTheme, _hdc, iPartId, iStateId, pszText, cchText, dwTextFlags, dwTextFlags2, pRect) {
    pszText := pszText is String ? StrPtr(pszText) : pszText

    result := DllCall("UxTheme.dll\DrawThemeText", HTHEME, _hTheme, HDC, _hdc, "int", iPartId, "int", iStateId, "ptr", pszText, "int", cchText, DRAW_TEXT_FORMAT, dwTextFlags, "uint", dwTextFlags2, RECT.Ptr, pRect, "HRESULT")
    return result
}

/**
 * Retrieves the size of the content area for the background defined by the visual style.
 * @remarks
 * A visual style can define a content area within each background image. This is the area where content such as text and icons can be placed without overwriting background borders.
 * @param {HTHEME} _hTheme Type: <b>HTHEME</b>
 * 
 * Handle to a window's specified theme data. Use <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-openthemedata">OpenThemeData</a> to create an HTHEME.
 * @param {HDC} _hdc Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a></b>
 * 
 * HDC to use when drawing. This parameter may be set to <b>NULL</b>.
 * @param {Integer} iPartId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the part that contains the content area. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {Integer} iStateId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the state of the part that contains the content area. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {Pointer<RECT>} pBoundingRect Type: <b>LPCRECT</b>
 * 
 * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains the total background rectangle, in logical coordinates. This is the area inside the borders or margins.
 * @param {Pointer<RECT>} pContentRect Type: <b>LPRECT</b>
 * 
 * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that receives the content area background rectangle, in logical coordinates.  This rectangle is calculated to fit the content area.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-getthemebackgroundcontentrect
 * @since windows6.0.6000
 */
export GetThemeBackgroundContentRect(_hTheme, _hdc, iPartId, iStateId, pBoundingRect, pContentRect) {
    result := DllCall("UXTHEME.dll\GetThemeBackgroundContentRect", HTHEME, _hTheme, HDC, _hdc, "int", iPartId, "int", iStateId, RECT.Ptr, pBoundingRect, RECT.Ptr, pContentRect, "HRESULT")
    return result
}

/**
 * Calculates the size and location of the background, defined by the visual style, given the content area.
 * @remarks
 * A theme can define a content area within each background image. This is the area where content such as text and icons can be placed without overwriting background borders.
 * @param {HTHEME} _hTheme Type: <b>HTHEME</b>
 * 
 * Handle to a window's specified theme data. Use <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-openthemedata">OpenThemeData</a> to create an HTHEME.
 * @param {HDC} _hdc Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a></b>
 * 
 * HDC to use when drawing. This parameter may be set to <b>NULL</b>.
 * @param {Integer} iPartId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the part that contains the content. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {Integer} iStateId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the state of the part that contains the content. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {Pointer<RECT>} pContentRect Type: <b>LPCRECT</b>
 * 
 * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains the content background rectangle, in logical coordinates. This rectangle is returned from <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-getthemebackgroundcontentrect">GetThemeBackgroundContentRect</a>.
 * @param {Pointer<RECT>} pExtentRect Type: <b>LPRECT</b>
 * 
 * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that receives the background rectangle, in logical coordinates. This rectangle is based on the <i>pContentRect</i>.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-getthemebackgroundextent
 * @since windows6.0.6000
 */
export GetThemeBackgroundExtent(_hTheme, _hdc, iPartId, iStateId, pContentRect, pExtentRect) {
    result := DllCall("UXTHEME.dll\GetThemeBackgroundExtent", HTHEME, _hTheme, HDC, _hdc, "int", iPartId, "int", iStateId, RECT.Ptr, pContentRect, RECT.Ptr, pExtentRect, "HRESULT")
    return result
}

/**
 * Computes the region for a regular or partially transparent background that is bounded by a specified rectangle.
 * @remarks
 * The region handle that is returned by this function should be released when it is no longer needed, using <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-deleteobject">DeleteObject</a>.
 * @param {HTHEME} _hTheme Type: <b>HTHEME</b>
 * 
 * Handle to a window's specified theme data. Use <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-openthemedata">OpenThemeData</a> to create an HTHEME.
 * @param {HDC} _hdc Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a></b>
 * 
 * HDC to draw into. The DC uses dots per inch (DPI) scaling. This parameter may be set to <b>NULL</b>.
 * @param {Integer} iPartId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the part that contains the region. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {Integer} iStateId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the state of the part. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {Pointer<RECT>} pRect Type: <b>LPCRECT</b>
 * 
 * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains, in logical coordinates, the specified rectangle used to compute the region.
 * @returns {HRGN} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRGN</a>*</b>
 * 
 * Pointer to the handle to the computed <a href="https://docs.microsoft.com/windows/desktop/gdi/regions">region</a>.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-getthemebackgroundregion
 * @since windows6.0.6000
 */
export GetThemeBackgroundRegion(_hTheme, _hdc, iPartId, iStateId, pRect) {
    pRegion := HRGN.Owned()
    result := DllCall("UxTheme.dll\GetThemeBackgroundRegion", HTHEME, _hTheme, HDC, _hdc, "int", iPartId, "int", iStateId, RECT.Ptr, pRect, HRGN.Ptr, pRegion, "HRESULT")
    return pRegion
}

/**
 * Calculates the original size of the part defined by a visual style.
 * @param {HTHEME} _hTheme Type: <b>HTHEME</b>
 * 
 * Handle to a window's specified theme data. Use <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-openthemedata">OpenThemeData</a> to create an HTHEME.
 * @param {HDC} _hdc Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a></b>
 * 
 * HDC to select fonts into.
 * @param {Integer} iPartId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the part to calculate the size of. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {Integer} iStateId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the state of the part. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {Pointer<RECT>} prc Type: <b>LPCRECT</b>
 * 
 * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains the rectangle used for the part drawing destination. This parameter may be set to <b>NULL</b>.
 * @param {THEMESIZE} eSize 
 * @param {Pointer<SIZE>} psz Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-size">SIZE</a>*</b>
 * 
 * Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-size">SIZE</a> structure that receives the dimensions of the specified part.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-getthemepartsize
 * @since windows6.0.6000
 */
export GetThemePartSize(_hTheme, _hdc, iPartId, iStateId, prc, eSize, psz) {
    result := DllCall("UXTHEME.dll\GetThemePartSize", HTHEME, _hTheme, HDC, _hdc, "int", iPartId, "int", iStateId, RECT.Ptr, prc, THEMESIZE, eSize, SIZE.Ptr, psz, "HRESULT")
    return result
}

/**
 * Calculates the size and location of the specified text when rendered in the visual style font.
 * @param {HTHEME} _hTheme Type: <b>HTHEME</b>
 * 
 * Handle to a window's specified theme data. Use <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-openthemedata">OpenThemeData</a> to create an HTHEME.
 * @param {HDC} _hdc Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a></b>
 * 
 * HDC to select the font into.
 * @param {Integer} iPartId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the part in which the text will be drawn. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {Integer} iStateId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the state of the part. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {PWSTR} pszText Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
 * 
 * Pointer to a string that contains the text to draw.
 * @param {Integer} cchCharCount Type: <b>int</b>
 * 
 * Value of type <b>int</b> that contains the number of characters to draw. If the parameter is set to -1, all the characters in the string are drawn.
 * @param {DRAW_TEXT_FORMAT} dwTextFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
 * 
 * <b>DWORD</b> that contains one or more values that specify the string's formatting. See <a href="https://docs.microsoft.com/windows/desktop/Controls/theme-format-values">Format Values</a> for possible parameter values.
 * @param {Pointer<RECT>} pBoundingRect Type: <b>LPCRECT</b>
 * 
 * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains the rectangle used to control layout of the text. This parameter may be set to <b>NULL</b>.
 * @param {Pointer<RECT>} pExtentRect Type: <b>LPRECT</b>
 * 
 * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains, in logical coordinates, the rectangle required to fit the rendered text.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-getthemetextextent
 * @since windows6.0.6000
 */
export GetThemeTextExtent(_hTheme, _hdc, iPartId, iStateId, pszText, cchCharCount, dwTextFlags, pBoundingRect, pExtentRect) {
    pszText := pszText is String ? StrPtr(pszText) : pszText

    result := DllCall("UxTheme.dll\GetThemeTextExtent", HTHEME, _hTheme, HDC, _hdc, "int", iPartId, "int", iStateId, "ptr", pszText, "int", cchCharCount, DRAW_TEXT_FORMAT, dwTextFlags, RECT.Ptr, pBoundingRect, RECT.Ptr, pExtentRect, "HRESULT")
    return result
}

/**
 * Retrieves information about the font specified by a visual style for a particular part.
 * @param {HTHEME} _hTheme Type: <b>HTHEME</b>
 * 
 * Handle to a window's specified theme data. Use <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-openthemedata">OpenThemeData</a> to create an HTHEME.
 * @param {HDC} _hdc Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a></b>
 * 
 * HDC to use for screen context. This parameter may be set to <b>NULL</b>.
 * @param {Integer} iPartId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the part to retrieve font information about. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {Integer} iStateId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the state of the part. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {Pointer<TEXTMETRICW>} ptm Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-textmetrica">TEXTMETRIC</a>*</b>
 * 
 * Receives the font information.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-getthemetextmetrics
 * @since windows6.0.6000
 */
export GetThemeTextMetrics(_hTheme, _hdc, iPartId, iStateId, ptm) {
    result := DllCall("UxTheme.dll\GetThemeTextMetrics", HTHEME, _hTheme, HDC, _hdc, "int", iPartId, "int", iStateId, TEXTMETRICW.Ptr, ptm, "HRESULT")
    return result
}

/**
 * Retrieves a hit test code for a point in the background specified by a visual style.
 * @remarks
 * The values in <i>ptTest</i> and <i>pRect</i> should be in the same coordinate system, such as client or screen. If the <i>hrgn</i> parameter is used, it must be specified in the same coordinates as <i>pRect</i> and <i>ptTest</i>.
 * @param {HTHEME} _hTheme Type: <b>HTHEME</b>
 * 
 * Handle to a window's specified theme data. Use <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-openthemedata">OpenThemeData</a> to create an HTHEME.
 * @param {HDC} _hdc Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a></b>
 * 
 * HDC to use when drawing. This parameter may be set to <b>NULL</b>.
 * @param {Integer} iPartId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the part. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {Integer} iStateId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the state of the part. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {HIT_TEST_BACKGROUND_OPTIONS} dwOptions Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
 * 
 * <b>DWORD</b> that specifies the hit test options. See <a href="https://docs.microsoft.com/windows/desktop/Controls/theme-hit-test-options">Hit Test Options</a> for a list of options.
 * @param {Pointer<RECT>} pRect Type: <b>LPCRECT</b>
 * 
 * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains, in logical coordinates, the rectangle that bounds the background.
 * @param {HRGN} _hrgn Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRGN</a></b>
 * 
 * Handle to a region that can be used to specify the bounds of a hit test area. This parameter may be set to <b>NULL</b>.
 * @param {POINT} ptTest Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a></b>
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a> structure that contains the coordinates of the point.
 * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WORD</a>*</b>
 * 
 * <b>WORD</b> that receives the hit test code that indicates whether the point in <i>ptTest</i> is in the background area bounded by <i>pRect</i> or <i>hrgn</i>. See <a href="https://docs.microsoft.com/windows/desktop/Controls/theme-hit-test-retval">Hit Test Return Values</a> for a list of values returned.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-hittestthemebackground
 * @since windows6.0.6000
 */
export HitTestThemeBackground(_hTheme, _hdc, iPartId, iStateId, dwOptions, pRect, _hrgn, ptTest) {
    result := DllCall("UxTheme.dll\HitTestThemeBackground", HTHEME, _hTheme, HDC, _hdc, "int", iPartId, "int", iStateId, HIT_TEST_BACKGROUND_OPTIONS, dwOptions, RECT.Ptr, pRect, HRGN, _hrgn, POINT, ptTest, "ushort*", &pwHitTestCode := 0, "HRESULT")
    return pwHitTestCode
}

/**
 * Draws one or more edges defined by the visual style of a rectangle.
 * @param {HTHEME} _hTheme Type: <b>HTHEME</b>
 * 
 * Handle to a window's specified theme data. Use <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-openthemedata">OpenThemeData</a> to create an HTHEME.
 * @param {HDC} _hdc Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a></b>
 * 
 * HDC.
 * @param {Integer} iPartId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the part that contains the rectangle. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {Integer} iStateId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the state of the part. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {Pointer<RECT>} pDestRect Type: <b>LPCRECT</b>
 * 
 * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains, in logical coordinates, the rectangle.
 * @param {DRAWEDGE_FLAGS} uEdge Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * <b>UINT</b> that specifies the type of inner and outer edges to draw. This parameter must be a combination of one inner-border flag and one outer-border flag, or one of the combination flags. The border flags are:
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id=""></a><dl>
 * <dt><b></b></dt>
 * <dt>BDR_RAISEDINNER</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Raised inner edge
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id=""></a><dl>
 * <dt><b></b></dt>
 * <dt>BDR_SUNKENINNER</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Sunken inner edge
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id=""></a><dl>
 * <dt><b></b></dt>
 * <dt>BDR_RAISEDOUTER</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Raised outer edge
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id=""></a><dl>
 * <dt><b></b></dt>
 * <dt>BDR_SUNKENOUTER</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Sunken outer edge
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id=""></a><dl>
 * <dt><b></b></dt>
 * <dt>EDGE_BUMP</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Combination of BDR_RAISEDOUTER and BDR_SUNKENINNER
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id=""></a><dl>
 * <dt><b></b></dt>
 * <dt>EDGE_ETCHED</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Combination of BDR_SUNKENOUTER and BDR_RAISEDINNER
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id=""></a><dl>
 * <dt><b></b></dt>
 * <dt>EDGE_RAISED</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Combination of BDR_RAISEDOUTER and BDR_RAISEDINNER
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id=""></a><dl>
 * <dt><b></b></dt>
 * <dt>EDGE_SUNKEN</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Combination of BDR_SUNKENOUTER and BDR_SUNKENINNER
 * 
 * </td>
 * </tr>
 * </table>
 * @param {DRAW_EDGE_FLAGS} uFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * @param {Pointer<RECT>} pContentRect Type: <b>LPRECT</b>
 * 
 * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains, in logical coordinates, the rectangle that receives the interior rectangle, if <i>uFlags</i> is set to BF_ADJUST. This parameter may be set to <b>NULL</b>.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-drawthemeedge
 * @since windows6.0.6000
 */
export DrawThemeEdge(_hTheme, _hdc, iPartId, iStateId, pDestRect, uEdge, uFlags, pContentRect) {
    result := DllCall("UxTheme.dll\DrawThemeEdge", HTHEME, _hTheme, HDC, _hdc, "int", iPartId, "int", iStateId, RECT.Ptr, pDestRect, DRAWEDGE_FLAGS, uEdge, DRAW_EDGE_FLAGS, uFlags, RECT.Ptr, pContentRect, "HRESULT")
    return result
}

/**
 * Draws an image from an image list with the icon effect defined by the visual style.
 * @param {HTHEME} _hTheme Type: <b>HTHEME</b>
 * 
 * Handle to a window's specified theme data. Use <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-openthemedata">OpenThemeData</a> to create an HTHEME.
 * @param {HDC} _hdc Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a></b>
 * 
 * HDC.
 * @param {Integer} iPartId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the part in which the image is drawn. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {Integer} iStateId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the state of the part. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {Pointer<RECT>} pRect Type: <b>LPCRECT</b>
 * 
 * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains, in logical coordinates, the rectangle in which the image is drawn.
 * @param {HIMAGELIST} himl Type: <b>HIMAGELIST</b>
 * 
 * Handle to an <a href="https://docs.microsoft.com/windows/desktop/api/commoncontrols/nn-commoncontrols-iimagelist">image list</a> that contains the image to draw.
 * @param {Integer} iImageIndex Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the index of the image to draw.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-drawthemeicon
 * @since windows6.0.6000
 */
export DrawThemeIcon(_hTheme, _hdc, iPartId, iStateId, pRect, himl, iImageIndex) {
    result := DllCall("UxTheme.dll\DrawThemeIcon", HTHEME, _hTheme, HDC, _hdc, "int", iPartId, "int", iStateId, RECT.Ptr, pRect, HIMAGELIST, himl, "int", iImageIndex, "HRESULT")
    return result
}

/**
 * Retrieves whether a visual style has defined parameters for the specified part and state.
 * @param {HTHEME} _hTheme Type: <b>HTHEME</b>
 * 
 * Handle to a window's specified theme data. Use <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-openthemedata">OpenThemeData</a> to create an HTHEME.
 * @param {Integer} iPartId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the part. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {Integer} iStateId Type: <b>int</b>
 * 
 * Currently unused. The value should be 0.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Returns one of the following values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>TRUE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The theme has defined parameters for the specified <i>iPartId</i> and <i>iStateId</i>
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FALSE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The theme does not have defined parameters for the specified <i>iPartId</i> and <i>iStateId</i>
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-isthemepartdefined
 * @since windows6.0.6000
 */
export IsThemePartDefined(_hTheme, iPartId, iStateId) {
    result := DllCall("UXTHEME.dll\IsThemePartDefined", HTHEME, _hTheme, "int", iPartId, "int", iStateId, BOOL)
    return result
}

/**
 * Retrieves whether the background specified by the visual style has transparent pieces or alpha-blended pieces.
 * @param {HTHEME} _hTheme Type: <b>HTHEME</b>
 * 
 * Handle to a window's specified theme data. Use <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-openthemedata">OpenThemeData</a> to create an HTHEME.
 * @param {Integer} iPartId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the part. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {Integer} iStateId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the state of the part. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Returns one of the following values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>TRUE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The theme-specified background for a particular <i>iPartId</i> and <i>iStateId</i> has transparent pieces or alpha-blended pieces.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FALSE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The theme-specified background for a particular <i>iPartId</i> and <i>iStateId</i> does not have transparent pieces or alpha-blended pieces.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-isthemebackgroundpartiallytransparent
 * @since windows6.0.6000
 */
export IsThemeBackgroundPartiallyTransparent(_hTheme, iPartId, iStateId) {
    result := DllCall("UxTheme.dll\IsThemeBackgroundPartiallyTransparent", HTHEME, _hTheme, "int", iPartId, "int", iStateId, BOOL)
    return result
}

/**
 * Retrieves the value of a color property.
 * @param {HTHEME} _hTheme Type: <b>HTHEME</b>
 * 
 * Handle to a window's specified theme data. Use <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-openthemedata">OpenThemeData</a> to create an HTHEME.
 * @param {Integer} iPartId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the part that contains the color property. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {Integer} iStateId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the state of the part. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {Integer} iPropId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the property to retrieve. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/Controls/property-typedefs">Property Identifiers</a>.
 * @returns {COLORREF} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a>*</b>
 * 
 * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> structure that receives the color value.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-getthemecolor
 * @since windows6.0.6000
 */
export GetThemeColor(_hTheme, iPartId, iStateId, iPropId) {
    result := DllCall("UXTHEME.dll\GetThemeColor", HTHEME, _hTheme, "int", iPartId, "int", iStateId, "int", iPropId, COLORREF.Ptr, &pColor := 0, "HRESULT")
    return pColor
}

/**
 * Retrieves the value of a metric property.
 * @param {HTHEME} _hTheme Type: <b>HTHEME</b>
 * 
 * Handle to a window's specified theme data. Use <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-openthemedata">OpenThemeData</a> to create an HTHEME.
 * @param {HDC} _hdc Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a></b>
 * 
 * HDC. This parameter may be set to <b>NULL</b>.
 * @param {Integer} iPartId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the part that contains the metric property. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {Integer} iStateId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the state of the part. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {Integer} iPropId Type: <b>int</b>
 * @returns {Integer} Type: <b>int*</b>
 * 
 * Pointer to an <b>int</b> that receives the metric property value.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-getthememetric
 * @since windows6.0.6000
 */
export GetThemeMetric(_hTheme, _hdc, iPartId, iStateId, iPropId) {
    result := DllCall("UXTHEME.dll\GetThemeMetric", HTHEME, _hTheme, HDC, _hdc, "int", iPartId, "int", iStateId, "int", iPropId, "int*", &piVal := 0, "HRESULT")
    return piVal
}

/**
 * Retrieves the value of a string property.
 * @param {HTHEME} _hTheme Type: <b>HTHEME</b>
 * 
 * Handle to a window's specified theme data. Use <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-openthemedata">OpenThemeData</a> to create an HTHEME.
 * @param {Integer} iPartId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the part containing the string property. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {Integer} iStateId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the state of the part. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {Integer} iPropId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the property to retrieve. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/Controls/property-typedefs">Property Identifiers</a>.
 * @param {PWSTR} pszBuff Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPWSTR</a></b>
 * 
 * Pointer to a buffer that receives the string value.
 * @param {Integer} cchMaxBuffChars Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the maximum number of characters <i>pszBuff</i> can contain.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-getthemestring
 * @since windows6.0.6000
 */
export GetThemeString(_hTheme, iPartId, iStateId, iPropId, pszBuff, cchMaxBuffChars) {
    pszBuff := pszBuff is String ? StrPtr(pszBuff) : pszBuff

    result := DllCall("UxTheme.dll\GetThemeString", HTHEME, _hTheme, "int", iPartId, "int", iStateId, "int", iPropId, "ptr", pszBuff, "int", cchMaxBuffChars, "HRESULT")
    return result
}

/**
 * Retrieves the value of a BOOL property from the SysMetrics section of theme data.
 * @param {HTHEME} _hTheme Type: <b>HTHEME</b>
 * 
 * Handle to a window's specified theme data. Use <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-openthemedata">OpenThemeData</a> to create an HTHEME.
 * @param {Integer} iPartId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the part containing the BOOL property. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {Integer} iStateId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the state of the part. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {Integer} iPropId Type: <b>int</b>
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
 * 
 * Pointer to a <b>BOOL</b> that receives the retrieved property value.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-getthemebool
 * @since windows6.0.6000
 */
export GetThemeBool(_hTheme, iPartId, iStateId, iPropId) {
    result := DllCall("UxTheme.dll\GetThemeBool", HTHEME, _hTheme, "int", iPartId, "int", iStateId, "int", iPropId, BOOL.Ptr, &pfVal := 0, "HRESULT")
    return pfVal
}

/**
 * Retrieves the value of an int property.
 * @param {HTHEME} _hTheme Type: <b>HTHEME</b>
 * 
 * Handle to a window's specified theme data. Use <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-openthemedata">OpenThemeData</a> to create an HTHEME.
 * @param {Integer} iPartId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the part that contains the <b>int</b> property. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {Integer} iStateId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the state of the part. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {Integer} iPropId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the property to retrieve. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/Controls/property-typedefs">Property Identifiers</a>.
 * @returns {Integer} Type: <b>int*</b>
 * 
 * Pointer to an <b>int</b> that receives the retrieved value.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-getthemeint
 * @since windows6.0.6000
 */
export GetThemeInt(_hTheme, iPartId, iStateId, iPropId) {
    result := DllCall("UXTHEME.dll\GetThemeInt", HTHEME, _hTheme, "int", iPartId, "int", iStateId, "int", iPropId, "int*", &piVal := 0, "HRESULT")
    return piVal
}

/**
 * Retrieves the value of an enumerated type property.
 * @param {HTHEME} _hTheme Type: <b>HTHEME</b>
 * 
 * Handle to a window's specified theme data. Use <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-openthemedata">OpenThemeData</a> to create an HTHEME.
 * @param {Integer} iPartId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the part that contains the enumerated type property. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {Integer} iStateId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the state of the part. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {Integer} iPropId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the property to retrieve. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/Controls/property-typedefs">Property Identifiers</a>.
 * @returns {Integer} Type: <b>int*</b>
 * 
 * Pointer to an <b>int</b> that receives the enumerated type value.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-getthemeenumvalue
 * @since windows6.0.6000
 */
export GetThemeEnumValue(_hTheme, iPartId, iStateId, iPropId) {
    result := DllCall("UXTHEME.dll\GetThemeEnumValue", HTHEME, _hTheme, "int", iPartId, "int", iStateId, "int", iPropId, "int*", &piVal := 0, "HRESULT")
    return piVal
}

/**
 * Retrieves the value of a position property.
 * @remarks
 * The part in which the position is located determines the possible state values. For example, if the position is in a check box, the state could be checked or unchecked, but in a caption the possible states are active, inactive, or disabled.
 * @param {HTHEME} _hTheme Type: <b>HTHEME</b>
 * 
 * Handle to a window's specified theme data. Use <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-openthemedata">OpenThemeData</a> to create an HTHEME.
 * @param {Integer} iPartId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the part that contains the position property. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {Integer} iStateId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the state of the part. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {Integer} iPropId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the property to retrieve. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/Controls/property-typedefs">Property Identifiers</a>.
 * @param {Pointer<POINT>} pPoint Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a>*</b>
 * 
 * Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a> structure that receives the position value.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-getthemeposition
 * @since windows6.0.6000
 */
export GetThemePosition(_hTheme, iPartId, iStateId, iPropId, pPoint) {
    result := DllCall("UXTHEME.dll\GetThemePosition", HTHEME, _hTheme, "int", iPartId, "int", iStateId, "int", iPropId, POINT.Ptr, pPoint, "HRESULT")
    return result
}

/**
 * Retrieves the value of a font property.
 * @remarks
 * The font is scaled in dots per inch (DPI)  for the current logical screen.
 * 
 * If the property is not supported for the specified part and state, E_PROP_ID_UNSUPPORTED may be returned.
 * @param {HTHEME} _hTheme Type: <b>HTHEME</b>
 * 
 * Handle to a window's specified theme data. Use <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-openthemedata">OpenThemeData</a> to create an HTHEME.
 * @param {HDC} _hdc Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a></b>
 * 
 * HDC. This parameter may be set to <b>NULL</b>.
 * @param {Integer} iPartId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the part that contains the font property. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {Integer} iStateId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the state of the part. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {Integer} iPropId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the property to retrieve. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/Controls/property-typedefs">Property Identifiers</a>.
 * @param {Pointer<LOGFONTW>} pFont Type: <b>LOGFONTW*</b>
 * 
 * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a> structure that receives the font property value.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-getthemefont
 * @since windows6.0.6000
 */
export GetThemeFont(_hTheme, _hdc, iPartId, iStateId, iPropId, pFont) {
    result := DllCall("UXTHEME.dll\GetThemeFont", HTHEME, _hTheme, HDC, _hdc, "int", iPartId, "int", iStateId, "int", iPropId, LOGFONTW.Ptr, pFont, "HRESULT")
    return result
}

/**
 * Retrieves the value of a RECT property.
 * @param {HTHEME} _hTheme Type: <b>HTHEME</b>
 * 
 * Handle to a window's specified theme data. Use <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-openthemedata">OpenThemeData</a> to create an HTHEME.
 * @param {Integer} iPartId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the part containing the <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> property. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {Integer} iStateId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the state of the part. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {Integer} iPropId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the property to retrieve. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/Controls/property-typedefs">Property Identifiers</a>.
 * @param {Pointer<RECT>} pRect Type: <b>LPRECT</b>
 * 
 * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that receives a  rectangle.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-getthemerect
 * @since windows6.0.6000
 */
export GetThemeRect(_hTheme, iPartId, iStateId, iPropId, pRect) {
    result := DllCall("UXTHEME.dll\GetThemeRect", HTHEME, _hTheme, "int", iPartId, "int", iStateId, "int", iPropId, RECT.Ptr, pRect, "HRESULT")
    return result
}

/**
 * Retrieves the value of a MARGINS property.
 * @param {HTHEME} _hTheme Type: <b>HTHEME</b>
 * 
 * Handle to a window's specified theme data. Use <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-openthemedata">OpenThemeData</a> to create an HTHEME.
 * @param {HDC} _hdc Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a></b>
 * 
 * HDC to select fonts into. This parameter may be set to <b>NULL</b>.
 * @param {Integer} iPartId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the part that contains the <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/ns-uxtheme-margins">MARGINS</a> property. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {Integer} iStateId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the state of the part. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {Integer} iPropId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the property to retrieve. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/Controls/property-typedefs">Property Identifiers</a>.
 * @param {Pointer<RECT>} prc Type: <b>LPRECT</b>
 * 
 * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains the rectangle that specifies the area to be drawn into. This parameter may be set to <b>NULL</b>.
 * @param {Pointer<MARGINS>} pMargins Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/ns-uxtheme-margins">MARGINS</a>*</b>
 * 
 * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/ns-uxtheme-margins">MARGINS</a> structure that receives the retrieved value.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-getthememargins
 * @since windows6.0.6000
 */
export GetThemeMargins(_hTheme, _hdc, iPartId, iStateId, iPropId, prc, pMargins) {
    result := DllCall("UXTHEME.dll\GetThemeMargins", HTHEME, _hTheme, HDC, _hdc, "int", iPartId, "int", iStateId, "int", iPropId, RECT.Ptr, prc, MARGINS.Ptr, pMargins, "HRESULT")
    return result
}

/**
 * Retrieves a list of int data from a visual style.
 * @param {HTHEME} _hTheme Type: <b>HTHEME</b>
 * 
 * Handle to a window's specified theme data. Use <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-openthemedata">OpenThemeData</a> to create an HTHEME.
 * @param {Integer} iPartId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the part that contains the list of data to return. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {Integer} iStateId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the state of the part. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {Integer} iPropId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the property to retrieve. See <a href="https://docs.microsoft.com/windows/desktop/Controls/property-typedefs">Property Identifiers</a>.
 * @param {Pointer<INTLIST>} pIntList Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/ns-uxtheme-intlist">INTLIST</a>*</b>
 * 
 * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/ns-uxtheme-intlist">INTLIST</a> structure that receives the <b>int</b> data.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful, otherwise an error code.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-getthemeintlist
 * @since windows6.0.6000
 */
export GetThemeIntList(_hTheme, iPartId, iStateId, iPropId, pIntList) {
    result := DllCall("UxTheme.dll\GetThemeIntList", HTHEME, _hTheme, "int", iPartId, "int", iStateId, "int", iPropId, INTLIST.Ptr, pIntList, "HRESULT")
    return result
}

/**
 * Retrieves the location of the theme property definition for a property.
 * @param {HTHEME} _hTheme Type: <b>HTHEME</b>
 * 
 * Handle to a window's specified theme data. Use <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-openthemedata">OpenThemeData</a> to create an HTHEME.
 * @param {Integer} iPartId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the part that contains the theme. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {Integer} iStateId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the state of the part. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {Integer} iPropId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the property to retrieve. You may use any of the property values from Vssym32.h. These values are described in the reference pages for the functions that use them. For instance, the <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-getthemeint">GetThemeInt</a> function uses the TMT_BORDERSIZE value. See the <a href="https://docs.microsoft.com/windows/desktop/Controls/uxctl-ref">Visual Styles Reference</a> for a list of functions.
 * @returns {PROPERTYORIGIN} 
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-getthemepropertyorigin
 * @since windows6.0.6000
 */
export GetThemePropertyOrigin(_hTheme, iPartId, iStateId, iPropId) {
    result := DllCall("UxTheme.dll\GetThemePropertyOrigin", HTHEME, _hTheme, "int", iPartId, "int", iStateId, "int", iPropId, "int*", &pOrigin := 0, "HRESULT")
    return pOrigin
}

/**
 * Causes a window to use a different set of visual style information than its class normally uses.
 * @remarks
 * The theme manager retains the <i>pszSubAppName</i> and the <i>pszSubIdList</i> associations through the lifetime of the window, even if visual styles subsequently change. The window is sent a <a href="https://docs.microsoft.com/windows/desktop/winmsg/wm-themechanged">WM_THEMECHANGED</a> message at the end of a <b>SetWindowTheme</b> call, so that the new visual style can be found and applied.
 * 
 * 
 * When <i>pszSubAppName</i> and <i>pszSubIdList</i> are <b>NULL</b>, the theme manager removes the previously applied associations. You can prevent visual styles from being applied to a specified window by specifying an empty string, (L" "), which does not match any section entries.
 * @param {HWND} _hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * Handle to the window whose visual style information is to be changed.
 * @param {PWSTR} pszSubAppName Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
 * 
 * Pointer to a string that contains the application name to use in place of the calling application's name. If this parameter is <b>NULL</b>, the calling application's name is used.
 * @param {PWSTR} pszSubIdList Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
 * 
 * Pointer to a string that contains a semicolon-separated list of CLSID names to use in place of the actual list passed by the window's class. If this parameter is <b>NULL</b>, the ID list from the calling class is used.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-setwindowtheme
 * @since windows6.0.6000
 */
export SetWindowTheme(_hwnd, pszSubAppName, pszSubIdList) {
    pszSubAppName := pszSubAppName is String ? StrPtr(pszSubAppName) : pszSubAppName
    pszSubIdList := pszSubIdList is String ? StrPtr(pszSubIdList) : pszSubIdList

    result := DllCall("UXTHEME.dll\SetWindowTheme", HWND, _hwnd, "ptr", pszSubAppName, "ptr", pszSubIdList, "HRESULT")
    return result
}

/**
 * Retrieves the value of a filename property.
 * @param {HTHEME} _hTheme Type: <b>HTHEME</b>
 * 
 * Handle to a window's specified theme data. Use <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-openthemedata">OpenThemeData</a> to create an HTHEME.
 * @param {Integer} iPartId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the part that contains the filename property. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {Integer} iStateId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the state of the part. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {Integer} iPropId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the property to retrieve. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/Controls/property-typedefs">Property Identifiers</a>.
 * @param {PWSTR} pszThemeFileName Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPWSTR</a></b>
 * 
 * Pointer to a buffer that receives the retrieved file name.
 * @param {Integer} cchMaxBuffChars Type: <b>int</b>
 * 
 * Value of type <b>int</b> that receives the maximum number of characters in the file name
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-getthemefilename
 * @since windows6.0.6000
 */
export GetThemeFilename(_hTheme, iPartId, iStateId, iPropId, pszThemeFileName, cchMaxBuffChars) {
    pszThemeFileName := pszThemeFileName is String ? StrPtr(pszThemeFileName) : pszThemeFileName

    result := DllCall("UxTheme.dll\GetThemeFilename", HTHEME, _hTheme, "int", iPartId, "int", iStateId, "int", iPropId, "ptr", pszThemeFileName, "int", cchMaxBuffChars, "HRESULT")
    return result
}

/**
 * Retrieves the value of a system color.
 * @remarks
 * If the theme data handle is not a <b>NULL</b> handle, this function returns the color from the SysMetrics section of the current visual style. If the theme data handle is <b>NULL</b>, this function returns the color matching the global system color.
 * @param {HTHEME} _hTheme Type: <b>HTHEME</b>
 * 
 * Handle to theme data.
 * @param {Integer} iColorId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the color number. May be one of the values listed in <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getsyscolor">GetSysColor</a> for the <i>nIndex</i> parameter.
 * @returns {COLORREF} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
 * 
 * The value of the specified system color.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-getthemesyscolor
 * @since windows6.0.6000
 */
export GetThemeSysColor(_hTheme, iColorId) {
    result := DllCall("UxTheme.dll\GetThemeSysColor", HTHEME, _hTheme, "int", iColorId, COLORREF)
    return result
}

/**
 * Retrieves a system color brush.
 * @remarks
 * If the theme data handle is not a <b>NULL</b> handle, <b>GetThemeSysColorBrush</b> returns the brush that matches the specified color from the SysMetrics section of the visual style. If the theme data handle is <b>NULL</b>, the function returns the brush matching the global system color.
 * 
 * 
 * The brush handle that is returned by this function should be released when it is no longer needed using <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-deleteobject">DeleteObject</a>.
 * @param {HTHEME} _hTheme Type: <b>HTHEME</b>
 * 
 * Handle to theme data.
 * @param {Integer} iColorId Type: <b>int</b>
 * @returns {HBRUSH} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HBRUSH</a></b>
 * 
 * Handle to brush data.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-getthemesyscolorbrush
 * @since windows6.0.6000
 */
export GetThemeSysColorBrush(_hTheme, iColorId) {
    result := DllCall("UxTheme.dll\GetThemeSysColorBrush", HTHEME, _hTheme, "int", iColorId, HBRUSH.Owned)
    return result
}

/**
 * Retrieves the Boolean value of a system metric.
 * @remarks
 * If the theme data handle is not a <b>NULL</b> handle, this function returns the desired <b>BOOL</b> from the SysMetrics section of the visual style. If the theme data handle is <b>NULL</b>, this function returns the value of the specified system Boolean.
 * @param {HTHEME} _hTheme Type: <b>HTHEME</b>
 * 
 * Handle to theme data.
 * @param {Integer} iBoolId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the system Boolean metric desired. May be the following value.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="TMT_FLATMENUS"></a><a id="tmt_flatmenus"></a><dl>
 * <dt><b>TMT_FLATMENUS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Describes how menus are drawn. If <b>TRUE</b>, menus are drawn without shadows. If <b>FALSE</b>, menus have shadows underneath them.
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Value of desired system metric.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-getthemesysbool
 * @since windows6.0.6000
 */
export GetThemeSysBool(_hTheme, iBoolId) {
    result := DllCall("UxTheme.dll\GetThemeSysBool", HTHEME, _hTheme, "int", iBoolId, BOOL)
    return result
}

/**
 * Retrieves the value of a system size metric from theme data.
 * @remarks
 * If <i>hTheme</i> is <b> not </b>  <b>NULL</b>, this function returns the size stored in the current visual style (SysMetrics section of the visual style) scaled to the current screen dpi.  If <i>hTheme</i> is <b>NULL</b>, this function returns the global system metric in pixels that is scaled to the current dpi only if the application is marked as dpi-aware; otherwise, the pixels returned are unscaled.
 * @param {HTHEME} _hTheme Type: <b>HTHEME</b>
 * 
 * Handle to theme data.
 * @param {Integer} iSizeId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the system size metric desired. The following values are valid:
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SM_CXBORDER"></a><a id="sm_cxborder"></a><dl>
 * <dt><b>SM_CXBORDER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Specifies the width of a border.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SM_CXVSCROLL"></a><a id="sm_cxvscroll"></a><dl>
 * <dt><b>SM_CXVSCROLL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Specifies the width of a scroll bar.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SM_CXHSCROLL"></a><a id="sm_cxhscroll"></a><dl>
 * <dt><b>SM_CXHSCROLL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Specifies the height of a scroll bar.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SM_CXSIZE"></a><a id="sm_cxsize"></a><dl>
 * <dt><b>SM_CXSIZE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Specifies the width of a caption.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SM_CYSIZE"></a><a id="sm_cysize"></a><dl>
 * <dt><b>SM_CYSIZE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Specifies the height of a caption.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SM_CXSMSIZE"></a><a id="sm_cxsmsize"></a><dl>
 * <dt><b>SM_CXSMSIZE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Specifies the width of a small caption.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SM_CYSMSIZE"></a><a id="sm_cysmsize"></a><dl>
 * <dt><b>SM_CYSMSIZE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Specifies the height of a small caption.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SM_CXMENUSIZE"></a><a id="sm_cxmenusize"></a><dl>
 * <dt><b>SM_CXMENUSIZE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Specifies the width of a menu bar.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SM_CYMENUSIZE"></a><a id="sm_cymenusize"></a><dl>
 * <dt><b>SM_CYMENUSIZE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Specifies the height of a menu bar.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="SM_CXPADDEDBORDER"></a><a id="sm_cxpaddedborder"></a><dl>
 * <dt><b>SM_CXPADDEDBORDER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Specifies the amount of border padding for captioned windows.
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {Integer} Type: <b>int</b>
 * 
 * Returns the size in pixels.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-getthemesyssize
 * @since windows6.0.6000
 */
export GetThemeSysSize(_hTheme, iSizeId) {
    result := DllCall("UxTheme.dll\GetThemeSysSize", HTHEME, _hTheme, "int", iSizeId, Int32)
    return result
}

/**
 * Retrieves the LOGFONT of a system font.
 * @remarks
 * This function requires vssym32.h and uxtheme.h.
 * 
 * If the theme data handle is not a <b>NULL</b> handle, this function returns the desired <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a> from the SysMetrics section of the visual style. If the theme data handle is <b>NULL</b>, the function returns the value of the global system metric of the same type.
 * 
 * The font is scaled in dots per inch for the current logical screen.
 * @param {HTHEME} _hTheme Type: <b>HTHEME</b>
 * 
 * Handle to theme data.
 * @param {Integer} iFontId Type: <b>int</b>
 * @param {Pointer<LOGFONTW>} plf Type: <b>LOGFONTW*</b>
 * 
 * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a> structure that receives the font information from this function.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-getthemesysfont
 * @since windows6.0.6000
 */
export GetThemeSysFont(_hTheme, iFontId, plf) {
    result := DllCall("UxTheme.dll\GetThemeSysFont", HTHEME, _hTheme, "int", iFontId, LOGFONTW.Ptr, plf, "HRESULT")
    return result
}

/**
 * Retrieves the value of a system string.
 * @remarks
 * If the theme data handle is not a <b>NULL</b> handle, this function returns the desired string from the SysMetrics section of the visual style. If the theme data handle is <b>NULL</b>, this function returns the value of the global system metric of the same type.
 * @param {HTHEME} _hTheme Type: <b>HTHEME</b>
 * 
 * Handle to theme data.
 * @param {Integer} iStringId Type: <b>int</b>
 * @param {PWSTR} pszStringBuff Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPWSTR</a></b>
 * 
 * Pointer to the buffer that receives the string value from this function.
 * @param {Integer} cchMaxStringChars Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the maximum number of characters the string buffer can hold.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-getthemesysstring
 * @since windows6.0.6000
 */
export GetThemeSysString(_hTheme, iStringId, pszStringBuff, cchMaxStringChars) {
    pszStringBuff := pszStringBuff is String ? StrPtr(pszStringBuff) : pszStringBuff

    result := DllCall("UxTheme.dll\GetThemeSysString", HTHEME, _hTheme, "int", iStringId, "ptr", pszStringBuff, "int", cchMaxStringChars, "HRESULT")
    return result
}

/**
 * Retrieves the value of a system int.
 * @param {HTHEME} _hTheme Type: <b>HTHEME</b>
 * 
 * Handle to theme data.
 * @param {Integer} iIntId Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the desired system <b>int</b>. May be the following value.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="TMT_MINCOLORDEPTH"></a><a id="tmt_mincolordepth"></a><dl>
 * <dt><b>TMT_MINCOLORDEPTH</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The minimum color depth, in bits, required to properly view this style.
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {Integer} Type: <b>int*</b>
 * 
 * Pointer to an <b>int</b> that receives the system integer value.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-getthemesysint
 * @since windows6.0.6000
 */
export GetThemeSysInt(_hTheme, iIntId) {
    result := DllCall("UxTheme.dll\GetThemeSysInt", HTHEME, _hTheme, "int", iIntId, "int*", &piValue := 0, "HRESULT")
    return piValue
}

/**
 * Tests if a visual style for the current application is active.
 * @remarks
 * Do not call this function during <a href="https://docs.microsoft.com/windows/desktop/Dlls/dllmain">DllMain</a> or global objects constructors. This may cause invalid return values.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Returns one of the following values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>TRUE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A visual style is enabled, and windows with visual styles applied should call <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-openthemedata">OpenThemeData</a> to start using theme drawing services.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FALSE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A visual style is not enabled, and the window message handler does not need to make another call to <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-isthemeactive">IsThemeActive</a> until it receives a WM_THEMECHANGED message.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-isthemeactive
 * @since windows6.0.6000
 */
export IsThemeActive() {
    result := DllCall("UXTHEME.dll\IsThemeActive", BOOL)
    return result
}

/**
 * Reports whether the current application's user interface displays using visual styles.
 * @remarks
 * Prior to Windows 8, a visual style can be turned off in Control Panel, so that an application can support visual styles but not have a visual style applied at a given time.
 * 
 *  In Windows 8, it is not possible to turn off visual styles.
 * 
 * 
 * Do not call this function during <a href="https://docs.microsoft.com/windows/desktop/Dlls/dllmain">DllMain</a> or global objects constructors. This may cause invalid return values.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Returns one of the following values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>TRUE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The application has a visual style applied.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FALSE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The application does not have a visual style applied.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-isappthemed
 * @since windows6.0.6000
 */
export IsAppThemed() {
    result := DllCall("UXTHEME.dll\IsAppThemed", BOOL)
    return result
}

/**
 * Retrieves a theme handle to a window that has visual styles applied.
 * @remarks
 * If a window has a visual style applied, the <b>GetWindowTheme</b> function returns the most recent theme handle from <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-openthemedata">OpenThemeData</a>. If no visual style is applied, <b>GetWindowTheme</b> returns <b>NULL</b>.
 * @param {HWND} _hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * Handle of the window.
 * @returns {HTHEME} Type: <b>HTHEME</b>
 * 
 * The most recent theme handle from <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-openthemedata">OpenThemeData</a>.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-getwindowtheme
 * @since windows6.0.6000
 */
export GetWindowTheme(_hwnd) {
    result := DllCall("UXTHEME.dll\GetWindowTheme", HWND, _hwnd, HTHEME.Owned)
    return result
}

/**
 * Enables or disables the visual style of the background of a dialog window.
 * @remarks
 * <b>EnableThemeDialogTexture</b> can be used to tailor dialog box compatibility with child windows and controls that may or may not coordinate rendering their client area backgrounds with that of their parent dialog box.
 * @param {HWND} _hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * Window handle of the target dialog box.
 * @param {Integer} dwFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
 * 
 * One of the following option flag values:
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id=""></a><dl>
 * <dt><b></b></dt>
 * <dt>ETDT_DISABLE</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Disables background texturing.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id=""></a><dl>
 * <dt><b></b></dt>
 * <dt>ETDT_ENABLE</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Enables dialog window background texturing. The texturing is defined by a visual style.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id=""></a><dl>
 * <dt><b></b></dt>
 * <dt>ETDT_USETABTEXTURE</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Uses the Tab control texture for the background texture of a dialog window.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id=""></a><dl>
 * <dt><b></b></dt>
 * <dt>ETDT_USEAEROWIZARDTABTEXTURE</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Uses the Aero wizard texture for the background texture of a dialog window.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id=""></a><dl>
 * <dt><b></b></dt>
 * <dt>ETDT_ENABLETAB</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Enables dialog window background texturing. The texture is the Tab control texture defined by the visual style. This flag is equivalent to (ETDT_ENABLE | ETDT_USETABTEXTURE).
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id=""></a><dl>
 * <dt><b></b></dt>
 * <dt>ETDT_ENABLEAEROWIZARDTAB</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * ETDT_ENABLE | ETDT_USEAEROWIZARDTABTEXTURE.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id=""></a><dl>
 * <dt><b></b></dt>
 * <dt>ETDT_VALIDBITS</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * ETDT_DISABLE | ETDT_ENABLE | ETDT_USETABTEXTURE | ETDT_USEAEROWIZARDTABTEXTURE.
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-enablethemedialogtexture
 * @since windows6.0.6000
 */
export EnableThemeDialogTexture(_hwnd, dwFlags) {
    result := DllCall("UxTheme.dll\EnableThemeDialogTexture", HWND, _hwnd, "uint", dwFlags, "HRESULT")
    return result
}

/**
 * Reports whether a specified dialog window supports background texturing.
 * @param {HWND} _hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * <b>HWND</b> value that specifies a dialog window.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Returns one of the following values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>TRUE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Background texturing is supported on the dialog window specified by the <i>hwnd</i> parameter.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FALSE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Background texturing is not supported on the dialog window specified by the <i>hwnd</i> parameter.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-isthemedialogtextureenabled
 * @since windows6.0.6000
 */
export IsThemeDialogTextureEnabled(_hwnd) {
    result := DllCall("UxTheme.dll\IsThemeDialogTextureEnabled", HWND, _hwnd, BOOL)
    return result
}

/**
 * Retrieves the property flags that control how visual styles are applied in the current application.
 * @remarks
 * Individual flags can be extracted from the result by combining the result with the logical AND of the desired flag.
 * 
 * Do not call this function during <a href="https://docs.microsoft.com/windows/desktop/Dlls/dllmain">DllMain</a> or global objects constructors. This may cause invalid return values.
 * @returns {SET_THEME_APP_PROPERTIES_FLAGS} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
 * 
 * The following return values are bit flags combined with a logical OR operator.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STAP_ALLOW_NONCLIENT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Specifies that the nonclient areas of application windows have visual styles applied.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STAP_ALLOW_CONTROLS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Specifies that controls in application windows have visual styles applied.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STAP_ALLOW_WEBCONTENT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Specifies that all web content displayed in an application is rendered using visual styles.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-getthemeappproperties
 * @since windows6.0.6000
 */
export GetThemeAppProperties() {
    result := DllCall("UXTHEME.dll\GetThemeAppProperties", SET_THEME_APP_PROPERTIES_FLAGS)
    return result
}

/**
 * Sets the flags that determine how visual styles are implemented in the calling application.
 * @remarks
 * After you set the flags, send a <a href="https://docs.microsoft.com/windows/desktop/winmsg/wm-themechanged">WM_THEMECHANGED</a> message to your application's main window for the changes to take effect.
 * @param {SET_THEME_APP_PROPERTIES_FLAGS} dwFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
 * 
 * <b>DWORD</b> that specifies one or more of the following bit flags, which can be combined with a logical OR.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id=""></a><dl>
 * <dt><b></b></dt>
 * <dt>STAP_ALLOW_NONCLIENT</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Specifies that the nonclient areas of application windows will have visual styles applied.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id=""></a><dl>
 * <dt><b></b></dt>
 * <dt>STAP_ALLOW_CONTROLS</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Specifies that the common controls used in an application will have visual styles applied.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id=""></a><dl>
 * <dt><b></b></dt>
 * <dt>STAP_ALLOW_WEBCONTENT</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Specifies that web content displayed in an application will have visual styles applied.
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-setthemeappproperties
 * @since windows6.0.6000
 */
export SetThemeAppProperties(dwFlags) {
    DllCall("UxTheme.dll\SetThemeAppProperties", SET_THEME_APP_PROPERTIES_FLAGS, dwFlags)
}

/**
 * Retrieves the name of the current visual style, and optionally retrieves the color scheme name and size name.
 * @param {PWSTR} pszThemeFileName Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPWSTR</a></b>
 * 
 * Pointer to a string that receives the theme path and file name.
 * @param {Integer} cchMaxNameChars Type: <b>int</b>
 * 
 * Value of type <b>int</b> that contains the maximum number of characters allowed in the theme file name.
 * @param {PWSTR} pszColorBuff Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPWSTR</a></b>
 * 
 * Pointer to a string that receives the color scheme name. This parameter may be set to <b>NULL</b>.
 * @param {Integer} cchMaxColorChars Type: <b>int</b>
 * 
 * Value of type <b>int</b> that contains the maximum number of characters allowed in the color scheme name.
 * @param {PWSTR} pszSizeBuff Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPWSTR</a></b>
 * 
 * Pointer to a string that receives the size name. This parameter may be set to <b>NULL</b>.
 * @param {Integer} cchMaxSizeChars Type: <b>int</b>
 * 
 * Value of type <b>int</b> that contains the maximum number of characters allowed in the size name.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful, otherwise an error code.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-getcurrentthemename
 * @since windows6.0.6000
 */
export GetCurrentThemeName(pszThemeFileName, cchMaxNameChars, pszColorBuff, cchMaxColorChars, pszSizeBuff, cchMaxSizeChars) {
    pszThemeFileName := pszThemeFileName is String ? StrPtr(pszThemeFileName) : pszThemeFileName
    pszColorBuff := pszColorBuff is String ? StrPtr(pszColorBuff) : pszColorBuff
    pszSizeBuff := pszSizeBuff is String ? StrPtr(pszSizeBuff) : pszSizeBuff

    result := DllCall("UXTHEME.dll\GetCurrentThemeName", "ptr", pszThemeFileName, "int", cchMaxNameChars, "ptr", pszColorBuff, "int", cchMaxColorChars, "ptr", pszSizeBuff, "int", cchMaxSizeChars, "HRESULT")
    return result
}

/**
 * Retrieves the value for a theme property from the documentation section of the specified theme file.
 * @remarks
 * If the theme property has been localized in the theme files string table, this function returns the localized version.
 * @param {PWSTR} pszThemeName Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
 * 
 * Pointer to a string that contains the name of the theme file that will be opened to query for the property.
 * @param {PWSTR} pszPropertyName Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
 * @param {PWSTR} pszValueBuff Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPWSTR</a></b>
 * 
 * Pointer to a string buffer that receives the property string value.
 * @param {Integer} cchMaxValChars Type: <b>int</b>
 * 
 * Value of type <b>int</b> that specifies the maximum number of characters that <i>pszValueBuff</i> can contain.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-getthemedocumentationproperty
 * @since windows6.0.6000
 */
export GetThemeDocumentationProperty(pszThemeName, pszPropertyName, pszValueBuff, cchMaxValChars) {
    pszThemeName := pszThemeName is String ? StrPtr(pszThemeName) : pszThemeName
    pszPropertyName := pszPropertyName is String ? StrPtr(pszPropertyName) : pszPropertyName
    pszValueBuff := pszValueBuff is String ? StrPtr(pszValueBuff) : pszValueBuff

    result := DllCall("UxTheme.dll\GetThemeDocumentationProperty", "ptr", pszThemeName, "ptr", pszPropertyName, "ptr", pszValueBuff, "int", cchMaxValChars, "HRESULT")
    return result
}

/**
 * Draws the part of a parent control that is covered by a partially-transparent or alpha-blended child control.
 * @param {HWND} _hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * The child control.
 * @param {HDC} _hdc Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a></b>
 * 
 * The child control's DC.
 * @param {Pointer<RECT>} prc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
 * 
 * The area to be drawn. The rectangle is in the child window's coordinates. If this parameter is NULL, the area to be drawn includes the entire area occupied by the child control.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-drawthemeparentbackground
 * @since windows6.0.6000
 */
export DrawThemeParentBackground(_hwnd, _hdc, prc) {
    result := DllCall("UXTHEME.dll\DrawThemeParentBackground", HWND, _hwnd, HDC, _hdc, RECT.Ptr, prc, "HRESULT")
    return result
}

/**
 * Windows Vista through Windows 7:\_Enables or disables visual styles for the current user in the current and later sessions.Windows 8 and later:\_This function does nothing. Visual styles are always enabled in Windows 8 and later.
 * @param {BOOL} fEnable Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-enabletheming
 * @since windows6.0.6000
 */
export EnableTheming(fEnable) {
    result := DllCall("UxTheme.dll\EnableTheming", BOOL, fEnable, "HRESULT")
    return result
}

/**
 * Used by partially-transparent or alpha-blended child controls to draw the part of their parent in front of which they appear. Sends a WM_ERASEBKGND message followed by a WM_PRINTCLIENT.
 * @param {HWND} _hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * Handle of the child control.
 * @param {HDC} _hdc Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a></b>
 * 
 * HDC of the child control.
 * @param {DRAW_THEME_PARENT_BACKGROUND_FLAGS} dwFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
 * @param {Pointer<RECT>} prc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
 * 
 * Optional. The area to be drawn, in child coordinates. If this parameter is NULL, the area to be drawn includes the entire area occupied by the child control.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * S_OK if successful; otherwise, S_FALSE.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-drawthemeparentbackgroundex
 * @since windows6.0.6000
 */
export DrawThemeParentBackgroundEx(_hwnd, _hdc, dwFlags, prc) {
    result := DllCall("UxTheme.dll\DrawThemeParentBackgroundEx", HWND, _hwnd, HDC, _hdc, DRAW_THEME_PARENT_BACKGROUND_FLAGS, dwFlags, RECT.Ptr, prc, "HRESULT")
    return result
}

/**
 * Sets attributes to control how visual styles are applied to a specified window.
 * @param {HWND} _hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * Handle to a window to apply changes to.
 * @param {WINDOWTHEMEATTRIBUTETYPE} eAttribute 
 * @param {Integer} pvAttribute Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">PVOID</a></b>
 * 
 * A pointer that specifies attributes to set. Type is determined by the value of the <i>eAttribute</i> value.
 * @param {Integer} cbAttribute Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
 * 
 * Specifies the size, in bytes, of the data pointed to by <i>pvAttribute</i>.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-setwindowthemeattribute
 * @since windows6.0.6000
 */
export SetWindowThemeAttribute(_hwnd, eAttribute, pvAttribute, cbAttribute) {
    result := DllCall("UXTHEME.dll\SetWindowThemeAttribute", HWND, _hwnd, WINDOWTHEMEATTRIBUTETYPE, eAttribute, "ptr", pvAttribute, "uint", cbAttribute, "HRESULT")
    return result
}

/**
 * Draws text using the color and font defined by the visual style. Extends DrawThemeText by allowing additional text format options.
 * @remarks
 * The function always uses the themed font for the specified part and state if one is defined. Otherwise it uses the font currently selected into the device context. To find out if a themed font is defined, you can call <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-getthemefont">GetThemeFont</a> or <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-getthemepropertyorigin">GetThemePropertyOrigin</a> with TMT_FONT as the property identifier.
 * @param {HTHEME} _hTheme Type: <b>HTHEME</b>
 * 
 * Handle to a window's specified theme data. Use <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-openthemedata">OpenThemeData</a> to create an HTHEME.
 * @param {HDC} _hdc Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a></b>
 * 
 * HDC to use for drawing.
 * @param {Integer} iPartId Type: <b>int</b>
 * 
 * The control part that has the desired text appearance. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>. If this value is 0, the text is drawn in the default font, or a font selected into the device context.
 * @param {Integer} iStateId Type: <b>int</b>
 * 
 * The control state that has the desired text appearance. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {PWSTR} pszText Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
 * 
 * Pointer to a string that contains the text to draw.
 * @param {Integer} cchText Type: <b>int</b>
 * 
 * Value of type <b>int</b> that contains the number of characters to draw. If the parameter is set to -1, all the characters in the string are drawn.
 * @param {DRAW_TEXT_FORMAT} dwTextFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
 * 
 * <b>DWORD</b> that contains one or more values that specify the string's formatting. See <a href="https://docs.microsoft.com/windows/desktop/Controls/theme-format-values">Format Values</a> for possible parameter values.
 * @param {Pointer<RECT>} pRect Type: <b>LPRECT</b>
 * 
 * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains the rectangle, in logical coordinates, in which the text is to be drawn.
 * @param {Pointer<DTTOPTS>} pOptions Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/ns-uxtheme-dttopts">DTTOPTS</a>*</b>
 * 
 * A <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/ns-uxtheme-dttopts">DTTOPTS</a> structure that defines additional formatting options that will be applied to the text being drawn.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-drawthemetextex
 * @since windows6.0.6000
 */
export DrawThemeTextEx(_hTheme, _hdc, iPartId, iStateId, pszText, cchText, dwTextFlags, pRect, pOptions) {
    pszText := pszText is String ? StrPtr(pszText) : pszText

    result := DllCall("UXTHEME.dll\DrawThemeTextEx", HTHEME, _hTheme, HDC, _hdc, "int", iPartId, "int", iStateId, "ptr", pszText, "int", cchText, DRAW_TEXT_FORMAT, dwTextFlags, RECT.Ptr, pRect, DTTOPTS.Ptr, pOptions, "HRESULT")
    return result
}

/**
 * Retrieves the bitmap associated with a particular theme, part, state, and property.
 * @remarks
 * If <i>dwFlags</i> is set to <b>GBF_COPY</b>, release the bitmap stored in <i>phBitmap</i> when no longer needed by calling <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-deleteobject">DeleteObject</a>.
 * @param {HTHEME} _hTheme Type: <b>HTHEME</b>
 * 
 * A handle to theme data.
 * @param {Integer} iPartId Type: <b>int</b>
 * 
 * The part that contains the bitmap. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {Integer} iStateId Type: <b>int</b>
 * 
 * The state of the part.
 * @param {Integer} iPropId Type: <b>int</b>
 * 
 * The property to retrieve. Pass zero to automatically select the first available bitmap for this part and state,
 * @param {GET_THEME_BITMAP_FLAGS} dwFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">ULONG</a></b>
 * @returns {HBITMAP} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HBITMAP</a>*</b>
 * 
 * A pointer that receives a handle to the requested bitmap.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-getthemebitmap
 * @since windows6.0.6000
 */
export GetThemeBitmap(_hTheme, iPartId, iStateId, iPropId, dwFlags) {
    phBitmap := HBITMAP.Owned()
    result := DllCall("UXTHEME.dll\GetThemeBitmap", HTHEME, _hTheme, "int", iPartId, "int", iStateId, "int", iPropId, GET_THEME_BITMAP_FLAGS, dwFlags, HBITMAP.Ptr, phBitmap, "HRESULT")
    return phBitmap
}

/**
 * Retrieves a data stream corresponding to a specified theme, starting from a specified part, state, and property.
 * @remarks
 * <b>Windows 8:</b> In high contrast mode, the data stream retrieved by this function is not valid after the <i>hTheme</i> theme handle is closed.
 * 
 * 
 * The data stream retrieved by this function is not a copy; do not delete or close the data stream after using it.
 * @param {HTHEME} _hTheme Type: <b>HTHEME</b>
 * 
 * Handle to the theme from which the stream will be retrieved.
 * @param {Integer} iPartId Type: <b>int</b>
 * 
 * Specifies the part to retrieve a stream from. See <a href="https://docs.microsoft.com/windows/desktop/Controls/parts-and-states">Parts and States</a>.
 * @param {Integer} iStateId Type: <b>int</b>
 * 
 * Specifies the state of the part.
 * @param {Integer} iPropId Type: <b>int</b>
 * 
 * Specifies the property to retrieve.
 * @param {Pointer<Pointer<Void>>} ppvStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">VOID</a>**</b>
 * 
 * Address of a pointer that receives the stream.
 * @param {Pointer<Integer>} pcbStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a>*</b>
 * 
 * Pointer that receives the length, in bytes, of the stream received by <i>ppvStream</i>.
 * @param {HINSTANCE} hInst Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HINSTANCE</a></b>
 * 
 * If <i>iPropId</i> is TMT_STREAM, this value is <b>NULL</b>. If <i>iPropId</i> is TMT_DISKSTREAM, this value is the HINSTANCE of a loaded styles file.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-getthemestream
 * @since windows6.0.6000
 */
export GetThemeStream(_hTheme, iPartId, iStateId, iPropId, ppvStream, pcbStream, hInst) {
    ppvStreamMarshal := ppvStream is VarRef ? "ptr*" : "ptr"
    pcbStreamMarshal := pcbStream is VarRef ? "uint*" : "ptr"

    result := DllCall("UXTHEME.dll\GetThemeStream", HTHEME, _hTheme, "int", iPartId, "int", iStateId, "int", iPropId, ppvStreamMarshal, ppvStream, pcbStreamMarshal, pcbStream, HINSTANCE, hInst, "HRESULT")
    return result
}

/**
 * Initialize buffered painting for the current thread.
 * @remarks
 * <b>BufferedPaintInit</b> is called before <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-beginbufferedpaint">BeginBufferedPaint</a> or <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-beginbufferedanimation">BeginBufferedAnimation</a> for each thread that uses these functions.
 * 
 * Each call to <b>BufferedPaintInit</b> should be matched with a call to <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-bufferedpaintuninit">BufferedPaintUnInit</a> when calls to buffered paint APIs are no longer needed. 
 * 			An application may call this API multiple times, as long as each call to <b>BufferedPaintInit</b> is balanced with a call to <b>BufferedPaintUnInit</b>.
 * 
 * 
 * This function only needs to be called once in the lifetime of a thread. Typically, this function is called before creating the main application window, or during <a href="https://docs.microsoft.com/windows/desktop/winmsg/wm-create">WM_CREATE</a>. Call <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-bufferedpaintuninit">BufferedPaintUnInit</a> after destroying the window, or during <a href="https://docs.microsoft.com/windows/desktop/winmsg/wm-ncdestroy">WM_NCDESTROY</a>.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-bufferedpaintinit
 * @since windows6.0.6000
 */
export BufferedPaintInit() {
    result := DllCall("UXTHEME.dll\BufferedPaintInit", "HRESULT")
    return result
}

/**
 * Closes down buffered painting for the current thread. Called once for each call to BufferedPaintInit after calls to BeginBufferedPaint are no longer needed.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-bufferedpaintuninit
 * @since windows6.0.6000
 */
export BufferedPaintUnInit() {
    result := DllCall("UXTHEME.dll\BufferedPaintUnInit", "HRESULT")
    return result
}

/**
 * Begins a buffered paint operation.
 * @param {HDC} hdcTarget Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a></b>
 * 
 * The handle of the target DC on which the buffer will be painted.
 * @param {Pointer<RECT>} prcTarget Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
 * 
 * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that specifies the area of the target DC in which to paint.
 * @param {BP_BUFFERFORMAT} dwFormat Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/ne-uxtheme-bp_bufferformat">BP_BUFFERFORMAT</a></b>
 * 
 * A member of the <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/ne-uxtheme-bp_bufferformat">BP_BUFFERFORMAT</a> enumeration that specifies the format of the buffer.
 * @param {Pointer<BP_PAINTPARAMS>} pPaintParams Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/ns-uxtheme-bp_paintparams">BP_PAINTPARAMS</a>*</b>
 * 
 * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/ns-uxtheme-bp_paintparams">BP_PAINTPARAMS</a> structure that defines the paint operation parameters. This value can be <b>NULL</b>.
 * @param {Pointer<HDC>} phdc Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a>*</b>
 * 
 * When this function returns, points to the handle of the new device context.
 * @returns {Pointer} Type: <b>HPAINTBUFFER</b>
 * 
 * A handle to the buffered paint context. If this function fails, the return value is <b>NULL</b>, and <i>phdc</i> is <b>NULL</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * 
 * The returned handle is freed when <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-endbufferedpaint">EndBufferedPaint</a> is called.
 * 
 * An application should call <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-bufferedpaintinit">BufferedPaintInit</a> on the calling thread before calling <b>BeginBufferedPaint</b>, and <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-bufferedpaintuninit">BufferedPaintUnInit</a> before the thread is terminated.  Failure to call <b>BufferedPaintInit</b> may result in degraded performance due to internal data being initialized and destroyed for each buffered paint operation.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-beginbufferedpaint
 * @since windows6.0.6000
 */
export BeginBufferedPaint(hdcTarget, prcTarget, dwFormat, pPaintParams, phdc) {
    A_LastError := 0

    result := DllCall("UXTHEME.dll\BeginBufferedPaint", HDC, hdcTarget, RECT.Ptr, prcTarget, BP_BUFFERFORMAT, dwFormat, BP_PAINTPARAMS.Ptr, pPaintParams, HDC.Ptr, phdc, IntPtr)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Completes a buffered paint operation and frees the associated buffered paint handle.
 * @param {Pointer} hBufferedPaint Type: <b>HPAINTBUFFER</b>
 * 
 * The handle of the buffered paint context, obtained through <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-beginbufferedpaint">BeginBufferedPaint</a>.
 * @param {BOOL} fUpdateTarget Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * <b>TRUE</b> to copy the buffer to the target DC.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-endbufferedpaint
 * @since windows6.0.6000
 */
export EndBufferedPaint(hBufferedPaint, fUpdateTarget) {
    result := DllCall("UXTHEME.dll\EndBufferedPaint", "ptr", hBufferedPaint, BOOL, fUpdateTarget, "HRESULT")
    return result
}

/**
 * Retrieves the target rectangle specified by BeginBufferedPaint.
 * @remarks
 * If this function fails, the <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure at <i>prc</i> is set to empty.
 * @param {Pointer} hBufferedPaint Type: <b>HPAINTBUFFER</b>
 * 
 * Handle to the buffered paint context obtained through <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-beginbufferedpaint">BeginBufferedPaint</a>.
 * @param {Pointer<RECT>} prc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
 * 
 * When this function returns, contains the requested rectangle.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-getbufferedpainttargetrect
 * @since windows6.0.6000
 */
export GetBufferedPaintTargetRect(hBufferedPaint, prc) {
    result := DllCall("UxTheme.dll\GetBufferedPaintTargetRect", "ptr", hBufferedPaint, RECT.Ptr, prc, "HRESULT")
    return result
}

/**
 * Retrieves the target device context (DC).
 * @remarks
 * If successful, this function returns the target DC that was passed by the application to <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-beginbufferedpaint">BeginBufferedPaint</a>.
 * @param {Pointer} hBufferedPaint Type: <b>HPAINTBUFFER</b>
 * 
 * A handle to the buffered paint context obtained through <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-beginbufferedpaint">BeginBufferedPaint</a>.
 * @returns {HDC} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a></b>
 * 
 * A handle to the requested DC, or <b>NULL</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-getbufferedpainttargetdc
 * @since windows6.0.6000
 */
export GetBufferedPaintTargetDC(hBufferedPaint) {
    result := DllCall("UxTheme.dll\GetBufferedPaintTargetDC", "ptr", hBufferedPaint, HDC)
    return result
}

/**
 * Gets the paint device context (DC). This is the same value retrieved by BeginBufferedPaint.
 * @param {Pointer} hBufferedPaint Type: <b>HPAINTBUFFER</b>
 * 
 * Handle of the buffered paint context, obtained through <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-beginbufferedpaint">BeginBufferedPaint</a>.
 * @returns {HDC} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a></b>
 * 
 * Handle of the requested DC. This is the same DC that is returned by <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-beginbufferedpaint">BeginBufferedPaint</a>. Returns <b>NULL</b> upon failure.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-getbufferedpaintdc
 * @since windows6.0.6000
 */
export GetBufferedPaintDC(hBufferedPaint) {
    result := DllCall("UxTheme.dll\GetBufferedPaintDC", "ptr", hBufferedPaint, HDC)
    return result
}

/**
 * Retrieves a pointer to the buffer bitmap if the buffer is a device-independent bitmap (DIB).
 * @remarks
 * The number of bits per pixel depends on the pixel format passed to <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-beginbufferedpaint">BeginBufferedPaint</a>.
 * @param {Pointer} hBufferedPaint Type: <b>HPAINTBUFFER</b>
 * 
 * The handle of the buffered paint context, obtained through <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-beginbufferedpaint">BeginBufferedPaint</a>.
 * @param {Pointer<Pointer<RGBQUAD>>} ppbBuffer Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-rgbquad">RGBQUAD</a>**</b>
 * 
 * When this function returns, contains a pointer to the address of the buffer bitmap pixels.
 * @param {Pointer<Integer>} pcxRow Type: <b>int*</b>
 * 
 * When this function returns, contains a pointer to the width, in pixels, of the buffer bitmap. This value is not necessarily equal to the buffer width. It may be larger.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * Returns S_OK if successful, or an error value otherwise. If an error occurs, <i>ppbBuffer</i>  is set to <b>NULL</b> and <i>pcxRow</i> is set to zero.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-getbufferedpaintbits
 * @since windows6.0.6000
 */
export GetBufferedPaintBits(hBufferedPaint, ppbBuffer, pcxRow) {
    ppbBufferMarshal := ppbBuffer is VarRef ? "ptr*" : "ptr"
    pcxRowMarshal := pcxRow is VarRef ? "int*" : "ptr"

    result := DllCall("UXTHEME.dll\GetBufferedPaintBits", "ptr", hBufferedPaint, ppbBufferMarshal, ppbBuffer, pcxRowMarshal, pcxRow, "HRESULT")
    return result
}

/**
 * Clears a specified rectangle in the buffer to ARGB = {0,0,0,0}.
 * @remarks
 * This function accesses the buffer bits directly and is therefore faster than calling a GDI function to erase the buffer.
 * @param {Pointer} hBufferedPaint Type: <b>HPAINTBUFFER</b>
 * 
 * The handle of the buffered paint context, obtained through <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-beginbufferedpaint">BeginBufferedPaint</a>.
 * @param {Pointer<RECT>} prc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
 * 
 * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that specifies the rectangle to clear. Set this parameter to <b>NULL</b> to specify the entire buffer.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-bufferedpaintclear
 * @since windows6.0.6000
 */
export BufferedPaintClear(hBufferedPaint, prc) {
    result := DllCall("UXTHEME.dll\BufferedPaintClear", "ptr", hBufferedPaint, RECT.Ptr, prc, "HRESULT")
    return result
}

/**
 * Sets the alpha to a specified value in a given rectangle. The alpha controls the amount of transparency applied when blending with the buffer onto the destination target device context (DC).
 * @remarks
 * This function sets the alpha value for each pixel in the target rectangle. Passing an alpha value of 255 makes pixels fully opaque. The <b>BufferedPaintMakeOpaque</b> macro, which is  defined in uxtheme.h, sets alpha values to 255.  It is typically used to call GDI to draw into a memory buffer and then to make it opaque in order to draw it on glass.
 * @param {Pointer} hBufferedPaint Type: <b>HPAINTBUFFER</b>
 * 
 * The handle of the buffered paint context, obtained through <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-beginbufferedpaint">BeginBufferedPaint</a>.
 * @param {Pointer<RECT>} prc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
 * 
 * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that specifies the rectangle in which to set the alpha. Set this parameter to <b>NULL</b> to specify the entire buffer.
 * @param {Integer} alpha Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
 * 
 * The alpha value to set. The alpha value can range from zero (fully transparent) to 255 (fully opaque).
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-bufferedpaintsetalpha
 * @since windows6.0.6000
 */
export BufferedPaintSetAlpha(hBufferedPaint, prc, alpha) {
    result := DllCall("UxTheme.dll\BufferedPaintSetAlpha", "ptr", hBufferedPaint, RECT.Ptr, prc, "char", alpha, "HRESULT")
    return result
}

/**
 * Stops all buffered animations for the given window.
 * @param {HWND} _hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * The handle of the window in which to stop all animations.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-bufferedpaintstopallanimations
 * @since windows6.0.6000
 */
export BufferedPaintStopAllAnimations(_hwnd) {
    result := DllCall("UXTHEME.dll\BufferedPaintStopAllAnimations", HWND, _hwnd, "HRESULT")
    return result
}

/**
 * Begins a buffered animation operation. The animation consists of a cross-fade between the contents of two buffers over a specified period of time.
 * @remarks
 * <b>BeginBufferedAnimation</b> will take care of drawing the intermediate frames between those two states by generating multiple <a href="https://docs.microsoft.com/windows/desktop/gdi/wm-paint">WM_PAINT</a> messages.
 * 		
 * 
 * <b>BeginBufferedAnimation</b> starts a timer that generates <a href="https://docs.microsoft.com/windows/desktop/gdi/wm-paint">WM_PAINT</a> messages on which <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-bufferedpaintrenderanimation">BufferedPaintRenderAnimation</a> should be called.  During these messages, <b>BufferedPaintRenderAnimation</b> will return <b>TRUE</b> when it paints an intermediate frame, to signify that the application has no further painting to do.
 * 
 * If the animation duration is zero, then only <i>phdcTo</i> is returned and <i>phdcFrom</i>  is set to <b>NULL</b>.  In this case, the application should paint the final state using <i>phdcTo</i> to get the behavior similar to <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-beginbufferedpaint">BeginBufferedPaint</a>.
 * @param {HWND} _hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * A handle to the window in which the animations play.
 * @param {HDC} hdcTarget Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a></b>
 * 
 * A handle of the target DC on which the buffer is animated.
 * @param {Pointer<RECT>} prcTarget Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
 * 
 * A pointer to a structure that specifies the area of the target DC in which to draw.
 * @param {BP_BUFFERFORMAT} dwFormat Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/ne-uxtheme-bp_bufferformat">BP_BUFFERFORMAT</a></b>
 * 
 * The format of the buffer.
 * @param {Pointer<BP_PAINTPARAMS>} pPaintParams Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/ns-uxtheme-bp_paintparams">BP_PAINTPARAMS</a>*</b>
 * 
 * A pointer to a structure that defines the paint operation parameters. This value can be <b>NULL</b>.
 * @param {Pointer<BP_ANIMATIONPARAMS>} pAnimationParams Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/ns-uxtheme-bp_animationparams">BP_ANIMATIONPARAMS</a>*</b>
 * 
 * A pointer to a structure that defines the animation operation parameters.
 * @param {Pointer<HDC>} phdcFrom Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a>*</b>
 * 
 * When this function returns, this value points to the handle of the DC where the application should paint the initial state of the animation, if not <b>NULL</b>.
 * @param {Pointer<HDC>} phdcTo Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a>*</b>
 * 
 * When this function returns, this value points to the handle of the DC where the application should paint the final state of the animation, if not <b>NULL</b>.
 * @returns {Pointer} Type: <b>HANIMATIONBUFFER</b>
 * 
 * A handle to the buffered paint animation.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-beginbufferedanimation
 * @since windows6.0.6000
 */
export BeginBufferedAnimation(_hwnd, hdcTarget, prcTarget, dwFormat, pPaintParams, pAnimationParams, phdcFrom, phdcTo) {
    result := DllCall("UxTheme.dll\BeginBufferedAnimation", HWND, _hwnd, HDC, hdcTarget, RECT.Ptr, prcTarget, BP_BUFFERFORMAT, dwFormat, BP_PAINTPARAMS.Ptr, pPaintParams, BP_ANIMATIONPARAMS.Ptr, pAnimationParams, HDC.Ptr, phdcFrom, HDC.Ptr, phdcTo, IntPtr)
    return result
}

/**
 * Renders the first frame of a buffered animation operation and starts the animation timer.
 * @param {Pointer} hbpAnimation Type: <b>HANIMATIONBUFFER</b>
 * 
 * The handle to the buffered animation context that was returned by <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-beginbufferedanimation">BeginBufferedAnimation</a>.
 * @param {BOOL} fUpdateTarget Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * If <b>TRUE</b>, updates the target DC with the animation.  If <b>FALSE</b>, the animation is not started, the target DC is not updated, and the <i>hbpAnimation</i> parameter is freed.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
 * 
 * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-endbufferedanimation
 * @since windows6.0.6000
 */
export EndBufferedAnimation(hbpAnimation, fUpdateTarget) {
    result := DllCall("UxTheme.dll\EndBufferedAnimation", "ptr", hbpAnimation, BOOL, fUpdateTarget, "HRESULT")
    return result
}

/**
 * Paints the next frame of a buffered paint animation.
 * @remarks
 * If this function returns <b>TRUE</b>, the application should do no further painting. If this function returns <b>FALSE</b>, the application should paint normally.
 * 
 * An application calls this function within its <a href="https://docs.microsoft.com/windows/desktop/gdi/wm-paint">WM_PAINT</a> handler.  After <b>BufferedPaintRenderAnimation</b> paints an animation frame, an application will typically continue without performing its usual painting operations.  If appropriate, an application may choose to render additional user interface (UI) over the top of the animation. The following code example, to be included as part of a larger body of code, shows how to use the animation painting functions.
 * 
 * 
 * ```cpp
 *     if (!_fBufferedPaintInit)
 *     {
 *         BufferedPaintInit();
 *         _fBufferedPaintInit = TRUE;
 *     }
 * 
 *     // Determine whether the paint message was generated by a softfade animation.
 *     if (!BufferedPaintRenderAnimation(hWnd, hdc))
 *     {
 *         // Initialize buffered paint parameters.
 *         BP_ANIMATIONPARAMS animParams = {sizeof(BP_ANIMATIONPARAMS)};
 *         animParams.style = BPAS_LINEAR; 
 *         animParams.dwDuration = 0;
 *         GetThemeTransitionDuration(hTheme, iPartId, iStateIdFrom, 
 *                 iStateIdTo, TMT_TRANSITIONDURATIONS, &animParams.dwDuration);
 * 
 *         HDC hdcFrom, hdcTo;
 *         HANIMATIONBUFFER hbpAnimation = BeginBufferedAnimation(hWnd, hdc, &rc, 
 *                 BPBF_COMPATIBLEBITMAP, NULL, &animParams, &hdcFrom, &hdcTo);
 *         if (hbpAnimation)
 *         {
 *             if (hdcFrom)
 *             {
 *                 PaintImpl(hdcFrom, iPartId, iStateIdFrom //, ...);
 *             }
 *             if (hdcTo)
 *             {
 *                 PaintImpl(hdcTo, iPartId, iStateIdTo//, ...);
 *             }
 * 
 *             EndBufferedAnimation(hbpAnimation, TRUE);
 *         }
 *         else
 *         {
 *             // Default to unbuffered paint
 *             PaintImpl(hdc, iPartId, iStateIdTo//, ...);
 *        
 *         }
 *     }
 *     // Else do not paint because the BufferedPaintRenderAnimation function 
 *     // already did.
 * }
 * 
 * ```
 * @param {HWND} _hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * Handle to the window in which the animations play.
 * @param {HDC} hdcTarget Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a></b>
 * 
 * Handle of the target DC on which the buffer is animated.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Returns <b>TRUE</b> if the frame has been painted, or <b>FALSE</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-bufferedpaintrenderanimation
 * @since windows6.0.6000
 */
export BufferedPaintRenderAnimation(_hwnd, hdcTarget) {
    result := DllCall("UxTheme.dll\BufferedPaintRenderAnimation", HWND, _hwnd, HDC, hdcTarget, BOOL)
    return result
}

/**
 * Determines whether Desktop Window Manager (DWM) composition effects are available to the theme.
 * @remarks
 * Composition effects are provided through the DWM. This function first determines whether DWM is active, then checks whether it has composition effects enabled.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * <b>TRUE</b> if composition effects are available; otherwise, <b>FALSE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-iscompositionactive
 * @since windows6.0.6000
 */
export IsCompositionActive() {
    result := DllCall("UXTHEME.dll\IsCompositionActive", BOOL)
    return result
}

/**
 * Gets the duration for the specified transition.
 * @param {HTHEME} _hTheme Type: <b>HTHEME</b>
 * 
 * Handle of the theme data.
 * @param {Integer} iPartId Type: <b>int</b>
 * 
 * ID of the part.
 * @param {Integer} iStateIdFrom Type: <b>int</b>
 * 
 * State ID of the part before the transition.
 * @param {Integer} iStateIdTo Type: <b>int</b>
 * 
 * State ID of the part after the transition.
 * @param {Integer} iPropId Type: <b>int</b>
 * 
 * Property ID.
 * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a>*</b>
 * 
 * Address of a variable that receives the transition duration, in milliseconds.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/nf-uxtheme-getthemetransitionduration
 * @since windows6.0.6000
 */
export GetThemeTransitionDuration(_hTheme, iPartId, iStateIdFrom, iStateIdTo, iPropId) {
    result := DllCall("UxTheme.dll\GetThemeTransitionDuration", HTHEME, _hTheme, "int", iPartId, "int", iStateIdFrom, "int", iStateIdTo, "int", iPropId, "uint*", &pdwDuration := 0, "HRESULT")
    return pdwDuration
}

/**
 * Changes the check state of a button control.
 * @remarks
 * The <b>CheckDlgButton</b> function sends a 
 * 				<a href="https://docs.microsoft.com/windows/desktop/Controls/bm-setcheck">BM_SETCHECK</a> message to the specified button control in the specified dialog box.
 * @param {HWND} hDlg Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * A handle to the dialog box that contains the button.
 * @param {Integer} nIDButton Type: <b>int</b>
 * 
 * The identifier of the button to modify.
 * @param {DLG_BUTTON_CHECK_STATE} uCheck Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * If the function succeeds, the return value is nonzero.
 * 
 * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-checkdlgbutton
 * @since windows6.0.6000
 */
export CheckDlgButton(hDlg, nIDButton, uCheck) {
    A_LastError := 0

    result := DllCall("USER32.dll\CheckDlgButton", HWND, hDlg, "int", nIDButton, DLG_BUTTON_CHECK_STATE, uCheck, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Adds a check mark to (checks) a specified radio button in a group and removes a check mark from (clears) all other radio buttons in the group.
 * @remarks
 * The <b>CheckRadioButton</b> function sends a <a href="https://docs.microsoft.com/windows/desktop/Controls/bm-setcheck">BM_SETCHECK</a> message to each of the radio buttons in the indicated group.
 * 
 * The <i>nIDFirstButton</i> and <i>nIDLastButton</i> parameters specify a range of button identifiers (normally the resource IDs of the buttons).  The position of buttons in the tab order is irrelevant; if a button forms part of a group, but has an ID outside the specified range, it is not affected by this call.
 * @param {HWND} hDlg Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * A handle to the dialog box that contains the radio button.
 * @param {Integer} nIDFirstButton Type: <b>int</b>
 * 
 * The identifier of the first radio button in the group.
 * @param {Integer} nIDLastButton Type: <b>int</b>
 * 
 * The identifier of the last radio button in the group.
 * @param {Integer} nIDCheckButton Type: <b>int</b>
 * 
 * The identifier of the radio button to select.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * If the function succeeds, the return value is nonzero.
 * 
 * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-checkradiobutton
 * @since windows6.0.6000
 */
export CheckRadioButton(hDlg, nIDFirstButton, nIDLastButton, nIDCheckButton) {
    A_LastError := 0

    result := DllCall("USER32.dll\CheckRadioButton", HWND, hDlg, "int", nIDFirstButton, "int", nIDLastButton, "int", nIDCheckButton, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The IsDlgButtonChecked function determines whether a button control is checked or whether a three-state button control is checked, unchecked, or indeterminate.
 * @remarks
 * The <b>IsDlgButtonChecked</b> function sends a <a href="https://docs.microsoft.com/windows/desktop/Controls/bm-getcheck">BM_GETCHECK</a> message to the specified button control.
 * @param {HWND} hDlg Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * A handle to the dialog box that contains the button control.
 * @param {Integer} nIDButton Type: <b>int</b>
 * 
 * The identifier of the button control.
 * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * The return value from a button created with the <a href="https://docs.microsoft.com/windows/desktop/Controls/button-styles">BS_AUTOCHECKBOX</a>, <a href="https://docs.microsoft.com/windows/desktop/Controls/button-styles">BS_AUTORADIOBUTTON</a>, <a href="https://docs.microsoft.com/windows/desktop/Controls/button-styles">BS_AUTO3STATE</a>, <a href="https://docs.microsoft.com/windows/desktop/Controls/button-styles">BS_CHECKBOX</a>, <a href="https://docs.microsoft.com/windows/desktop/Controls/button-styles">BS_RADIOBUTTON</a>, or <a href="https://docs.microsoft.com/windows/desktop/Controls/button-styles">BS_3STATE</a> styles can be one of the values in the following table. If the button has any other style, the return value is zero. 
 * 				
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>BST_CHECKED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The button is checked.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>BST_INDETERMINATE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The button is in an indeterminate state (applies only if the button has the <a href="https://docs.microsoft.com/windows/desktop/Controls/button-styles">BS_3STATE</a> or <a href="https://docs.microsoft.com/windows/desktop/Controls/button-styles">BS_AUTO3STATE</a> style).
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>BST_UNCHECKED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The button is not checked.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-isdlgbuttonchecked
 * @since windows6.0.6000
 */
export IsDlgButtonChecked(hDlg, nIDButton) {
    result := DllCall("USER32.dll\IsDlgButtonChecked", HWND, hDlg, "int", nIDButton, UInt32)
    return result
}

/**
 * Configures the pointer injection device for the calling application, and initializes the maximum number of simultaneous pointers that the app can inject.
 * @param {POINTER_INPUT_TYPE} pointerType The pointer injection device type. Must be either <a href="https://docs.microsoft.com/windows/win32/api/winuser/ne-winuser-tagpointer_input_type">PT_TOUCH</a> or <b>PT_PEN</b>.
 * @param {Integer} maxCount The maximum number of contacts. 
 * 
 * 
 * For <a href="https://docs.microsoft.com/windows/win32/api/winuser/ne-winuser-tagpointer_input_type">PT_TOUCH</a> this value must be greater than 0 and less than or equal to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_touchinjection/constants">MAX_TOUCH_COUNT</a>. 
 * 
 * For <a href="https://docs.microsoft.com/windows/win32/api/winuser/ne-winuser-tagpointer_input_type">PT_PEN</a> this value must be 1.
 * @param {POINTER_FEEDBACK_MODE} _mode The contact visualization mode.
 * @returns {HSYNTHETICPOINTERDEVICE} If the function succeeds, the return value is a handle to the pointer injection device. Otherwise, it returns null. To retrieve extended error information, call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-createsyntheticpointerdevice
 * @since windows10.0.17763
 */
export CreateSyntheticPointerDevice(pointerType, maxCount, _mode) {
    A_LastError := 0

    result := DllCall("USER32.dll\CreateSyntheticPointerDevice", POINTER_INPUT_TYPE, pointerType, "uint", maxCount, POINTER_FEEDBACK_MODE, _mode, HSYNTHETICPOINTERDEVICE.Owned)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Registers a window to process the WM_TOUCHHITTESTING notification.
 * @param {HWND} _hwnd The window that receives the <a href="https://docs.microsoft.com/windows/win32/inputmsg/wm-touchhittesting">WM_TOUCHHITTESTING</a>  notification.
 * @param {Integer} value 
 * @returns {BOOL} If this function succeeds, it returns TRUE.
 *  
 * Otherwise, it returns FALSE. To retrieve extended error information, call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-registertouchhittestingwindow
 * @since windows8.0
 */
export RegisterTouchHitTestingWindow(_hwnd, value) {
    A_LastError := 0

    result := DllCall("USER32.dll\RegisterTouchHitTestingWindow", HWND, _hwnd, "uint", value, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Returns the score of a rectangle as the probable touch target, compared to all other rectangles that intersect the touch contact area, and an adjusted touch point within the rectangle.
 * @remarks
 * For consistency with Windows, frameworks that handle <a href="https://docs.microsoft.com/windows/win32/inputmsg/wm-touchhittesting">WM_TOUCHHITTESTING</a> should use the following principles for targeting:
 * 
 * <ul>
 * <li>Inclusion: If the touch point is within the boundaries of a control, the touch point is not changed. 
 * </li>
 * <li>Intersection: Include only controls that intersect the contact geometry. 
 * </li>
 * <li>Z-order: If more than one control intersects the contact geometry, and the controls overlap, the control that's highest in the z-order receives priority. 
 * </li>
 * <li>Ambiguity: If more than one control intersects the contact geometry, and the controls don't overlap, the control that's closest to the original touch point receives priority. </li>
 * </ul>
 * @param {Pointer<RECT>} controlBoundingBox The <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that defines the bounding box of the UI element.
 * @param {Pointer<TOUCH_HIT_TESTING_INPUT>} pHitTestingInput The <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-touch_hit_testing_input">TOUCH_HIT_TESTING_INPUT</a> structure that holds the data for the touch contact area.
 * @param {Pointer<TOUCH_HIT_TESTING_PROXIMITY_EVALUATION>} pProximityEval The <a href="https://docs.microsoft.com/windows/win32/api/winuser/ns-winuser-touch_hit_testing_proximity_evaluation">TOUCH_HIT_TESTING_PROXIMITY_EVALUATION</a> structure that holds the score and adjusted touch-point data.
 * @returns {BOOL} If this function succeeds, it returns TRUE.
 *  
 * Otherwise, it returns FALSE. To retrieve extended error information, call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-evaluateproximitytorect
 * @since windows8.0
 */
export EvaluateProximityToRect(controlBoundingBox, pHitTestingInput, pProximityEval) {
    A_LastError := 0

    result := DllCall("USER32.dll\EvaluateProximityToRect", RECT.Ptr, controlBoundingBox, TOUCH_HIT_TESTING_INPUT.Ptr, pHitTestingInput, TOUCH_HIT_TESTING_PROXIMITY_EVALUATION.Ptr, pProximityEval, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Returns the score of a polygon as the probable touch target (compared to all other polygons that intersect the touch contact area) and an adjusted touch point within the polygon.
 * @remarks
 * For consistency with Windows, frameworks that handle <a href="https://docs.microsoft.com/windows/win32/inputmsg/wm-touchhittesting">WM_TOUCHHITTESTING</a> should use the following principles for targeting:
 * 
 * <ul>
 * <li>Inclusion: If the touch point is within the boundaries of a control, the touch point is not changed. 
 * </li>
 * <li>Intersection: Include only controls that intersect the contact geometry. 
 * </li>
 * <li>Z-order: If more than one control intersects the contact geometry, and the controls overlap, the control that's highest in the z-order receives priority. 
 * </li>
 * <li>Ambiguity: If more than one control intersects the contact geometry, and the controls don't overlap, the control that's closest to the original touch point receives priority. </li>
 * </ul>
 * @param {Integer} numVertices The number of vertices in the polygon. This value must be greater than or equal to 3.
 * 
 * This value indicates the size of the array, as specified by the <i>controlPolygon</i> parameter.
 * @param {Pointer<POINT>} controlPolygon The array of x-y screen coordinates that define the shape of the UI element. 
 * 
 * The <i>numVertices</i> parameter specifies the number of coordinates.
 * @param {Pointer<TOUCH_HIT_TESTING_INPUT>} pHitTestingInput The <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-touch_hit_testing_input">TOUCH_HIT_TESTING_INPUT</a> structure that holds the data for the touch contact area.
 * @param {Pointer<TOUCH_HIT_TESTING_PROXIMITY_EVALUATION>} pProximityEval The <a href="https://docs.microsoft.com/windows/win32/api/winuser/ns-winuser-touch_hit_testing_proximity_evaluation">TOUCH_HIT_TESTING_PROXIMITY_EVALUATION</a> structure that holds the score and adjusted touch-point data.
 * @returns {BOOL} If this function succeeds, it returns TRUE.
 *  
 * Otherwise, it returns FALSE. To retrieve extended error information, call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-evaluateproximitytopolygon
 * @since windows8.0
 */
export EvaluateProximityToPolygon(numVertices, controlPolygon, pHitTestingInput, pProximityEval) {
    A_LastError := 0

    result := DllCall("USER32.dll\EvaluateProximityToPolygon", "uint", numVertices, POINT.Ptr, controlPolygon, TOUCH_HIT_TESTING_INPUT.Ptr, pHitTestingInput, TOUCH_HIT_TESTING_PROXIMITY_EVALUATION.Ptr, pProximityEval, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Returns the proximity evaluation score and the adjusted touch-point coordinates as a packed value for the WM_TOUCHHITTESTING callback.
 * @remarks
 * Usually, this is the last function that's called in a <a href="https://docs.microsoft.com/windows/win32/inputmsg/wm-touchhittesting">WM_TOUCHHITTESTING</a>  handler.
 * @param {Pointer<TOUCH_HIT_TESTING_INPUT>} pHitTestingInput The <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-touch_hit_testing_input">TOUCH_HIT_TESTING_INPUT</a> structure that holds the data for the touch contact area.
 * @param {Pointer<TOUCH_HIT_TESTING_PROXIMITY_EVALUATION>} pProximityEval The <a href="https://docs.microsoft.com/windows/win32/api/winuser/ns-winuser-touch_hit_testing_proximity_evaluation">TOUCH_HIT_TESTING_PROXIMITY_EVALUATION</a> structure that holds the score and adjusted touch-point data that the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-evaluateproximitytopolygon">EvaluateProximityToPolygon</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-evaluateproximitytorect">EvaluateProximityToRect</a> function returns.
 * @returns {LRESULT} If this function succeeds, it returns the <b>score</b> and <b>adjustedPoint</b> values from <a href="https://docs.microsoft.com/windows/win32/api/winuser/ns-winuser-touch_hit_testing_proximity_evaluation">TOUCH_HIT_TESTING_PROXIMITY_EVALUATION</a> as an LRESULT. To retrieve extended error information, call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-packtouchhittestingproximityevaluation
 * @since windows8.0
 */
export PackTouchHitTestingProximityEvaluation(pHitTestingInput, pProximityEval) {
    A_LastError := 0

    result := DllCall("USER32.dll\PackTouchHitTestingProximityEvaluation", TOUCH_HIT_TESTING_INPUT.Ptr, pHitTestingInput, TOUCH_HIT_TESTING_PROXIMITY_EVALUATION.Ptr, pProximityEval, LRESULT)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves the feedback configuration for a window.
 * @param {HWND} _hwnd The window to check for feedback configuration.
 * @param {FEEDBACK_TYPE} feedback One of the values from the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ne-winuser-feedback_type">FEEDBACK_TYPE</a> enumeration.
 * @param {Integer} dwFlags Specify <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_feedback/constants">GWFS_INCLUDE_ANCESTORS</a> to check the parent window chain until a value is found. The default is 0 and indicates that only the specified window will be checked.
 * @param {Pointer<Integer>} pSize The size of memory region that the <i>config</i> parameter points to. 
 * 
 * The <i>pSize</i> parameter specifies the size of the configuration data for the feedback type in <i>feedback</i> and must be sizeof(BOOL).
 * @param {Integer} config The configuration data.
 * 
 * The <i>config</i> parameter must point to a value of type BOOL.
 * @returns {BOOL} Returns TRUE if the specified feedback setting is configured on the specified window. Otherwise, it returns FALSE (and <i>config</i> won't be modified).
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getwindowfeedbacksetting
 * @since windows8.0
 */
export GetWindowFeedbackSetting(_hwnd, feedback, dwFlags, pSize, config) {
    pSizeMarshal := pSize is VarRef ? "uint*" : "ptr"

    result := DllCall("USER32.dll\GetWindowFeedbackSetting", HWND, _hwnd, FEEDBACK_TYPE, feedback, "uint", dwFlags, pSizeMarshal, pSize, "ptr", config, BOOL)
    return result
}

/**
 * Sets the feedback configuration for a window.
 * @param {HWND} _hwnd The window to configure feedback on.
 * @param {FEEDBACK_TYPE} feedback One of the values from the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ne-winuser-feedback_type">FEEDBACK_TYPE</a> enumeration.
 * @param {Integer} dwFlags Reserved. Must be 0.
 * @param {Integer} _size The size, in bytes, of the configuration data. Must be sizeof(BOOL) or 0 if the feedback setting is being reset.
 * @param {Integer} configuration The configuration data. Must be BOOL or NULL if the feedback setting is being reset.
 * @returns {BOOL} Returns TRUE if successful; otherwise, returns FALSE.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-setwindowfeedbacksetting
 * @since windows8.0
 */
export SetWindowFeedbackSetting(_hwnd, feedback, dwFlags, _size, configuration) {
    result := DllCall("USER32.dll\SetWindowFeedbackSetting", HWND, _hwnd, FEEDBACK_TYPE, feedback, "uint", dwFlags, "uint", _size, "ptr", configuration, BOOL)
    return result
}

/**
 * The SetScrollPos function sets the position of the scroll box (thumb) in the specified scroll bar and, if requested, redraws the scroll bar to reflect the new position of the scroll box.
 * @remarks
 * If the scroll bar is redrawn by a subsequent call to another function, setting the <i>bRedraw</i> parameter to <b>FALSE</b> is useful. 
 * 
 * Because the messages that indicate scroll bar position, <a href="https://docs.microsoft.com/windows/desktop/Controls/wm-hscroll">WM_HSCROLL</a> and <a href="https://docs.microsoft.com/windows/desktop/Controls/wm-vscroll">WM_VSCROLL</a>, are limited to 16 bits of position data, applications that rely solely on those messages for position data have a practical maximum value of 65,535 for the <b>SetScrollPos</b> function's <i>nPos</i> parameter. 
 * 
 * However, because the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setscrollinfo">SetScrollInfo</a>, <b>SetScrollPos</b>, <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setscrollrange">SetScrollRange</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getscrollinfo">GetScrollInfo</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getscrollpos">GetScrollPos</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getscrollrange">GetScrollRange</a> functions support 32-bit scroll bar position data, there is a way to circumvent the 16-bit barrier of the <a href="https://docs.microsoft.com/windows/desktop/Controls/wm-hscroll">WM_HSCROLL</a> and <a href="https://docs.microsoft.com/windows/desktop/Controls/wm-vscroll">WM_VSCROLL</a> messages. See <b>GetScrollInfo</b> for a description of the technique. 
 * 
 * If the <i>nBar</i> parameter is SB_CTL and the window specified by the <i>hWnd</i> parameter is not a system scroll bar control, the system sends the <a href="https://docs.microsoft.com/windows/desktop/Controls/sbm-setpos">SBM_SETPOS</a> message to the window to set scroll bar information.  This allows <b>SetScrollPos</b> to operate on a custom control that mimics a scroll bar.  If the window does not handle the <b>SBM_SETPOS</b> message, the <b>SetScrollPos</b> function fails.
 * @param {HWND} _hWnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * Handle to a scroll bar control or a window with a standard scroll bar, depending on the value of the <i>nBar</i> parameter.
 * @param {SCROLLBAR_CONSTANTS} nBar Type: <b>int</b>
 * @param {Integer} nPos Type: <b>int</b>
 * 
 * Specifies the new position of the scroll box. The position must be within the scrolling range. For more information about the scrolling range, see the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setscrollrange">SetScrollRange</a> function.
 * @param {BOOL} bRedraw Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Specifies whether the scroll bar is redrawn to reflect the new scroll box position. If this parameter is <b>TRUE</b>, the scroll bar is redrawn. If it is <b>FALSE</b>, the scroll bar is not redrawn.
 * @returns {Integer} Type: <b>int</b>
 * 
 * If the function succeeds, the return value is the previous position of the scroll box.
 *                     
 *                     
 * 
 * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-setscrollpos
 * @since windows6.0.6000
 */
export SetScrollPos(_hWnd, nBar, nPos, bRedraw) {
    A_LastError := 0

    result := DllCall("USER32.dll\SetScrollPos", HWND, _hWnd, SCROLLBAR_CONSTANTS, nBar, "int", nPos, BOOL, bRedraw, Int32)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The SetScrollRange function sets the minimum and maximum scroll box positions for the specified scroll bar.
 * @remarks
 * You can use <b>SetScrollRange</b> to hide the scroll bar by setting 
 * 				<i>nMinPos</i> and 
 * 				<i>nMaxPos</i> to the same value. An application should not call the <b>SetScrollRange</b> function to hide a scroll bar while processing a scroll bar message. New applications should use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-showscrollbar">ShowScrollBar</a> function to hide the scroll bar. 
 * 
 * If the call to <b>SetScrollRange</b> immediately follows a call to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setscrollpos">SetScrollPos</a> function, the 
 * 				<i>bRedraw</i> parameter in <b>SetScrollPos</b> must be zero to prevent the scroll bar from being drawn twice. 
 * 
 * The default range for a standard scroll bar is 0 through 100. The default range for a scroll bar control is empty (both the 
 * 				<i>nMinPos</i> and 
 * 				<i>nMaxPos</i> parameter values are zero). The difference between the values specified by the 
 * 				<i>nMinPos</i> and 
 * 				<i>nMaxPos</i> parameters must not be greater than the value of MAXLONG. 
 * 
 * Because the messages that indicate scroll bar position, 
 * 				<a href="https://docs.microsoft.com/windows/desktop/Controls/wm-hscroll">WM_HSCROLL</a> and 
 * 				<a href="https://docs.microsoft.com/windows/desktop/Controls/wm-vscroll">WM_VSCROLL</a>, are limited to 16 bits of position data, applications that rely solely on those messages for position data have a practical maximum value of 65,535 for the <b>SetScrollRange</b> function's 
 * 				<i>nMaxPos</i> parameter. 
 * 
 * However, because the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setscrollinfo">SetScrollInfo</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setscrollpos">SetScrollPos</a>, <b>SetScrollRange</b>, <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getscrollinfo">GetScrollInfo</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getscrollpos">GetScrollPos</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getscrollrange">GetScrollRange</a> functions support 32-bit scroll bar position data, there is a way to circumvent the 16-bit barrier of the 
 * 				<a href="https://docs.microsoft.com/windows/desktop/Controls/wm-hscroll">WM_HSCROLL</a> and 
 * 				<a href="https://docs.microsoft.com/windows/desktop/Controls/wm-vscroll">WM_VSCROLL</a> messages. See <b>GetScrollInfo</b> for a description of the technique. 
 * 
 * If the <i>nBar</i> parameter is SB_CTL and the window specified by the <i>hWnd</i> parameter is not a system scroll bar control, the system sends the <a href="https://docs.microsoft.com/windows/desktop/Controls/sbm-setrange">SBM_SETRANGE</a> message to the window to set scroll bar information.  This allows <b>SetScrollRange</b> to operate on a custom control that mimics a scroll bar.  If the window does not handle the <b>SBM_SETRANGE</b> message, the <b>SetScrollRange</b> function fails.
 * @param {HWND} _hWnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * Handle to a scroll bar control or a window with a standard scroll bar, depending on the value of the 
 * 					<i>nBar</i> parameter.
 * @param {SCROLLBAR_CONSTANTS} nBar Type: <b>int</b>
 * @param {Integer} nMinPos Type: <b>int</b>
 * 
 * Specifies the minimum scrolling position.
 * @param {Integer} nMaxPos Type: <b>int</b>
 * 
 * Specifies the maximum scrolling position.
 * @param {BOOL} bRedraw Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Specifies whether the scroll bar should be redrawn to reflect the change. If this parameter is <b>TRUE</b>, the scroll bar is redrawn. If it is <b>FALSE</b>, the scroll bar is not redrawn.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * If the function succeeds, the return value is nonzero.
 * 
 * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-setscrollrange
 * @since windows6.0.6000
 */
export SetScrollRange(_hWnd, nBar, nMinPos, nMaxPos, bRedraw) {
    A_LastError := 0

    result := DllCall("USER32.dll\SetScrollRange", HWND, _hWnd, SCROLLBAR_CONSTANTS, nBar, "int", nMinPos, "int", nMaxPos, BOOL, bRedraw, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The ShowScrollBar function shows or hides the specified scroll bar.
 * @remarks
 * You should not call this function to hide a scroll bar while processing a scroll bar message.
 * @param {HWND} _hWnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * Handle to a scroll bar control or a window with a standard scroll bar, depending on the value of the 
 * 					<i>wBar</i> parameter.
 * @param {SCROLLBAR_CONSTANTS} wBar Type: <b>int</b>
 * @param {BOOL} bShow Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Specifies whether the scroll bar is shown or hidden. If this parameter is <b>TRUE</b>, the scroll bar is shown; otherwise, it is hidden.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * If the function succeeds, the return value is nonzero.
 * 
 * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-showscrollbar
 * @since windows6.0.6000
 */
export ShowScrollBar(_hWnd, wBar, bShow) {
    A_LastError := 0

    result := DllCall("USER32.dll\ShowScrollBar", HWND, _hWnd, SCROLLBAR_CONSTANTS, wBar, BOOL, bShow, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The EnableScrollBar function enables or disables one or both scroll bar arrows.
 * @param {HWND} _hWnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * Handle to a window or a scroll bar control, depending on the value of the 
 * 					<i>wSBflags</i> parameter.
 * @param {Integer} wSBflags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * @param {ENABLE_SCROLL_BAR_ARROWS} wArrows Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * If the arrows are enabled or disabled as specified, the return value is nonzero.
 * 
 * If the arrows are already in the requested state or an error occurs, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-enablescrollbar
 * @since windows6.0.6000
 */
export EnableScrollBar(_hWnd, wSBflags, wArrows) {
    A_LastError := 0

    result := DllCall("USER32.dll\EnableScrollBar", HWND, _hWnd, "uint", wSBflags, ENABLE_SCROLL_BAR_ARROWS, wArrows, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Replaces the contents of a list box with the names of the subdirectories and files in a specified directory. You can filter the list of names by specifying a set of file attributes. The list can optionally include mapped drives. (ANSI)
 * @remarks
 * If 
 * 				<i>lpPathSpec</i> specifies a directory, <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-dlgdirlistcomboboxa">DlgDirListComboBox</a> changes the current directory to the specified directory before filling the list box. The text of the static control identified by the 
 * 				<i>nIDStaticPath</i> parameter is set to the name of the new current directory. 
 * 
 * <b>DlgDirList</b> sends the 
 * 				<a href="https://docs.microsoft.com/windows/desktop/Controls/lb-resetcontent">LB_RESETCONTENT</a> and 
 * 				<a href="https://docs.microsoft.com/windows/desktop/Controls/lb-dir">LB_DIR</a> messages to the list box. 
 * 
 * If 
 * 				<i>uFileType</i> includes the DDL_DIRECTORY flag and 
 * 				<i>lpPathSpec</i> specifies a first-level directory, such as C:\TEMP, the list box will always include a ".." entry for the root directory. This is true even if the root directory has hidden or system attributes and the DDL_HIDDEN and DDL_SYSTEM flags are not specified. The root directory of an NTFS volume has hidden and system attributes. 
 * 
 * The directory listing displays long filenames, if any.
 * @param {HWND} hDlg Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * A handle to the dialog box that contains the list box.
 * @param {PSTR} lpPathSpec Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPTSTR</a></b>
 * 
 * A pointer to a buffer containing a null-terminated string that specifies an absolute path, relative path, or filename. An absolute path can begin with a drive letter (for example, d:\) or a UNC name (for example, \\\<i>machinename</i>\\<i>sharename</i>). 
 * 
 * The function splits the string into a directory and a filename. The function searches the directory for names that match the filename. If the string does not specify a directory, the function searches the current directory. 
 * 
 * If the string includes a filename, the filename must contain at least one wildcard character (? or \*). If the string does not include a filename, the function behaves as if you had specified the asterisk wildcard character (\*) as the filename. All names in the specified directory that match the filename and have the attributes specified by the <i>uFileType</i> parameter are added to the list box.
 * @param {Integer} nIDListBox Type: <b>int</b>
 * 
 * The identifier of a list box in the <i>hDlg</i> dialog box. If this parameter is zero, <b>DlgDirList</b> does not try to fill a list box.
 * @param {Integer} nIDStaticPath Type: <b>int</b>
 * 
 * The identifier of a static control in the <i>hDlg</i> dialog box. <b>DlgDirList</b> sets the text of this control to display the current drive and directory. This parameter can be zero if you do not want to display the current drive and directory.
 * @param {DLG_DIR_LIST_FILE_TYPE} uFileType Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * @returns {Integer} Type: <b>int</b>
 * 
 * If the function succeeds, the return value is nonzero.
 * 
 * If the function fails, the return value is zero. For example, if the string specified by 
 * 						<i>lpPathSpec</i> is not a valid path, the function fails. To get extended error information, call .
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-dlgdirlista
 * @since windows6.0.6000
 */
export DlgDirListA(hDlg, lpPathSpec, nIDListBox, nIDStaticPath, uFileType) {
    lpPathSpec := lpPathSpec is String ? StrPtr(lpPathSpec) : lpPathSpec

    result := DllCall("USER32.dll\DlgDirListA", HWND, hDlg, "ptr", lpPathSpec, "int", nIDListBox, "int", nIDStaticPath, DLG_DIR_LIST_FILE_TYPE, uFileType, Int32)
    return result
}

/**
 * Replaces the contents of a list box with the names of the subdirectories and files in a specified directory. You can filter the list of names by specifying a set of file attributes. The list can optionally include mapped drives. (Unicode)
 * @remarks
 * If 
 * 				<i>lpPathSpec</i> specifies a directory, <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-dlgdirlistcomboboxa">DlgDirListComboBox</a> changes the current directory to the specified directory before filling the list box. The text of the static control identified by the 
 * 				<i>nIDStaticPath</i> parameter is set to the name of the new current directory. 
 * 
 * <b>DlgDirList</b> sends the 
 * 				<a href="https://docs.microsoft.com/windows/desktop/Controls/lb-resetcontent">LB_RESETCONTENT</a> and 
 * 				<a href="https://docs.microsoft.com/windows/desktop/Controls/lb-dir">LB_DIR</a> messages to the list box. 
 * 
 * If 
 * 				<i>uFileType</i> includes the DDL_DIRECTORY flag and 
 * 				<i>lpPathSpec</i> specifies a first-level directory, such as C:\TEMP, the list box will always include a ".." entry for the root directory. This is true even if the root directory has hidden or system attributes and the DDL_HIDDEN and DDL_SYSTEM flags are not specified. The root directory of an NTFS volume has hidden and system attributes. 
 * 
 * The directory listing displays long filenames, if any.
 * @param {HWND} hDlg Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * A handle to the dialog box that contains the list box.
 * @param {PWSTR} lpPathSpec Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPTSTR</a></b>
 * 
 * A pointer to a buffer containing a null-terminated string that specifies an absolute path, relative path, or filename. An absolute path can begin with a drive letter (for example, d:\) or a UNC name (for example, \\
 * 					<i>machinename</i>\
 * 					<i>sharename</i>). 
 * 
 * The function splits the string into a directory and a filename. The function searches the directory for names that match the filename. If the string does not specify a directory, the function searches the current directory. 
 * 
 * If the string includes a filename, the filename must contain at least one wildcard character (? or *). If the string does not include a filename, the function behaves as if you had specified the asterisk wildcard character (*) as the filename. All names in the specified directory that match the filename and have the attributes specified by the 
 * 						<i>uFileType</i> parameter are added to the list box.
 * @param {Integer} nIDListBox Type: <b>int</b>
 * 
 * The identifier of a list box in the 
 * 					<i>hDlg</i> dialog box. If this parameter is zero, <b>DlgDirList</b> does not try to fill a list box.
 * @param {Integer} nIDStaticPath Type: <b>int</b>
 * 
 * The identifier of a static control in the 
 * 					<i>hDlg</i> dialog box. <b>DlgDirList</b> sets the text of this control to display the current drive and directory. This parameter can be zero if you do not want to display the current drive and directory.
 * @param {DLG_DIR_LIST_FILE_TYPE} uFileType Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * @returns {Integer} Type: <b>int</b>
 * 
 * If the function succeeds, the return value is nonzero.
 * 
 * If the function fails, the return value is zero. For example, if the string specified by 
 * 						<i>lpPathSpec</i> is not a valid path, the function fails. To get extended error information, call .
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-dlgdirlistw
 * @since windows6.0.6000
 */
export DlgDirListW(hDlg, lpPathSpec, nIDListBox, nIDStaticPath, uFileType) {
    lpPathSpec := lpPathSpec is String ? StrPtr(lpPathSpec) : lpPathSpec

    result := DllCall("USER32.dll\DlgDirListW", HWND, hDlg, "ptr", lpPathSpec, "int", nIDListBox, "int", nIDStaticPath, DLG_DIR_LIST_FILE_TYPE, uFileType, Int32)
    return result
}

/**
 * Retrieves the current selection from a single-selection list box. It assumes that the list box has been filled by the DlgDirList function and that the selection is a drive letter, filename, or directory name. (ANSI)
 * @remarks
 * The <b>DlgDirSelectEx</b> function copies the selection to the buffer pointed to by the 
 *                 <i>lpString</i> parameter. If the current selection is a directory name or drive letter, <b>DlgDirSelectEx</b> removes the enclosing square brackets (and hyphens, for drive letters), so that the name or letter is ready to be inserted into a new path. If there is no selection, 
 *                 <i>lpString</i> does not change.
 * 
 * If the string is as long or longer than the buffer, the buffer will contain the truncated string with a terminating null character.
 * 
 * <b>DlgDirSelectEx</b> sends <a href="https://docs.microsoft.com/windows/desktop/Controls/lb-getcursel">LB_GETCURSEL</a> and <a href="https://docs.microsoft.com/windows/desktop/Controls/lb-gettext">LB_GETTEXT</a> messages to the list box. The function does not allow more than one filename to be returned from a list box. The list box must not be a multiple-selection list box. If it is, this function does not return a zero value and 
 *                 <i>lpString</i> remains unchanged. 
 * 
 * <b>Windows 95 or later</b>: <b>DlgDirSelectExW</b> is supported by the Microsoft Layer for Unicode. To use this, you must add certain files to your application, as outlined in <a href="https://docs.microsoft.com/archive/msdn-magazine/2001/october/mslu-develop-unicode-applications-for-windows-9x-platforms-with-the-microsoft-layer-for-unicode">Microsoft Layer for Unicode on Windows Me/98/95 Systems</a>.
 * @param {HWND} hwndDlg Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * A handle to the dialog box that contains the list box.
 * @param {PSTR} lpString Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPTSTR</a></b>
 * 
 * A pointer to a buffer that receives the selected path.
 * @param {Integer} chCount Type: <b>int</b>
 * 
 * The length, in 
 *                     <b>TCHARs</b>, of the buffer pointed to by 
 *                     <i>lpString</i>.
 * @param {Integer} idListBox Type: <b>int</b>
 * 
 * The identifier of a list box in the dialog box.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * If the current selection is a directory name, the return value is nonzero.
 * 
 * If the current selection is not a directory name, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-dlgdirselectexa
 * @since windows6.0.6000
 */
export DlgDirSelectExA(hwndDlg, lpString, chCount, idListBox) {
    lpString := lpString is String ? StrPtr(lpString) : lpString

    A_LastError := 0

    result := DllCall("USER32.dll\DlgDirSelectExA", HWND, hwndDlg, "ptr", lpString, "int", chCount, "int", idListBox, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves the current selection from a single-selection list box. It assumes that the list box has been filled by the DlgDirList function and that the selection is a drive letter, filename, or directory name. (Unicode)
 * @remarks
 * The <b>DlgDirSelectEx</b> function copies the selection to the buffer pointed to by the 
 *                 <i>lpString</i> parameter. If the current selection is a directory name or drive letter, <b>DlgDirSelectEx</b> removes the enclosing square brackets (and hyphens, for drive letters), so that the name or letter is ready to be inserted into a new path. If there is no selection, 
 *                 <i>lpString</i> does not change. 
 * If the string is as long or longer than the buffer, the buffer will contain the truncated string with a terminating null character.
 * 
 * <b>DlgDirSelectEx</b> sends <a href="https://docs.microsoft.com/windows/desktop/Controls/lb-getcursel">LB_GETCURSEL</a> and <a href="https://docs.microsoft.com/windows/desktop/Controls/lb-gettext">LB_GETTEXT</a> messages to the list box. The function does not allow more than one filename to be returned from a list box. The list box must not be a multiple-selection list box. If it is, this function does not return a zero value and 
 *                 <i>lpString</i> remains unchanged. 
 * 
 * <b>Windows 95 or later</b>: <b>DlgDirSelectExW</b> is supported by the Microsoft Layer for Unicode. To use this, you must add certain files to your application, as outlined in <a href="https://docs.microsoft.com/archive/msdn-magazine/2001/october/mslu-develop-unicode-applications-for-windows-9x-platforms-with-the-microsoft-layer-for-unicode">Microsoft Layer for Unicode on Windows Me/98/95 Systems</a>.
 * @param {HWND} hwndDlg Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * A handle to the dialog box that contains the list box.
 * @param {PWSTR} lpString Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPTSTR</a></b>
 * 
 * A pointer to a buffer that receives the selected path.
 * @param {Integer} chCount Type: <b>int</b>
 * 
 * The length, in 
 *                     <b>TCHARs</b>, of the buffer pointed to by 
 *                     <i>lpString</i>.
 * @param {Integer} idListBox Type: <b>int</b>
 * 
 * The identifier of a list box in the dialog box.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * If the current selection is a directory name, the return value is nonzero.
 * 
 * If the current selection is not a directory name, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-dlgdirselectexw
 * @since windows6.0.6000
 */
export DlgDirSelectExW(hwndDlg, lpString, chCount, idListBox) {
    lpString := lpString is String ? StrPtr(lpString) : lpString

    A_LastError := 0

    result := DllCall("USER32.dll\DlgDirSelectExW", HWND, hwndDlg, "ptr", lpString, "int", chCount, "int", idListBox, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Replaces the contents of a combo box with the names of the subdirectories and files in a specified directory. You can filter the list of names by specifying a set of file attributes. The list of names can include mapped drive letters. (ANSI)
 * @remarks
 * If <i>lpPathSpec</i> specifies a directory, <b>DlgDirListComboBox</b> changes the current directory to the specified directory before filling the combo box. The text of the static control identified by the  <i>nIDStaticPath</i> parameter is set to the name of the new current directory.
 * 
 * 
 * <b>DlgDirListComboBox</b> sends the <a href="https://docs.microsoft.com/windows/desktop/Controls/cb-resetcontent">CB_RESETCONTENT</a> and <a href="https://docs.microsoft.com/windows/desktop/Controls/cb-dir">CB_DIR</a> messages to the combo box. 
 * 
 * Microsoft Windows NT 4.0 and later: If <i>uFiletype</i> includes the DDL_DIRECTORY flag and <i>lpPathSpec</i> specifies a first-level directory, such as C:\TEMP, the combo box will always include a ".." entry for the root directory. This is true even if the root directory has hidden or system attributes and the DDL_HIDDEN and DDL_SYSTEM flags are not specified. The root directory of an NTFS volume has hidden and system attributes. 
 * 
 * <b>Security Warning:  </b>Using this function incorrectly might compromise the security of your program. Incorrect use of this function includes having <i>lpPathSpec</i> indicate a non-writable buffer, or a buffer without a null-termination. You should review the <a href="https://docs.microsoft.com/windows/desktop/Controls/sec-comctls">Security Considerations: Microsoft Windows Controls</a> before continuing.
 * 
 * Microsoft Windows NT 4.0 and later: The list displays long file names, if any.
 * 
 * Windows 95 or later: The list displays short file names (the 8.3 form). You can use the <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-shgetfileinfoa">SHGetFileInfo</a> or <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-getfullpathnamea">GetFullPathName</a> functions to get the corresponding long file name.
 * 
 * Windows 95 or later: <b>DlgDirListComboBoxW</b> is supported by the Microsoft Layer for Unicode. To use this, you must add certain files to your application, as outlined in <a href="https://docs.microsoft.com/archive/msdn-magazine/2001/october/mslu-develop-unicode-applications-for-windows-9x-platforms-with-the-microsoft-layer-for-unicode">Microsoft Layer for Unicode on Windows Me/98/95 Systems</a>.
 * 
 * 
 * 
 * > [!NOTE]
 * > The winuser.h header defines DlgDirListComboBox as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HWND} hDlg Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * A handle to the dialog box that contains the combo box.
 * @param {PSTR} lpPathSpec Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPTSTR</a></b>
 * 
 * A pointer to a buffer containing a null-terminated string that specifies an absolute path, relative path, or file name. An absolute path can begin with a drive letter (for example, d:\) or a UNC name (for example, &#92;&#92;<i>machinename</i>&#92;<i>sharename</i>). 
 *         
 *                     
 * 
 * The function splits the string into a directory and a file name. The function searches the directory for names that match the file name. If the string does not specify a directory, the function searches the current directory. 
 * 
 * If the string includes a file name, the file name must contain at least one wildcard character (? or *). If the string does not include a file name, the function behaves as if you had specified the asterisk wildcard character (*) as the file name. All names in the specified directory that match the file name and have the attributes specified by the <i>uFiletype</i> parameter are added to the list displayed in the combo box.
 * @param {Integer} nIDComboBox Type: <b>int</b>
 * 
 * The identifier of a combo box in the <i>hDlg</i> dialog box. If this parameter is zero, <b>DlgDirListComboBox</b> does not try to fill a combo box.
 * @param {Integer} nIDStaticPath Type: <b>int</b>
 * 
 * The identifier of a static control in the <i>hDlg</i> dialog box. <b>DlgDirListComboBox</b> sets the text of this control to display the current drive and directory. This parameter can be zero if you do not want to display the current drive and directory.
 * @param {DLG_DIR_LIST_FILE_TYPE} uFiletype Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * @returns {Integer} Type: <b>int</b>
 * 
 * If the function succeeds, the return value is nonzero.
 *                     
 *                     
 * 
 * If the function fails, the return value is zero. For example, if the string specified by <i>lpPathSpec</i> is not a valid path, the function fails. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-dlgdirlistcomboboxa
 * @since windows6.0.6000
 */
export DlgDirListComboBoxA(hDlg, lpPathSpec, nIDComboBox, nIDStaticPath, uFiletype) {
    lpPathSpec := lpPathSpec is String ? StrPtr(lpPathSpec) : lpPathSpec

    A_LastError := 0

    result := DllCall("USER32.dll\DlgDirListComboBoxA", HWND, hDlg, "ptr", lpPathSpec, "int", nIDComboBox, "int", nIDStaticPath, DLG_DIR_LIST_FILE_TYPE, uFiletype, Int32)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Replaces the contents of a combo box with the names of the subdirectories and files in a specified directory. You can filter the list of names by specifying a set of file attributes. The list of names can include mapped drive letters. (Unicode)
 * @remarks
 * If <i>lpPathSpec</i> specifies a directory, <b>DlgDirListComboBox</b> changes the current directory to the specified directory before filling the combo box. The text of the static control identified by the <i>nIDStaticPath</i> parameter is set to the name of the new current directory. 
 * 
 * 
 * <b>DlgDirListComboBox</b> sends the <a href="https://docs.microsoft.com/windows/desktop/Controls/cb-resetcontent">CB_RESETCONTENT</a> and <a href="https://docs.microsoft.com/windows/desktop/Controls/cb-dir">CB_DIR</a> messages to the combo box. 
 * 
 * Microsoft Windows NT 4.0 and later: If <i>uFiletype</i> includes the DDL_DIRECTORY flag and <i>lpPathSpec</i> specifies a first-level directory, such as C:\TEMP, the combo box will always include a ".." entry for the root directory. This is true even if the root directory has hidden or system attributes and the DDL_HIDDEN and DDL_SYSTEM flags are not specified. The root directory of an NTFS volume has hidden and system attributes. 
 * 
 * <b>Security Warning:  </b>Using this function incorrectly might compromise the security of your program. Incorrect use of this function includes having <i>lpPathSpec</i> indicate a non-writable buffer, or a buffer without a null-termination. You should review the <a href="https://docs.microsoft.com/windows/desktop/Controls/sec-comctls">Security Considerations: Microsoft Windows Controls</a> before continuing.
 * 
 * Microsoft Windows NT 4.0 and later: The list displays long file names, if any.
 * 
 * Windows 95 or later: The list displays short file names (the 8.3 form). You can use the <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-shgetfileinfoa">SHGetFileInfo</a> or <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-getfullpathnamea">GetFullPathName</a> functions to get the corresponding long file name.
 * 
 * 
 * Windows 95 or later: <b>DlgDirListComboBoxW</b> is supported by the Microsoft Layer for Unicode. To use this, you must add certain files to your application, as outlined in <a href="https://docs.microsoft.com/archive/msdn-magazine/2001/october/mslu-develop-unicode-applications-for-windows-9x-platforms-with-the-microsoft-layer-for-unicode">Microsoft Layer for Unicode on Windows Me/98/95 Systems</a>.
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winuser.h header defines DlgDirListComboBox as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HWND} hDlg Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * A handle to the dialog box that contains the combo box.
 * @param {PWSTR} lpPathSpec Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPTSTR</a></b>
 * 
 * A pointer to a buffer containing a null-terminated string that specifies an absolute path, relative path, or file name. An absolute path can begin with a drive letter (for example, d:\) or a UNC name (for example, &#92;&#92;<i>machinename</i>&#92;<i>sharename</i>). 
 *         
 *                     
 * 
 * The function splits the string into a directory and a file name. The function searches the directory for names that match the file name. If the string does not specify a directory, the function searches the current directory. 
 * 
 * If the string includes a file name, the file name must contain at least one wildcard character (? or *). If the string does not include a file name, the function behaves as if you had specified the asterisk wildcard character (*) as the file name. All names in the specified directory that match the file name and have the attributes specified by the <i>uFiletype</i> parameter are added to the list displayed in the combo box.
 * @param {Integer} nIDComboBox Type: <b>int</b>
 * 
 * The identifier of a combo box in the <i>hDlg</i> dialog box. If this parameter is zero, <b>DlgDirListComboBox</b> does not try to fill a combo box.
 * @param {Integer} nIDStaticPath Type: <b>int</b>
 * 
 * The identifier of a static control in the <i>hDlg</i> dialog box. <b>DlgDirListComboBox</b> sets the text of this control to display the current drive and directory. This parameter can be zero if you do not want to display the current drive and directory.
 * @param {DLG_DIR_LIST_FILE_TYPE} uFiletype Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * @returns {Integer} Type: <b>int</b>
 * 
 * If the function succeeds, the return value is nonzero.
 *                     
 *                     
 * 
 * If the function fails, the return value is zero. For example, if the string specified by <i>lpPathSpec</i> is not a valid path, the function fails. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-dlgdirlistcomboboxw
 * @since windows6.0.6000
 */
export DlgDirListComboBoxW(hDlg, lpPathSpec, nIDComboBox, nIDStaticPath, uFiletype) {
    lpPathSpec := lpPathSpec is String ? StrPtr(lpPathSpec) : lpPathSpec

    A_LastError := 0

    result := DllCall("USER32.dll\DlgDirListComboBoxW", HWND, hDlg, "ptr", lpPathSpec, "int", nIDComboBox, "int", nIDStaticPath, DLG_DIR_LIST_FILE_TYPE, uFiletype, Int32)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves the current selection from a combo box filled by using the DlgDirListComboBox function. The selection is interpreted as a drive letter, a file, or a directory name. (ANSI)
 * @remarks
 * If the current selection specifies a directory name or drive letter, the <b>DlgDirSelectComboBoxEx</b> function removes the enclosing square brackets (and hyphens for drive letters) so the name or letter is ready to be inserted into a new path or file name. If there is no selection, the contents of the buffer pointed to by <i>lpString</i> do not change.
 * 
 * The <b>DlgDirSelectComboBoxEx</b> function does not allow more than one file name to be returned from a combo box. 
 * 
 * If the string is as long or longer than the buffer, the buffer contains the truncated string with a terminating null character.
 * 
 * <b>DlgDirSelectComboBoxEx</b> sends <a href="https://docs.microsoft.com/windows/desktop/Controls/cb-getcursel">CB_GETCURSEL</a> and <a href="https://docs.microsoft.com/windows/desktop/Controls/cb-getlbtext">CB_GETLBTEXT</a> messages to the combo box. 
 * 
 * You can use this function with all three types of combo boxes (<a href="https://docs.microsoft.com/windows/desktop/Controls/combo-box-styles">CBS_SIMPLE</a>, <a href="https://docs.microsoft.com/windows/desktop/Controls/combo-box-styles">CBS_DROPDOWN</a>, and CBS_DROPDOWNLIST). 
 * 
 * <b>Security Warning:  </b>Improper use of this function can cause problems for your application. For instance, the <i>nCount</i> parameter should be set properly for both ANSI and Unicode versions. Failure to do so could lead to a buffer overflow. You should review <a href="https://docs.microsoft.com/windows/desktop/Controls/sec-comctls">Security Considerations: Microsoft Windows Controls</a> before continuing.
 * 
 * <b>Windows 95 or later</b>: <b>DlgDirSelectComboBoxExW</b> is supported by the Microsoft Layer for Unicode (MSLU). To use this, you must add certain files to your application, as outlined in <a href="https://docs.microsoft.com/archive/msdn-magazine/2001/october/mslu-develop-unicode-applications-for-windows-9x-platforms-with-the-microsoft-layer-for-unicode">Microsoft Layer for Unicode on Windows Me/98/95 Systems</a>.
 * 
 * 
 * 
 * > [!NOTE]
 * > The winuser.h header defines DlgDirSelectComboBoxEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HWND} hwndDlg Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * A handle to the dialog box that contains the combo box.
 * @param {PSTR} lpString Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPTSTR</a></b>
 * 
 * A pointer to the buffer that receives the selected path.
 * @param {Integer} cchOut Type: <b>int</b>
 * 
 * The length, in characters, of the buffer pointed to by the <i>lpString</i> parameter.
 * @param {Integer} idComboBox Type: <b>int</b>
 * 
 * The integer identifier of the combo box control in the dialog box.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * If the current selection is a directory name, the return value is nonzero.
 *                 
 *                     
 * 
 * If the current selection is not a directory name, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-dlgdirselectcomboboxexa
 * @since windows6.0.6000
 */
export DlgDirSelectComboBoxExA(hwndDlg, lpString, cchOut, idComboBox) {
    lpString := lpString is String ? StrPtr(lpString) : lpString

    A_LastError := 0

    result := DllCall("USER32.dll\DlgDirSelectComboBoxExA", HWND, hwndDlg, "ptr", lpString, "int", cchOut, "int", idComboBox, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves the current selection from a combo box filled by using the DlgDirListComboBox function. The selection is interpreted as a drive letter, a file, or a directory name. (Unicode)
 * @remarks
 * If the current selection specifies a directory name or drive letter, the <b>DlgDirSelectComboBoxEx</b> function removes the enclosing square brackets (and hyphens for drive letters) so the name or letter is ready to be inserted into a new path or file name. If there is no selection, the contents of the buffer pointed to by <i>lpString</i> do not change.
 * 
 * The <b>DlgDirSelectComboBoxEx</b> function does not allow more than one file name to be returned from a combo box. 
 * 
 * If the string is as long or longer than the buffer, the buffer contains the truncated string with a terminating null character.
 * 
 * <b>DlgDirSelectComboBoxEx</b> sends <a href="https://docs.microsoft.com/windows/desktop/Controls/cb-getcursel">CB_GETCURSEL</a> and <a href="https://docs.microsoft.com/windows/desktop/Controls/cb-getlbtext">CB_GETLBTEXT</a> messages to the combo box. 
 * 
 * You can use this function with all three types of combo boxes (<a href="https://docs.microsoft.com/windows/desktop/Controls/combo-box-styles">CBS_SIMPLE</a>, <a href="https://docs.microsoft.com/windows/desktop/Controls/combo-box-styles">CBS_DROPDOWN</a>, and CBS_DROPDOWNLIST). 
 * 
 * <b>Security Warning:  </b>Improper use of this function can cause problems for your application. For instance, the <i>nCount</i> parameter should be set properly for both ANSI and Unicode versions. Failure to do so could lead to a buffer overflow. You should review <a href="https://docs.microsoft.com/windows/desktop/Controls/sec-comctls">Security Considerations: Microsoft Windows Controls</a> before continuing.
 * 
 * <b>Windows 95 or later</b>: <b>DlgDirSelectComboBoxExW</b> is supported by the Microsoft Layer for Unicode (MSLU). To use this, you must add certain files to your application, as outlined in <a href="https://docs.microsoft.com/archive/msdn-magazine/2001/october/mslu-develop-unicode-applications-for-windows-9x-platforms-with-the-microsoft-layer-for-unicode">Microsoft Layer for Unicode on Windows Me/98/95 Systems</a>.
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winuser.h header defines DlgDirSelectComboBoxEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HWND} hwndDlg Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * A handle to the dialog box that contains the combo box.
 * @param {PWSTR} lpString Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPTSTR</a></b>
 * 
 * A pointer to the buffer that receives the selected path.
 * @param {Integer} cchOut Type: <b>int</b>
 * 
 * The length, in characters, of the buffer pointed to by the <i>lpString</i> parameter.
 * @param {Integer} idComboBox Type: <b>int</b>
 * 
 * The integer identifier of the combo box control in the dialog box.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * If the current selection is a directory name, the return value is nonzero.
 *                 
 *                     
 * 
 * If the current selection is not a directory name, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-dlgdirselectcomboboxexw
 * @since windows6.0.6000
 */
export DlgDirSelectComboBoxExW(hwndDlg, lpString, cchOut, idComboBox) {
    lpString := lpString is String ? StrPtr(lpString) : lpString

    A_LastError := 0

    result := DllCall("USER32.dll\DlgDirSelectComboBoxExW", HWND, hwndDlg, "ptr", lpString, "int", cchOut, "int", idComboBox, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The SetScrollInfo function sets the parameters of a scroll bar, including the minimum and maximum scrolling positions, the page size, and the position of the scroll box (thumb). The function also redraws the scroll bar, if requested.
 * @remarks
 * The <b>SetScrollInfo</b> function performs range checking on the values specified by the 
 * 				<b>nPage</b> and 
 * 				<b>nPos</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-scrollinfo">SCROLLINFO</a> structure. The 
 * 				<b>nPage</b> member must specify a value from 0 to 
 * 				<b>nMax</b> - 
 * 				<b>nMin</b> +1. The 
 * 				<b>nPos</b> member must specify a value between 
 * 				<b>nMin</b> and 
 * 				<b>nMax</b> - 
 * 				<b>max</b>(
 * 				<b>nPage</b>– 1, 0). If either value is beyond its range, the function sets it to a value that is just within the range. 
 * 
 * If the <i>fnBar</i> parameter is SB_CTL and the window specified by the <i>hwnd</i> parameter is not a system scroll bar control, the system sends the <a href="https://docs.microsoft.com/windows/desktop/Controls/sbm-setscrollinfo">SBM_SETSCROLLINFO</a> message to the window to set scroll bar information (The system can optimize the message to <a href="https://docs.microsoft.com/windows/desktop/Controls/sbm-setpos">SBM_SETPOS</a> or <a href="https://docs.microsoft.com/windows/desktop/Controls/sbm-setrange">SBM_SETRANGE</a> if the request is solely for the position or range).  This allows <b>SetScrollInfo</b> to operate on a custom control that mimics a scroll bar.  If the window does not handle <b>SBM_SETSCROLLINFO</b> (or the optimized <b>SBM_SETPOS</b> message or <b>SBM_SETRANGE</b> message), then the <b>SetScrollInfo</b> function fails.
 * 
 * For an example, see <a href="https://docs.microsoft.com/windows/desktop/Controls/using-scroll-bars">Scrolling Text with the WM_PAINT Message</a>.
 * @param {HWND} _hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * Handle to a scroll bar control or a window with a standard scroll bar, depending on the value of the 
 * 					<i>fnBar</i> parameter.
 * @param {SCROLLBAR_CONSTANTS} nBar Type: <b>int</b>
 * @param {Pointer<SCROLLINFO>} lpsi Type: <b>LPCSCROLLINFO</b>
 * 
 * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-scrollinfo">SCROLLINFO</a> structure. Before calling <b>SetScrollInfo</b>, set the 
 * 					<b>cbSize</b> member of the structure to 
 * 					<b>sizeof</b>(<b>SCROLLINFO</b>), set the 
 * 					<b>fMask</b> member to indicate the parameters to set, and specify the new parameter values in the appropriate members.
 * 
 * The
 * @param {BOOL} redraw Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * Specifies whether the scroll bar is redrawn to reflect the changes to the scroll bar. If this parameter is <b>TRUE</b>, the scroll bar is redrawn, otherwise, it is not redrawn.
 * @returns {Integer} Type: <b>int</b>
 * 
 * The return value is the current position of the scroll box.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-setscrollinfo
 * @since windows6.0.6000
 */
export SetScrollInfo(_hwnd, nBar, lpsi, redraw) {
    result := DllCall("USER32.dll\SetScrollInfo", HWND, _hwnd, SCROLLBAR_CONSTANTS, nBar, SCROLLINFO.Ptr, lpsi, BOOL, redraw, Int32)
    return result
}

/**
 * Retrieves information about the specified combo box.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/Controls/cb-getcomboboxinfo">CB_GETCOMBOBOXINFO</a> message is equivalent to this function.
 * @param {HWND} hwndCombo Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * A handle to the combo box.
 * @param {Pointer<COMBOBOXINFO>} pcbi Type: <b>PCOMBOBOXINFO</b>
 * 
 * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-comboboxinfo">COMBOBOXINFO</a> structure that receives the information. You must set <b>COMBOBOXINFO.cbSize</b> before calling this function.
 * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
 * 
 * If the function succeeds, the return value is nonzero.
 * 
 * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getcomboboxinfo
 * @since windows6.0.6000
 */
export GetComboBoxInfo(hwndCombo, pcbi) {
    A_LastError := 0

    result := DllCall("USER32.dll\GetComboBoxInfo", HWND, hwndCombo, COMBOBOXINFO.Ptr, pcbi, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves the number of items per column in a specified list box.
 * @param {HWND} _hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
 * 
 * A handle to the list box whose number of items per column is to be retrieved.
 * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
 * 
 * The return value is the number of items per column.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getlistboxinfo
 * @since windows6.0.6000
 */
export GetListBoxInfo(_hwnd) {
    result := DllCall("USER32.dll\GetListBoxInfo", HWND, _hwnd, UInt32)
    return result
}

/**
 * Registers a window to process the WM_POINTERDEVICECHANGE, WM_POINTERDEVICEINRANGE, and WM_POINTERDEVICEOUTOFRANGE pointer device notifications.
 * @param {HWND} window The window that receives <a href="https://docs.microsoft.com/windows/win32/inputmsg/wm-pointerdevicechange">WM_POINTERDEVICECHANGE</a>,
 * <a href="https://docs.microsoft.com/windows/win32/inputmsg/wm-pointerdeviceinrange">WM_POINTERDEVICEINRANGE</a>, and
 * <a href="https://docs.microsoft.com/windows/win32/inputmsg/wm-pointerdeviceoutofrange">WM_POINTERDEVICEOUTOFRANGE</a> notifications.
 * @param {BOOL} notifyRange If set to TRUE, process the <a href="https://docs.microsoft.com/windows/win32/inputmsg/wm-pointerdeviceinrange">WM_POINTERDEVICEINRANGE</a> and
 * <a href="https://docs.microsoft.com/windows/win32/inputmsg/wm-pointerdeviceoutofrange">WM_POINTERDEVICEOUTOFRANGE</a> messages. If set to FALSE, these messages aren't processed.
 * @returns {BOOL} If this function succeeds, it returns TRUE.
 *  
 * Otherwise, it returns FALSE. To retrieve extended error information, call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-registerpointerdevicenotifications
 * @since windows8.0
 */
export RegisterPointerDeviceNotifications(window, notifyRange) {
    A_LastError := 0

    result := DllCall("USER32.dll\RegisterPointerDeviceNotifications", HWND, window, BOOL, notifyRange, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

;@endregion Functions
