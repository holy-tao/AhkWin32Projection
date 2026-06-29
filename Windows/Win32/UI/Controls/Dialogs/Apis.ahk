#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\CHOOSEFONTW.ahk" { CHOOSEFONTW as CHOOSEFONTW_type }
#Import ".\COMMON_DLG_ERRORS.ahk" { COMMON_DLG_ERRORS }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import ".\FINDREPLACEW.ahk" { FINDREPLACEW }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\PRINTDLGW.ahk" { PRINTDLGW as PRINTDLGW_type }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\OPENFILENAMEW.ahk" { OPENFILENAMEW }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\PRINTDLGEXA.ahk" { PRINTDLGEXA as PRINTDLGEXA_type }
#Import ".\CHOOSECOLORW.ahk" { CHOOSECOLORW as CHOOSECOLORW_type }
#Import ".\OPENFILENAMEA.ahk" { OPENFILENAMEA }
#Import ".\PAGESETUPDLGW.ahk" { PAGESETUPDLGW as PAGESETUPDLGW_type }
#Import ".\PAGESETUPDLGA.ahk" { PAGESETUPDLGA as PAGESETUPDLGA_type }
#Import ".\PRINTDLGEXW.ahk" { PRINTDLGEXW as PRINTDLGEXW_type }
#Import ".\CHOOSECOLORA.ahk" { CHOOSECOLORA as CHOOSECOLORA_type }
#Import ".\CHOOSEFONTA.ahk" { CHOOSEFONTA as CHOOSEFONTA_type }
#Import ".\PRINTDLGA.ahk" { PRINTDLGA as PRINTDLGA_type }
#Import ".\FINDREPLACEA.ahk" { FINDREPLACEA }

/**
 * @namespace Windows.Win32.UI.Controls.Dialogs
 */

;@region Functions
/**
 * Creates an Open dialog box that lets the user specify the drive, directory, and the name of a file or set of files to be opened. (ANSI)
 * @remarks
 * The Explorer-style <b>Open</b> dialog box provides user-interface features that are similar to the Windows Explorer. You can provide an <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nc-commdlg-lpofnhookproc">OFNHookProc</a> hook procedure for an Explorer-style <b>Open</b> dialog box. To enable the hook procedure, set the <b>OFN_EXPLORER</b> and <b>OFN_ENABLEHOOK</b> flags in the <b>Flags</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/commdlg/ns-commdlg-openfilenamea">OPENFILENAME</a> structure and specify the address of the hook procedure in the <b>lpfnHook</b> member.
 * 
 * Windows continues to support the old-style <b>Open</b> dialog box for applications that want to maintain a user-interface consistent with the old-style user-interface. To display the old-style <b>Open</b> dialog box, enable an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646932(v=vs.85)">OFNHookProcOldStyle</a> hook procedure and ensure that the <b>OFN_EXPLORER</b> flag is not set.
 * 
 * To display a dialog box that allows the user to select a directory instead of a file, call the <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shbrowseforfoldera">SHBrowseForFolder</a> function.
 * 
 * Note, when selecting multiple files, the total character limit for the file names depends on the version of the function.
 * 
 * <ul>
 * <li>ANSI: 32k limit</li>
 * <li>Unicode: no restriction </li>
 * </ul>
 * @param {Pointer<OPENFILENAMEA>} param0 
 * @returns {BOOL} Type: <b>BOOL</b>
 * 
 * If the user specifies a file name and clicks the <b>OK</b> button, the return value is nonzero. The buffer pointed to by the <b>lpstrFile</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/commdlg/ns-commdlg-openfilenamea">OPENFILENAME</a> structure contains the full path and file name specified by the user.
 * 
 * If the user cancels or closes the <b>Open</b> dialog box or an error occurs, the return value is zero. To get extended error information, call the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nf-commdlg-commdlgextendederror">CommDlgExtendedError</a> function, which can return one of the following values.
 * @see https://learn.microsoft.com/windows/win32/api/commdlg/nf-commdlg-getopenfilenamea
 * @since windows5.0
 */
export GetOpenFileNameA(param0) {
    result := DllCall("COMDLG32.dll\GetOpenFileNameA", OPENFILENAMEA.Ptr, param0, BOOL)
    return result
}

/**
 * Creates an Open dialog box that lets the user specify the drive, directory, and the name of a file or set of files to be opened. (Unicode)
 * @remarks
 * The Explorer-style <b>Open</b> dialog box provides user-interface features that are similar to the Windows Explorer. You can provide an <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nc-commdlg-lpofnhookproc">OFNHookProc</a> hook procedure for an Explorer-style <b>Open</b> dialog box. To enable the hook procedure, set the <b>OFN_EXPLORER</b> and <b>OFN_ENABLEHOOK</b> flags in the <b>Flags</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/commdlg/ns-commdlg-openfilenamea">OPENFILENAME</a> structure and specify the address of the hook procedure in the <b>lpfnHook</b> member.
 * 
 * Windows continues to support the old-style <b>Open</b> dialog box for applications that want to maintain a user-interface consistent with the old-style user-interface. To display the old-style <b>Open</b> dialog box, enable an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646932(v=vs.85)">OFNHookProcOldStyle</a> hook procedure and ensure that the <b>OFN_EXPLORER</b> flag is not set.
 * 
 * To display a dialog box that allows the user to select a directory instead of a file, call the <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shbrowseforfoldera">SHBrowseForFolder</a> function.
 * 
 * Note, when selecting multiple files, the total character limit for the file names depends on the version of the function.
 * 
 * <ul>
 * <li>ANSI: 32k limit</li>
 * <li>Unicode: no restriction </li>
 * </ul>
 * @param {Pointer<OPENFILENAMEW>} param0 
 * @returns {BOOL} Type: <b>BOOL</b>
 * 
 * If the user specifies a file name and clicks the <b>OK</b> button, the return value is nonzero. The buffer pointed to by the <b>lpstrFile</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/commdlg/ns-commdlg-openfilenamea">OPENFILENAME</a> structure contains the full path and file name specified by the user.
 * 
 * If the user cancels or closes the <b>Open</b> dialog box or an error occurs, the return value is zero. To get extended error information, call the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nf-commdlg-commdlgextendederror">CommDlgExtendedError</a> function, which can return one of the following values.
 * @see https://learn.microsoft.com/windows/win32/api/commdlg/nf-commdlg-getopenfilenamew
 * @since windows5.0
 */
export GetOpenFileNameW(param0) {
    result := DllCall("COMDLG32.dll\GetOpenFileNameW", OPENFILENAMEW.Ptr, param0, BOOL)
    return result
}

/**
 * Creates a Save dialog box that lets the user specify the drive, directory, and name of a file to save. (ANSI)
 * @remarks
 * The Explorer-style <b>Save</b> dialog box that provides user-interface features that are similar to the Windows Explorer. You can provide an <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nc-commdlg-lpofnhookproc">OFNHookProc</a> hook procedure for an Explorer-style <b>Save</b> dialog box. To enable the hook procedure, set the <b>OFN_EXPLORER</b> and <b>OFN_ENABLEHOOK</b> flags in the  <b>Flags</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/commdlg/ns-commdlg-openfilenamea">OPENFILENAME</a> structure and specify the address of the hook procedure in the  <b>lpfnHook</b> member.
 * 
 * Windows continues to support old-style <b>Save</b> dialog boxes for applications that want to maintain a user-interface consistent with the old-style user-interface. To display the old-style <b>Save</b> dialog box, enable an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646932(v=vs.85)">OFNHookProcOldStyle</a> hook procedure and ensure that the <b>OFN_EXPLORER</b> flag is not set.
 * @param {Pointer<OPENFILENAMEA>} param0 
 * @returns {BOOL} Type: <b>BOOL</b>
 * 
 * If the user specifies a file name and clicks the 
 * 						<b>OK</b> button and the function is successful, the return value is nonzero. The buffer pointed to by the 
 * 						<b>lpstrFile</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/commdlg/ns-commdlg-openfilenamea">OPENFILENAME</a> structure contains the full path and file name specified by the user.
 * 
 * If the user cancels or closes the 
 * 						<b>Save</b> dialog box or an error such as the file name buffer being too small occurs, the return value is zero. To get extended error information, call the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nf-commdlg-commdlgextendederror">CommDlgExtendedError</a> function, which can return one of the following values:
 * @see https://learn.microsoft.com/windows/win32/api/commdlg/nf-commdlg-getsavefilenamea
 * @since windows5.0
 */
export GetSaveFileNameA(param0) {
    result := DllCall("COMDLG32.dll\GetSaveFileNameA", OPENFILENAMEA.Ptr, param0, BOOL)
    return result
}

/**
 * Creates a Save dialog box that lets the user specify the drive, directory, and name of a file to save. (Unicode)
 * @remarks
 * The Explorer-style <b>Save</b> dialog box that provides user-interface features that are similar to the Windows Explorer. You can provide an <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nc-commdlg-lpofnhookproc">OFNHookProc</a> hook procedure for an Explorer-style <b>Save</b> dialog box. To enable the hook procedure, set the <b>OFN_EXPLORER</b> and <b>OFN_ENABLEHOOK</b> flags in the  <b>Flags</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/commdlg/ns-commdlg-openfilenamea">OPENFILENAME</a> structure and specify the address of the hook procedure in the  <b>lpfnHook</b> member.
 * 
 * Windows continues to support old-style <b>Save</b> dialog boxes for applications that want to maintain a user-interface consistent with the old-style user-interface. To display the old-style <b>Save</b> dialog box, enable an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646932(v=vs.85)">OFNHookProcOldStyle</a> hook procedure and ensure that the <b>OFN_EXPLORER</b> flag is not set.
 * @param {Pointer<OPENFILENAMEW>} param0 
 * @returns {BOOL} Type: <b>BOOL</b>
 * 
 * If the user specifies a file name and clicks the 
 * 						<b>OK</b> button and the function is successful, the return value is nonzero. The buffer pointed to by the 
 * 						<b>lpstrFile</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/commdlg/ns-commdlg-openfilenamea">OPENFILENAME</a> structure contains the full path and file name specified by the user.
 * 
 * If the user cancels or closes the 
 * 						<b>Save</b> dialog box or an error such as the file name buffer being too small occurs, the return value is zero. To get extended error information, call the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nf-commdlg-commdlgextendederror">CommDlgExtendedError</a> function, which can return one of the following values:
 * @see https://learn.microsoft.com/windows/win32/api/commdlg/nf-commdlg-getsavefilenamew
 * @since windows5.0
 */
export GetSaveFileNameW(param0) {
    result := DllCall("COMDLG32.dll\GetSaveFileNameW", OPENFILENAMEW.Ptr, param0, BOOL)
    return result
}

/**
 * Retrieves the name of the specified file. (ANSI)
 * @remarks
 * <b>GetFileTitle</b> should only be called with legal file names; using an illegal file name has an undefined result.
 * 
 * To get the buffer size needed for the name of a file, call the function with  <i>lpszTitle</i> set to <b>NULL</b> and  <i>cchSize</i> set to zero. The function returns the required size.
 * 
 * <b>GetFileTitle</b> returns the string that the system would use to display the file name to the user. The display name includes an extension only if that is the user's preference for displaying file names. This means that the returned string may not accurately identify the file if it is used in calls to file system functions.
 * 
 * If the  <i>lpszTitle</i> buffer is too small, <b>GetFileTitle</b> returns the size required to hold the display name. However, there is no guaranteed relationship between the required size and the characters originally specified in the  <i>lpszFile</i> buffer. For example, do not call <b>GetFileTitle</b> with  <i>lpszTitle</i> set to <b>NULL</b> and  <i>cchSize</i> set to zero, and then try to use the return value as an index into the  <i>lpszFile</i> string. You can usually achieve similar results (and superior performance) with C run-time library functions such as <b>strrchr</b>, <b>wcsrchr</b>, and <b>_mbsrchr</b>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The commdlg.h header defines GetFileTitle as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} param0 
 * @param {PSTR} Buf Type: <b>LPTSTR</b>
 * 
 * The buffer that receives the name of the file.
 * @param {Integer} cchSize Type: <b>WORD</b>
 * 
 * The length, in 
 * 					characters, of the buffer pointed to by the <i>lpszTitle</i> parameter.
 * @returns {Integer} Type: <b>short</b>
 * 
 * If the function succeeds, the return value is zero.
 * 
 * If the file name is invalid, the return value is unknown. If there is an error, the return value is a negative number.
 * 
 * If the buffer pointed to by the <i>lpszTitle</i> parameter is too small, the return value is a positive integer that specifies the required buffer size, in characters. The required buffer size includes the terminating null character.
 * @see https://learn.microsoft.com/windows/win32/api/commdlg/nf-commdlg-getfiletitlea
 * @since windows5.0
 */
export GetFileTitleA(param0, Buf, cchSize) {
    param0 := param0 is String ? StrPtr(param0) : param0
    Buf := Buf is String ? StrPtr(Buf) : Buf

    result := DllCall("COMDLG32.dll\GetFileTitleA", "ptr", param0, "ptr", Buf, "ushort", cchSize, Int16)
    return result
}

/**
 * Retrieves the name of the specified file. (Unicode)
 * @remarks
 * <b>GetFileTitle</b> should only be called with legal file names; using an illegal file name has an undefined result.
 * 
 * To get the buffer size needed for the name of a file, call the function with  <i>lpszTitle</i> set to <b>NULL</b> and  <i>cchSize</i> set to zero. The function returns the required size.
 * 
 * <b>GetFileTitle</b> returns the string that the system would use to display the file name to the user. The display name includes an extension only if that is the user's preference for displaying file names. This means that the returned string may not accurately identify the file if it is used in calls to file system functions.
 * 
 * If the  <i>lpszTitle</i> buffer is too small, <b>GetFileTitle</b> returns the size required to hold the display name. However, there is no guaranteed relationship between the required size and the characters originally specified in the  <i>lpszFile</i> buffer. For example, do not call <b>GetFileTitle</b> with  <i>lpszTitle</i> set to <b>NULL</b> and  <i>cchSize</i> set to zero, and then try to use the return value as an index into the  <i>lpszFile</i> string. You can usually achieve similar results (and superior performance) with C run-time library functions such as <b>strrchr</b>, <b>wcsrchr</b>, and <b>_mbsrchr</b>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The commdlg.h header defines GetFileTitle as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} param0 
 * @param {PWSTR} Buf Type: <b>LPTSTR</b>
 * 
 * The buffer that receives the name of the file.
 * @param {Integer} cchSize Type: <b>WORD</b>
 * 
 * The length, in 
 * 					characters, of the buffer pointed to by the <i>lpszTitle</i> parameter.
 * @returns {Integer} Type: <b>short</b>
 * 
 * If the function succeeds, the return value is zero.
 * 
 * If the file name is invalid, the return value is unknown. If there is an error, the return value is a negative number.
 * 
 * If the buffer pointed to by the <i>lpszTitle</i> parameter is too small, the return value is a positive integer that specifies the required buffer size, in characters. The required buffer size includes the terminating null character.
 * @see https://learn.microsoft.com/windows/win32/api/commdlg/nf-commdlg-getfiletitlew
 * @since windows5.0
 */
export GetFileTitleW(param0, Buf, cchSize) {
    param0 := param0 is String ? StrPtr(param0) : param0
    Buf := Buf is String ? StrPtr(Buf) : Buf

    result := DllCall("COMDLG32.dll\GetFileTitleW", "ptr", param0, "ptr", Buf, "ushort", cchSize, Int16)
    return result
}

/**
 * 
 * @param {Pointer<CHOOSECOLORA>} param0 
 * @returns {BOOL} 
 */
export ChooseColorA(param0) {
    result := DllCall("COMDLG32.dll\ChooseColorA", CHOOSECOLORA_type.Ptr, param0, BOOL)
    return result
}

/**
 * Wide string version of ChooseColor
 * @param {Pointer<CHOOSECOLORW>} param0 
 * @returns {BOOL} 
 * @see https://learn.microsoft.com/windows/win32/api/commdlg/nc-commdlg-choosecolorw
 */
export ChooseColorW(param0) {
    result := DllCall("COMDLG32.dll\ChooseColorW", CHOOSECOLORW_type.Ptr, param0, BOOL)
    return result
}

/**
 * Creates a system-defined modeless Find dialog box that lets the user specify a string to search for and options to use when searching for text in a document. (ANSI)
 * @remarks
 * The <b>FindText</b> function does not perform a search operation. Instead, the dialog box sends <a href="https://docs.microsoft.com/windows/desktop/dlgbox/findmsgstring">FINDMSGSTRING</a> registered messages to the window procedure of the owner window of the dialog box. When you create the dialog box, the  <b>hwndOwner</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/ns-commdlg-findreplacea">FINDREPLACE</a> structure is a handle to the owner window.
 * 
 * Before calling <b>FindText</b>, you must call the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-registerwindowmessagea">RegisterWindowMessage</a> function to get the identifier for the <a href="https://docs.microsoft.com/windows/desktop/dlgbox/findmsgstring">FINDMSGSTRING</a> message. The dialog box procedure uses this identifier to send messages when the user clicks the <b>Find Next</b> button, or when the dialog box is closing. The  <i>lParam</i> parameter of the <b>FINDMSGSTRING</b> message contains a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/ns-commdlg-findreplacea">FINDREPLACE</a> structure. The  <b>Flags</b> member of this structure indicates the event that caused the message. Other members of the structure indicate the user's input.
 * 
 * If you create a <b>Find</b> dialog box, you must also use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-isdialogmessagea">IsDialogMessage</a> function in the main message loop of your application to ensure that the dialog box correctly processes keyboard input, such as the TAB and ESC keys. <b>IsDialogMessage</b> returns a value that indicates whether the <b>Find</b> dialog box processed the message.
 * 
 * You can provide an <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nc-commdlg-lpfrhookproc">FRHookProc</a> hook procedure for a <b>Find</b> dialog box. The hook procedure can process messages sent to the dialog box. To enable a hook procedure, set the <b>FR_ENABLEHOOK</b> flag in the  <b>Flags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/ns-commdlg-findreplacea">FINDREPLACE</a> structure and specify the address of the hook procedure in the  <b>lpfnHook</b> member.
 * @param {Pointer<FINDREPLACEA>} param0 
 * @returns {HWND} Type: <b>HWND</b>
 * 
 * If the function succeeds, the return value is the window handle to the dialog box. You can use the window handle to communicate with or to close the dialog box.
 * 
 * If the function fails, the return value is <b>NULL</b>. To get extended error information, call the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nf-commdlg-commdlgextendederror">CommDlgExtendedError</a> function. <b>CommDlgExtendedError</b> may return one of the following error codes:
 * @see https://learn.microsoft.com/windows/win32/api/commdlg/nf-commdlg-findtexta
 * @since windows5.0
 */
export FindTextA(param0) {
    result := DllCall("COMDLG32.dll\FindTextA", FINDREPLACEA.Ptr, param0, HWND)
    return result
}

/**
 * Creates a system-defined modeless Find dialog box that lets the user specify a string to search for and options to use when searching for text in a document. (Unicode)
 * @remarks
 * The <b>FindText</b> function does not perform a search operation. Instead, the dialog box sends <a href="https://docs.microsoft.com/windows/desktop/dlgbox/findmsgstring">FINDMSGSTRING</a> registered messages to the window procedure of the owner window of the dialog box. When you create the dialog box, the  <b>hwndOwner</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/ns-commdlg-findreplacea">FINDREPLACE</a> structure is a handle to the owner window.
 * 
 * Before calling <b>FindText</b>, you must call the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-registerwindowmessagea">RegisterWindowMessage</a> function to get the identifier for the <a href="https://docs.microsoft.com/windows/desktop/dlgbox/findmsgstring">FINDMSGSTRING</a> message. The dialog box procedure uses this identifier to send messages when the user clicks the <b>Find Next</b> button, or when the dialog box is closing. The  <i>lParam</i> parameter of the <b>FINDMSGSTRING</b> message contains a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/ns-commdlg-findreplacea">FINDREPLACE</a> structure. The  <b>Flags</b> member of this structure indicates the event that caused the message. Other members of the structure indicate the user's input.
 * 
 * If you create a <b>Find</b> dialog box, you must also use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-isdialogmessagea">IsDialogMessage</a> function in the main message loop of your application to ensure that the dialog box correctly processes keyboard input, such as the TAB and ESC keys. <b>IsDialogMessage</b> returns a value that indicates whether the <b>Find</b> dialog box processed the message.
 * 
 * You can provide an <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nc-commdlg-lpfrhookproc">FRHookProc</a> hook procedure for a <b>Find</b> dialog box. The hook procedure can process messages sent to the dialog box. To enable a hook procedure, set the <b>FR_ENABLEHOOK</b> flag in the  <b>Flags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/ns-commdlg-findreplacea">FINDREPLACE</a> structure and specify the address of the hook procedure in the  <b>lpfnHook</b> member.
 * @param {Pointer<FINDREPLACEW>} param0 
 * @returns {HWND} Type: <b>HWND</b>
 * 
 * If the function succeeds, the return value is the window handle to the dialog box. You can use the window handle to communicate with or to close the dialog box.
 * 
 * If the function fails, the return value is <b>NULL</b>. To get extended error information, call the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nf-commdlg-commdlgextendederror">CommDlgExtendedError</a> function. <b>CommDlgExtendedError</b> may return one of the following error codes:
 * @see https://learn.microsoft.com/windows/win32/api/commdlg/nf-commdlg-findtextw
 * @since windows5.0
 */
export FindTextW(param0) {
    result := DllCall("COMDLG32.dll\FindTextW", FINDREPLACEW.Ptr, param0, HWND)
    return result
}

/**
 * Creates a system-defined modeless dialog box that lets the user specify a string to search for and a replacement string, as well as options to control the find and replace operations. (ANSI)
 * @remarks
 * The <b>ReplaceText</b> function does not perform a text replacement operation. Instead, the dialog box sends <a href="https://docs.microsoft.com/windows/desktop/dlgbox/findmsgstring">FINDMSGSTRING</a> registered messages to the window procedure of the owner window of the dialog box. When you create the dialog box, the  <b>hwndOwner</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/ns-commdlg-findreplacea">FINDREPLACE</a> structure is a handle to the owner window.
 * 
 * Before calling <b>ReplaceText</b>, you must call the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-registerwindowmessagea">RegisterWindowMessage</a> function to get the identifier for the <a href="https://docs.microsoft.com/windows/desktop/dlgbox/findmsgstring">FINDMSGSTRING</a> message. The dialog box procedure uses this identifier to send messages when the user clicks the <b>Find Next</b>, <b>Replace</b>, or <b>Replace All</b> buttons, or when the dialog box is closing. The  <i>lParam</i> parameter of a <b>FINDMSGSTRING</b> message contains a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/ns-commdlg-findreplacea">FINDREPLACE</a> structure. The  <b>Flags</b> member of this structure indicates the event that caused the message. Other members of the structure indicate the user's input.
 * 
 * If you create a <b>Replace</b> dialog box, you must also use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-isdialogmessagea">IsDialogMessage</a> function in the main message loop of your application to ensure that the dialog box correctly processes keyboard input, such as the TAB and ESC keys. The <b>IsDialogMessage</b> function returns a value that indicates whether the Replace dialog box processed the message.
 * 
 * You can provide an <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nc-commdlg-lpfrhookproc">FRHookProc</a> hook procedure for a <b>Replace</b> dialog box. The hook procedure can process messages sent to the dialog box. To enable a hook procedure, set the <b>FR_ENABLEHOOK</b> flag in the  <b>Flags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/ns-commdlg-findreplacea">FINDREPLACE</a> structure and specify the address of the hook procedure in the  <b>lpfnHook</b> member.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The commdlg.h header defines ReplaceText as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<FINDREPLACEA>} param0 
 * @returns {HWND} Type: <b>HWND</b>
 * 
 * If the function succeeds, the return value is the window handle to the dialog box. You can use the window handle to communicate with the dialog box or close it.
 * 
 * If the function fails, the return value is <b>NULL</b>. To get extended error information, call the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nf-commdlg-commdlgextendederror">CommDlgExtendedError</a> function, which can return one of the following error codes:
 * @see https://learn.microsoft.com/windows/win32/api/commdlg/nf-commdlg-replacetexta
 * @since windows5.0
 */
export ReplaceTextA(param0) {
    result := DllCall("COMDLG32.dll\ReplaceTextA", FINDREPLACEA.Ptr, param0, HWND)
    return result
}

/**
 * Creates a system-defined modeless dialog box that lets the user specify a string to search for and a replacement string, as well as options to control the find and replace operations. (Unicode)
 * @remarks
 * The <b>ReplaceText</b> function does not perform a text replacement operation. Instead, the dialog box sends <a href="https://docs.microsoft.com/windows/desktop/dlgbox/findmsgstring">FINDMSGSTRING</a> registered messages to the window procedure of the owner window of the dialog box. When you create the dialog box, the  <b>hwndOwner</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/ns-commdlg-findreplacea">FINDREPLACE</a> structure is a handle to the owner window.
 * 
 * Before calling <b>ReplaceText</b>, you must call the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-registerwindowmessagea">RegisterWindowMessage</a> function to get the identifier for the <a href="https://docs.microsoft.com/windows/desktop/dlgbox/findmsgstring">FINDMSGSTRING</a> message. The dialog box procedure uses this identifier to send messages when the user clicks the <b>Find Next</b>, <b>Replace</b>, or <b>Replace All</b> buttons, or when the dialog box is closing. The  <i>lParam</i> parameter of a <b>FINDMSGSTRING</b> message contains a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/ns-commdlg-findreplacea">FINDREPLACE</a> structure. The  <b>Flags</b> member of this structure indicates the event that caused the message. Other members of the structure indicate the user's input.
 * 
 * If you create a <b>Replace</b> dialog box, you must also use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-isdialogmessagea">IsDialogMessage</a> function in the main message loop of your application to ensure that the dialog box correctly processes keyboard input, such as the TAB and ESC keys. The <b>IsDialogMessage</b> function returns a value that indicates whether the Replace dialog box processed the message.
 * 
 * You can provide an <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nc-commdlg-lpfrhookproc">FRHookProc</a> hook procedure for a <b>Replace</b> dialog box. The hook procedure can process messages sent to the dialog box. To enable a hook procedure, set the <b>FR_ENABLEHOOK</b> flag in the  <b>Flags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/ns-commdlg-findreplacea">FINDREPLACE</a> structure and specify the address of the hook procedure in the  <b>lpfnHook</b> member.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The commdlg.h header defines ReplaceText as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<FINDREPLACEW>} param0 
 * @returns {HWND} Type: <b>HWND</b>
 * 
 * If the function succeeds, the return value is the window handle to the dialog box. You can use the window handle to communicate with the dialog box or close it.
 * 
 * If the function fails, the return value is <b>NULL</b>. To get extended error information, call the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nf-commdlg-commdlgextendederror">CommDlgExtendedError</a> function, which can return one of the following error codes:
 * @see https://learn.microsoft.com/windows/win32/api/commdlg/nf-commdlg-replacetextw
 * @since windows5.0
 */
export ReplaceTextW(param0) {
    result := DllCall("COMDLG32.dll\ReplaceTextW", FINDREPLACEW.Ptr, param0, HWND)
    return result
}

/**
 * ASCII version of ChooseFont
 * @param {Pointer<CHOOSEFONTA>} param0 
 * @returns {BOOL} 
 * @see https://learn.microsoft.com/windows/win32/api/commdlg/nc-commdlg-choosefonta
 */
export ChooseFontA(param0) {
    result := DllCall("COMDLG32.dll\ChooseFontA", CHOOSEFONTA_type.Ptr, param0, BOOL)
    return result
}

/**
 * Wide string version of ChooseFont
 * @param {Pointer<CHOOSEFONTW>} param0 
 * @returns {BOOL} 
 * @see https://learn.microsoft.com/windows/win32/api/commdlg/nc-commdlg-choosefontw
 */
export ChooseFontW(param0) {
    result := DllCall("COMDLG32.dll\ChooseFontW", CHOOSEFONTW_type.Ptr, param0, BOOL)
    return result
}

/**
 * ASCII version of PrintDlg
 * @param {Pointer<PRINTDLGA>} pPD 
 * @returns {BOOL} 
 * @see https://learn.microsoft.com/windows/win32/api/commdlg/nc-commdlg-printdlga
 */
export PrintDlgA(pPD) {
    result := DllCall("COMDLG32.dll\PrintDlgA", PRINTDLGA_type.Ptr, pPD, BOOL)
    return result
}

/**
 * Wide string version of PrintDlg
 * @param {Pointer<PRINTDLGW>} pPD 
 * @returns {BOOL} 
 * @see https://learn.microsoft.com/windows/win32/api/commdlg/nc-commdlg-printdlgw
 */
export PrintDlgW(pPD) {
    result := DllCall("COMDLG32.dll\PrintDlgW", PRINTDLGW_type.Ptr, pPD, BOOL)
    return result
}

/**
 * ASCII version of PrintDlgEx
 * @param {Pointer<PRINTDLGEXA>} pPD 
 * @returns {HRESULT} 
 * @see https://learn.microsoft.com/windows/win32/api/commdlg/nc-commdlg-printdlgexa
 */
export PrintDlgExA(pPD) {
    result := DllCall("COMDLG32.dll\PrintDlgExA", PRINTDLGEXA_type.Ptr, pPD, "HRESULT")
    return result
}

/**
 * Wide string version of PrintDlgEx
 * @param {Pointer<PRINTDLGEXW>} pPD 
 * @returns {HRESULT} 
 * @see https://learn.microsoft.com/windows/win32/api/commdlg/nc-commdlg-printdlgexw
 */
export PrintDlgExW(pPD) {
    result := DllCall("COMDLG32.dll\PrintDlgExW", PRINTDLGEXW_type.Ptr, pPD, "HRESULT")
    return result
}

/**
 * The CommDlgExtendedError function (commdlg.h) returns a common dialog box error code.
 * @returns {COMMON_DLG_ERRORS} Type: <b>DWORD</b>
 * 
 * If the most recent call to a common dialog box function succeeded, the return value is undefined. If the common dialog box function returned <b>FALSE</b> because the user closed or canceled the dialog box, the return value is zero. Otherwise, the return value is a nonzero error code.
 * 
 * The <b>CommDlgExtendedError</b> function can return general error codes for any of the common dialog box functions. In addition, there are error codes that are returned only for a specific common dialog box. All of these error codes are defined in Cderr.h. The following general error codes can be returned for any of the common dialog box functions.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>CDERR_DIALOGFAILURE</b></dt>
 * <dt>0xFFFF</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The dialog box could not be created. The common dialog box function's call to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-dialogboxa">DialogBox</a> function failed. For example, this error occurs if the common dialog box call specifies an invalid window handle.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>CDERR_FINDRESFAILURE</b></dt>
 * <dt>0x0006</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The common dialog box function failed to find a specified resource.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>CDERR_INITIALIZATION</b></dt>
 * <dt>0x0002</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The common dialog box function failed during initialization. This error often occurs when sufficient memory is not available.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>CDERR_LOADRESFAILURE</b></dt>
 * <dt>0x0007</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The common dialog box function failed to load a specified resource.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>CDERR_LOADSTRFAILURE</b></dt>
 * <dt>0x0005</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The common dialog box function failed to load a specified string.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>CDERR_LOCKRESFAILURE</b></dt>
 * <dt>0x0008</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The common dialog box function failed to lock a specified resource.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>CDERR_MEMALLOCFAILURE</b></dt>
 * <dt>0x0009</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The common dialog box function was unable to allocate memory for internal structures.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>CDERR_MEMLOCKFAILURE</b></dt>
 * <dt>0x000A</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The common dialog box function was unable to lock the memory associated with a handle.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>CDERR_NOHINSTANCE</b></dt>
 * <dt>0x0004</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <b>ENABLETEMPLATE</b> flag was set in the <b>Flags</b> member of the initialization structure for the corresponding common dialog box, but you failed to provide a corresponding instance handle.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>CDERR_NOHOOK</b></dt>
 * <dt>0x000B</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <b>ENABLEHOOK</b> flag was set in the <b>Flags</b> member of the initialization structure for the corresponding common dialog box, but you failed to provide a pointer to a corresponding hook procedure.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>CDERR_NOTEMPLATE</b></dt>
 * <dt>0x0003</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <b>ENABLETEMPLATE</b> flag was set in the <b>Flags</b> member of the initialization structure for the corresponding common dialog box, but you failed to provide a corresponding template.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>CDERR_REGISTERMSGFAIL</b></dt>
 * <dt>0x000C</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-registerwindowmessagea">RegisterWindowMessage</a> function returned an error code when it was called by the common dialog box function.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>CDERR_STRUCTSIZE</b></dt>
 * <dt>0x0001</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <b>lStructSize</b> member of the initialization structure for the corresponding common dialog box is invalid.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * The following error codes can be returned for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646940(v=vs.85)">PrintDlg</a> function.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>PDERR_CREATEICFAILURE</b></dt>
 * <dt>0x100A</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646940(v=vs.85)">PrintDlg</a> function failed when it attempted to create an information context.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>PDERR_DEFAULTDIFFERENT</b></dt>
 * <dt>0x100C</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * You called the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646940(v=vs.85)">PrintDlg</a> function with the <b>DN_DEFAULTPRN</b> flag specified in the <b>wDefault</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/ns-commdlg-devnames">DEVNAMES</a> structure, but the printer described by the other structure members did not match the current default printer. This error occurs when you store the <b>DEVNAMES</b> structure, and the user changes the default printer by using the Control Panel.
 * 
 * To use the printer described by the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/ns-commdlg-devnames">DEVNAMES</a> structure, clear the <b>DN_DEFAULTPRN</b> flag and call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646940(v=vs.85)">PrintDlg</a> again.
 * 
 * To use the default printer, replace the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/ns-commdlg-devnames">DEVNAMES</a> structure (and the  structure, if one exists) with <b>NULL</b>; and call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646940(v=vs.85)">PrintDlg</a> again.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>PDERR_DNDMMISMATCH</b></dt>
 * <dt>0x1009</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The data in the <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a> and <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/ns-commdlg-devnames">DEVNAMES</a> structures describes two different printers.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>PDERR_GETDEVMODEFAIL</b></dt>
 * <dt>0x1005</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The printer driver failed to initialize a <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a> structure.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>PDERR_INITFAILURE</b></dt>
 * <dt>0x1006</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646940(v=vs.85)">PrintDlg</a> function failed during initialization, and there is no more specific extended error code to describe the failure. This is the generic default error code for the function.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>PDERR_LOADDRVFAILURE</b></dt>
 * <dt>0x1004</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646940(v=vs.85)">PrintDlg</a> function failed to load the device driver for the specified printer.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>PDERR_NODEFAULTPRN</b></dt>
 * <dt>0x1008</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A default printer does not exist.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>PDERR_NODEVICES</b></dt>
 * <dt>0x1007</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * No printer drivers were found.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>PDERR_PARSEFAILURE</b></dt>
 * <dt>0x1002</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646940(v=vs.85)">PrintDlg</a> function failed to parse the strings in the [devices] section of the WIN.INI file.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>PDERR_PRINTERNOTFOUND</b></dt>
 * <dt>0x100B</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The [devices] section of the WIN.INI file did not contain an entry for the requested printer.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>PDERR_RETDEFFAILURE</b></dt>
 * <dt>0x1003</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The PD_RETURNDEFAULT flag was specified in the <b>Flags</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/commdlg/ns-commdlg-printdlga">PRINTDLG</a> structure, but the 
 * 							<b>hDevMode</b> or <b>hDevNames</b> member was not <b>NULL</b>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>PDERR_SETUPFAILURE</b></dt>
 * <dt>0x1001</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646940(v=vs.85)">PrintDlg</a> function failed to load the required resources.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * The following error codes can be returned for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms646914(v=vs.85)">ChooseFont</a> function.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>CFERR_MAXLESSTHANMIN</b></dt>
 * <dt>0x2002</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The size specified in the <b>nSizeMax</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/ns-commdlg-choosefonta">CHOOSEFONT</a> structure is less than the size specified in the 
 * 							<b>nSizeMin</b> member.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>CFERR_NOFONTS</b></dt>
 * <dt>0x2001</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * No fonts exist.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * The following error codes can be returned for the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nf-commdlg-getopenfilenamea">GetOpenFileName</a> and <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nf-commdlg-getsavefilenamea">GetSaveFileName</a> functions.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FNERR_BUFFERTOOSMALL</b></dt>
 * <dt>0x3003</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The buffer pointed to by the <b>lpstrFile</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/commdlg/ns-commdlg-openfilenamea">OPENFILENAME</a> structure is too small for the file name specified by the user. The first two bytes of the 
 * 							<b>lpstrFile</b> buffer contain an integer value specifying the size required to receive the full name, in 
 * 							characters.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FNERR_INVALIDFILENAME</b></dt>
 * <dt>0x3002</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A file name is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FNERR_SUBCLASSFAILURE</b></dt>
 * <dt>0x3001</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An attempt to subclass a list box failed because sufficient memory was not available.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * The following error code can be returned for the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nf-commdlg-findtexta">FindText</a> and <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nf-commdlg-replacetexta">ReplaceText</a> functions.
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FRERR_BUFFERLENGTHZERO</b></dt>
 * <dt>0x4001</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A member of the <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/ns-commdlg-findreplacea">FINDREPLACE</a> structure points to an invalid buffer.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/commdlg/nf-commdlg-commdlgextendederror
 * @since windows5.0
 */
export CommDlgExtendedError() {
    result := DllCall("COMDLG32.dll\CommDlgExtendedError", COMMON_DLG_ERRORS)
    return result
}

/**
 * ASCII version of PageSetupDlg
 * @param {Pointer<PAGESETUPDLGA>} param0 
 * @returns {BOOL} 
 * @see https://learn.microsoft.com/windows/win32/api/commdlg/nc-commdlg-pagesetupdlga
 */
export PageSetupDlgA(param0) {
    result := DllCall("COMDLG32.dll\PageSetupDlgA", PAGESETUPDLGA_type.Ptr, param0, BOOL)
    return result
}

/**
 * Wide string version of PageSetupDlg
 * @param {Pointer<PAGESETUPDLGW>} param0 
 * @returns {BOOL} 
 * @see https://learn.microsoft.com/windows/win32/api/commdlg/nc-commdlg-pagesetupdlgw
 */
export PageSetupDlgW(param0) {
    result := DllCall("COMDLG32.dll\PageSetupDlgW", PAGESETUPDLGW_type.Ptr, param0, BOOL)
    return result
}

;@endregion Functions
