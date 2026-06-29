#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\..\Foundation\WPARAM.ahk" { WPARAM }
#Import ".\STYLEBUFW.ahk" { STYLEBUFW }
#Import ".\INPUTCONTEXT.ahk" { INPUTCONTEXT }
#Import ".\IME_SENTENCE_MODE.ahk" { IME_SENTENCE_MODE }
#Import ".\IMEMENUITEMINFOW.ahk" { IMEMENUITEMINFOW }
#Import "..\..\..\Graphics\Gdi\LOGFONTW.ahk" { LOGFONTW }
#Import "..\..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\..\Foundation\LRESULT.ahk" { LRESULT }
#Import ".\HIMCC.ahk" { HIMCC }
#Import ".\IME_HOTKEY_IDENTIFIER.ahk" { IME_HOTKEY_IDENTIFIER }
#Import "..\..\..\Foundation\POINT.ahk" { POINT }
#Import ".\GET_GUIDE_LINE_TYPE.ahk" { GET_GUIDE_LINE_TYPE }
#Import ".\COMPOSITIONFORM.ahk" { COMPOSITIONFORM }
#Import "..\KeyboardAndMouse\HKL.ahk" { HKL }
#Import ".\HIMC.ahk" { HIMC }
#Import "..\..\..\Graphics\Gdi\LOGFONTA.ahk" { LOGFONTA }
#Import ".\SET_COMPOSITION_STRING_TYPE.ahk" { SET_COMPOSITION_STRING_TYPE }
#Import ".\CANDIDATEFORM.ahk" { CANDIDATEFORM }
#Import ".\NOTIFY_IME_INDEX.ahk" { NOTIFY_IME_INDEX }
#Import ".\IMEMENUITEMINFOA.ahk" { IMEMENUITEMINFOA }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\GET_CONVERSION_LIST_FLAG.ahk" { GET_CONVERSION_LIST_FLAG }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import ".\IME_ESCAPE.ahk" { IME_ESCAPE }
#Import ".\STYLEBUFA.ahk" { STYLEBUFA }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\NOTIFY_IME_ACTION.ahk" { NOTIFY_IME_ACTION }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\IME_CONVERSION_MODE.ahk" { IME_CONVERSION_MODE }
#Import ".\IME_COMPOSITION_STRING.ahk" { IME_COMPOSITION_STRING }

/**
 * @namespace Windows.Win32.UI.Input.Ime
 */

;@region Functions
/**
 * The ImmInstallIMEA (ANSI) function (immdev.h) installs an IME.
 * @remarks
 * This function is intended to be used by IME setup applications only.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The immdev.h header defines ImmInstallIME as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} lpszIMEFileName Pointer to a null-terminated string that specifies the full path of the IME.
 * @param {PSTR} lpszLayoutText Pointer to a null-terminated string that specifies the name of the IME and the associated layout text.
 * @returns {HKL} Returns the input locale identifier for the IME.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-imminstallimea
 * @since windows5.1.2600
 */
export ImmInstallIMEA(lpszIMEFileName, lpszLayoutText) {
    lpszIMEFileName := lpszIMEFileName is String ? StrPtr(lpszIMEFileName) : lpszIMEFileName
    lpszLayoutText := lpszLayoutText is String ? StrPtr(lpszLayoutText) : lpszLayoutText

    result := DllCall("IMM32.dll\ImmInstallIMEA", "ptr", lpszIMEFileName, "ptr", lpszLayoutText, HKL.Owned)
    return result
}

/**
 * The ImmInstallIMEW (Unicode) function (immdev.h) installs an IME.
 * @remarks
 * This function is intended to be used by IME setup applications only.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The immdev.h header defines ImmInstallIME as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} lpszIMEFileName Pointer to a null-terminated string that specifies the full path of the IME.
 * @param {PWSTR} lpszLayoutText Pointer to a null-terminated string that specifies the name of the IME and the associated layout text.
 * @returns {HKL} Returns the input locale identifier for the IME.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-imminstallimew
 * @since windows5.1.2600
 */
export ImmInstallIMEW(lpszIMEFileName, lpszLayoutText) {
    lpszIMEFileName := lpszIMEFileName is String ? StrPtr(lpszIMEFileName) : lpszIMEFileName
    lpszLayoutText := lpszLayoutText is String ? StrPtr(lpszLayoutText) : lpszLayoutText

    result := DllCall("IMM32.dll\ImmInstallIMEW", "ptr", lpszIMEFileName, "ptr", lpszLayoutText, HKL.Owned)
    return result
}

/**
 * The ImmGetDefaultIMEWnd function (immdev.h) retrieves the default window handle to the IME class.
 * @remarks
 * The operating system creates a default IME window for every thread. The window is created based on the IME class. The application can send the <a href="https://docs.microsoft.com/windows/desktop/Intl/wm-ime-control">WM_IME_CONTROL</a> message to this window.
 * @param {HWND} param0 
 * @returns {HWND} Returns the default window handle to the IME class if successful, or <b>NULL</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetdefaultimewnd
 * @since windows5.1.2600
 */
export ImmGetDefaultIMEWnd(param0) {
    result := DllCall("IMM32.dll\ImmGetDefaultIMEWnd", HWND, param0, HWND)
    return result
}

/**
 * The ImmGetDescriptionA (ANSI) function (immdev.h) copies the description of the IME to the specified buffer.
 * @remarks
 * > [!NOTE]
 * > The immdev.h header defines ImmGetDescription as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKL} param0 
 * @param {PSTR} lpszDescription Pointer to a buffer in which the function retrieves the null-terminated string describing the IME.
 * @param {Integer} uBufLen Size, in characters, of the output buffer. The application sets this parameter to 0 if the function is to return the buffer size needed for the complete description, excluding the terminating null character.
 * 
 * <b>Windows NT, Windows 2000, Windows XP:</b> The size of the buffer is in Unicode characters, each consisting of two bytes. If the parameter is set to 0, the function returns the size of the buffer required in Unicode characters, excluding the Unicode terminating null character.
 * @returns {Integer} Returns the number of characters copied to the output buffer. If the application sets the <i>uBufLen</i> parameter to 0, the function returns the size of the buffer required to receive the description. Neither value includes the terminating null character. For Unicode, the function returns the number of Unicode characters, not including the Unicode terminating null character.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetdescriptiona
 * @since windows5.1.2600
 */
export ImmGetDescriptionA(param0, lpszDescription, uBufLen) {
    lpszDescription := lpszDescription is String ? StrPtr(lpszDescription) : lpszDescription

    result := DllCall("IMM32.dll\ImmGetDescriptionA", HKL, param0, "ptr", lpszDescription, "uint", uBufLen, UInt32)
    return result
}

/**
 * The ImmGetDescriptionW (Unicode) function (immdev.h) copies the description of the IME to the specified buffer.
 * @remarks
 * > [!NOTE]
 * > The immdev.h header defines ImmGetDescription as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKL} param0 
 * @param {PWSTR} lpszDescription Pointer to a buffer in which the function retrieves the null-terminated string describing the IME.
 * @param {Integer} uBufLen Size, in characters, of the output buffer. The application sets this parameter to 0 if the function is to return the buffer size needed for the complete description, excluding the terminating null character.
 * 
 * <b>Windows NT, Windows 2000, Windows XP:</b> The size of the buffer is in Unicode characters, each consisting of two bytes. If the parameter is set to 0, the function returns the size of the buffer required in Unicode characters, excluding the Unicode terminating null character.
 * @returns {Integer} Returns the number of characters copied to the output buffer. If the application sets the <i>uBufLen</i> parameter to 0, the function returns the size of the buffer required to receive the description. Neither value includes the terminating null character. For Unicode, the function returns the number of Unicode characters, not including the Unicode terminating null character.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetdescriptionw
 * @since windows5.1.2600
 */
export ImmGetDescriptionW(param0, lpszDescription, uBufLen) {
    lpszDescription := lpszDescription is String ? StrPtr(lpszDescription) : lpszDescription

    result := DllCall("IMM32.dll\ImmGetDescriptionW", HKL, param0, "ptr", lpszDescription, "uint", uBufLen, UInt32)
    return result
}

/**
 * The ImmGetIMEFileNameA (ANSI) function (immdev.h) retrieves the file name of the IME associated with the specified input locale.
 * @remarks
 * In the registry, the operating system stores the file name as the "IME name value" in the registry key HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Keyboard Layouts\HKL.
 *       
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The immdev.h header defines ImmGetIMEFileName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKL} param0 
 * @param {PSTR} lpszFileName Pointer to a buffer in which the function retrieves the file name. This parameter contains <b>NULL</b> when <i>uBufLen</i> is set to <b>NULL</b>.
 * @param {Integer} uBufLen Size, in bytes, of the output buffer. The application specifies 0 if the function is to return the buffer size needed to receive the file name, not including the terminating null character. For Unicode, <i>uBufLen</i> specifies the size in Unicode characters, not including the terminating null character.
 * @returns {Integer} Returns the number of bytes in the file name copied to the output buffer. If the application sets <i>uBufLen</i> to 0, the function returns the size of the buffer required for the file name. In either case, the terminating null character is not included.
 * 
 * For Unicode, the function returns the number of Unicode characters copied into the output buffer, not including the Unicode terminating null character.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetimefilenamea
 * @since windows5.1.2600
 */
export ImmGetIMEFileNameA(param0, lpszFileName, uBufLen) {
    lpszFileName := lpszFileName is String ? StrPtr(lpszFileName) : lpszFileName

    result := DllCall("IMM32.dll\ImmGetIMEFileNameA", HKL, param0, "ptr", lpszFileName, "uint", uBufLen, UInt32)
    return result
}

/**
 * The ImmGetIMEFileNameW (Unicode) function (immdev.h) retrieves the file name of the IME associated with the specified input locale.
 * @remarks
 * In the registry, the operating system stores the file name as the "IME name value" in the registry key HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Keyboard Layouts\HKL.
 *       
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The immdev.h header defines ImmGetIMEFileName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKL} param0 
 * @param {PWSTR} lpszFileName Pointer to a buffer in which the function retrieves the file name. This parameter contains <b>NULL</b> when <i>uBufLen</i> is set to <b>NULL</b>.
 * @param {Integer} uBufLen Size, in bytes, of the output buffer. The application specifies 0 if the function is to return the buffer size needed to receive the file name, not including the terminating null character. For Unicode, <i>uBufLen</i> specifies the size in Unicode characters, not including the terminating null character.
 * @returns {Integer} Returns the number of bytes in the file name copied to the output buffer. If the application sets <i>uBufLen</i> to 0, the function returns the size of the buffer required for the file name. In either case, the terminating null character is not included.
 * 
 * For Unicode, the function returns the number of Unicode characters copied into the output buffer, not including the Unicode terminating null character.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetimefilenamew
 * @since windows5.1.2600
 */
export ImmGetIMEFileNameW(param0, lpszFileName, uBufLen) {
    lpszFileName := lpszFileName is String ? StrPtr(lpszFileName) : lpszFileName

    result := DllCall("IMM32.dll\ImmGetIMEFileNameW", HKL, param0, "ptr", lpszFileName, "uint", uBufLen, UInt32)
    return result
}

/**
 * The ImmGetProperty function (immdev.h) retrieves the property and capabilities of the IME associated with the specified input locale.
 * @param {HKL} param0 
 * @param {Integer} param1 
 * @returns {Integer} Returns the property or capability value, depending on the value of the <i>dwIndex</i> parameter. If <i>dwIndex</i> is set to IGP_PROPERTY, the function returns one or more of the following values:
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td>IME_PROP_AT_CARET</td>
 * <td>If set, conversion window is at the caret position. If clear, the window is near the caret position.</td>
 * </tr>
 * <tr>
 * <td>IME_PROP_SPECIAL_UI</td>
 * <td>If set, the IME has a nonstandard user interface. The application should not draw in the IME window.</td>
 * </tr>
 * <tr>
 * <td>IME_PROP_CANDLIST_START_FROM_1</td>
 * <td>If set, strings in the candidate list are numbered starting at 1. If clear, strings start at 0.</td>
 * </tr>
 * <tr>
 * <td>IME_PROP_UNICODE</td>
 * <td>If set, the IME is viewed as a Unicode IME. The operating system and the IME communicate through the Unicode IME interface. If clear, the IME uses the ANSI interface to communicate with the operating system.</td>
 * </tr>
 * <tr>
 * <td>IME_PROP_COMPLETE_ON_UNSELECT</td>
 * <td>If set, the IME completes the composition string when the IME is deactivated. If clear, the IME cancels the composition string when the IME is deactivated, for example, from a keyboard layout change.</td>
 * </tr>
 * <tr>
 * <td>IME_PROP_ACCEPT_WIDE_VKEY</td>
 * <td>If set, the IME processes the injected Unicode that came from the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-sendinput">SendInput</a> function by using VK_PACKET. If clear, the IME might not process the injected Unicode, and might send the injected Unicode to the application directly.</td>
 * </tr>
 * </table>
 *  
 * 
 * If <i>dwIndex</i> is set to IGP_UI, the function returns one or more of the following values:
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td>UI_CAP_2700</td>
 * <td>Support text escapement values of 0 or 2700. For more information, see the <b>lfEscapement</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a> structure.</td>
 * </tr>
 * <tr>
 * <td>UI_CAP_ROT90</td>
 * <td>Support text escapement values of 0, 900, 1800, or 2700. For more information, see <b>lfEscapement</b>.</td>
 * </tr>
 * <tr>
 * <td>UI_CAP_ROTANY</td>
 * <td>Support any text escapement value. For more information, see <b>lfEscapement</b>.</td>
 * </tr>
 * </table>
 *  
 * 
 * If <i>dwIndex</i> is set to IGP_SETCOMPSTR, the function returns one or more of the following values:
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td>SCS_CAP_COMPSTR</td>
 * <td>Create the composition string by calling the <a href="https://docs.microsoft.com/windows/desktop/api/imm/nf-imm-immsetcompositionstringa">ImmSetCompositionString</a> function with the SCS_SETSTR value.</td>
 * </tr>
 * <tr>
 * <td>SCS_CAP_MAKEREAD</td>
 * <td>Create the reading string from corresponding composition string when using the <a href="https://docs.microsoft.com/windows/desktop/api/imm/nf-imm-immsetcompositionstringa">ImmSetCompositionString</a> function with SCS_SETSTR and without setting <i>lpRead</i>.</td>
 * </tr>
 * <tr>
 * <td>SCS_CAP_SETRECONVERTSTRING:</td>
 * <td>This IME can support reconversion. Use <a href="https://docs.microsoft.com/windows/desktop/api/imm/nf-imm-immsetcompositionstringa">ImmSetCompositionString</a> to do reconversion.</td>
 * </tr>
 * </table>
 *  
 * 
 * If <i>dwIndex</i> is set to IGP_SELECT, the function returns one or more of the following values:
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td>SELECT_CAP_CONVMODE</td>
 * <td>Inherit conversion mode when a new IME is selected.</td>
 * </tr>
 * <tr>
 * <td>SELECT_CAP_SENTENCE</td>
 * <td>Inherit sentence mode when a new IME is selected.</td>
 * </tr>
 * </table>
 *  
 * 
 * If <i>dwIndex</i> is set to IGP_GETIMEVERSION, the function returns one or more of the following values:
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td>IMEVER_0310</td>
 * <td>The IME was created for Windows 3.1.</td>
 * </tr>
 * <tr>
 * <td>IMEVER_0400</td>
 * <td>The IME was created for Windows Me/98/95.</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetproperty
 * @since windows5.1.2600
 */
export ImmGetProperty(param0, param1) {
    result := DllCall("IMM32.dll\ImmGetProperty", HKL, param0, "uint", param1, UInt32)
    return result
}

/**
 * The ImmIsIME function (immdev.h) determines if the specified input locale has an IME.
 * @param {HKL} param0 
 * @returns {BOOL} Returns a nonzero value if the specified locale has an IME, or 0 otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immisime
 * @since windows5.1.2600
 */
export ImmIsIME(param0) {
    result := DllCall("IMM32.dll\ImmIsIME", HKL, param0, BOOL)
    return result
}

/**
 * The ImmSimulateHotKey function (immdev.h) simulates the specified IME hot key, causing the same response as if the user presses the hot key in the specified window.
 * @param {HWND} param0 
 * @param {IME_HOTKEY_IDENTIFIER} param1 
 * @returns {BOOL} Returns a nonzero value if successful, or 0 otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immsimulatehotkey
 * @since windows5.1.2600
 */
export ImmSimulateHotKey(param0, param1) {
    result := DllCall("IMM32.dll\ImmSimulateHotKey", HWND, param0, IME_HOTKEY_IDENTIFIER, param1, BOOL)
    return result
}

/**
 * The ImmCreateContext function (immdev.h) creates a new input context, allocating memory for the context and initializing it.
 * @returns {HIMC} Returns the handle to the new input context if successful, or <b>NULL</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immcreatecontext
 * @since windows5.1.2600
 */
export ImmCreateContext() {
    result := DllCall("IMM32.dll\ImmCreateContext", HIMC.Owned)
    return result
}

/**
 * The ImmDestroyContext function (immdev.h) releases the input context and frees associated memory.
 * @remarks
 * Any application that creates an input context by using the <a href="https://docs.microsoft.com/windows/desktop/api/imm/nf-imm-immcreatecontext">ImmCreateContext</a> function must call this function to free the context before it terminates. However, before calling <b>ImmDestroyContext</b>, the application must remove the input context from any association with windows in the thread by using the <a href="https://docs.microsoft.com/windows/desktop/api/imm/nf-imm-immassociatecontext">ImmAssociateContext</a> function.
 * @param {HIMC} param0 
 * @returns {BOOL} Returns a nonzero value if successful, or 0 otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immdestroycontext
 * @since windows5.1.2600
 */
export ImmDestroyContext(param0) {
    result := DllCall("IMM32.dll\ImmDestroyContext", HIMC, param0, BOOL)
    return result
}

/**
 * The ImmGetContext function (immdev.h) returns the input context associated with the specified window.
 * @remarks
 * An application should routinely use this function to retrieve the current input context before attempting to access information in the context.
 * 
 * The application must call <a href="https://docs.microsoft.com/windows/desktop/api/imm/nf-imm-immreleasecontext">ImmReleaseContext</a> when it is finished with the input context.
 * @param {HWND} param0 
 * @returns {HIMC} Returns the handle to the input context.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetcontext
 * @since windows5.1.2600
 */
export ImmGetContext(param0) {
    result := DllCall("IMM32.dll\ImmGetContext", HWND, param0, HIMC.Owned)
    return result
}

/**
 * The ImmReleaseContext function (immdev.h) releases the input context and unlocks the memory associated in the input context.
 * @param {HWND} param0 
 * @param {HIMC} param1 
 * @returns {BOOL} Returns a nonzero value if successful, or 0 otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immreleasecontext
 * @since windows5.1.2600
 */
export ImmReleaseContext(param0, param1) {
    result := DllCall("IMM32.dll\ImmReleaseContext", HWND, param0, HIMC, param1, BOOL)
    return result
}

/**
 * The ImmAssociateContext function (immdev.h) associates the specified input context with the specified window.
 * @remarks
 * When associating an input context with a window, an application must remove the association before destroying the input context. One way to do this is to save the handle and reassociate it to the default input context with the window.
 * @param {HWND} param0 
 * @param {HIMC} param1 
 * @returns {HIMC} Returns the handle to the input context previously associated with the window.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immassociatecontext
 * @since windows5.1.2600
 */
export ImmAssociateContext(param0, param1) {
    result := DllCall("IMM32.dll\ImmAssociateContext", HWND, param0, HIMC, param1, HIMC.Owned)
    return result
}

/**
 * The ImmAssociateContextEx function (immdev.h) changes the association between the input method context and the specified window or its children.
 * @remarks
 * If the application calls this function with IACE_CHILDREN, the operating system associates the specified input method context with child windows of the window indicated by <i>hWnd</i>. It associates the input method context only with child windows of the thread that creates <i>hWnd</i>. Any child window that is created after this function has been called will not be affected. Instead, the default input method context will be associated with it.
 * 
 * If the application calls this function with IACE_DEFAULT, the operating system restores the default input method context for the window. In this case, the <i>hIMC</i> parameter is ignored.
 * @param {HWND} param0 
 * @param {HIMC} param1 
 * @param {Integer} param2 
 * @returns {BOOL} Returns <b>TRUE</b> if successful or <b>FALSE</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immassociatecontextex
 * @since windows5.1.2600
 */
export ImmAssociateContextEx(param0, param1, param2) {
    result := DllCall("IMM32.dll\ImmAssociateContextEx", HWND, param0, HIMC, param1, "uint", param2, BOOL)
    return result
}

/**
 * The ImmGetCompositionStringA (ANSI) function (immdev.h) retrieves information about the composition string.
 * @remarks
 * An application calls this function in response to the <a href="https://docs.microsoft.com/windows/desktop/Intl/wm-ime-composition">WM_IME_COMPOSITION</a> or <a href="https://docs.microsoft.com/windows/desktop/Intl/wm-ime-startcomposition">WM_IME_STARTCOMPOSITION</a> message. The IMM removes the information when the application calls the <a href="https://docs.microsoft.com/windows/desktop/api/imm/nf-imm-immreleasecontext">ImmReleaseContext</a> function.
 * 
 * <div class="alert"><b>Note</b>  You must write code to handle both full-width Hiragana and half-width Katakana if your application is used with the Soft Input Panel (SIP).</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The immdev.h header defines ImmGetCompositionString as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HIMC} param0 
 * @param {IME_COMPOSITION_STRING} param1 
 * @param {Integer} lpBuf Pointer to a buffer in which the function retrieves the composition string information.
 * @param {Integer} dwBufLen Size, in bytes, of the output buffer, even if the output is a Unicode string. The application sets this parameter to 0 if the function is to return the size of the required output buffer.
 * @returns {Integer} Returns the number of bytes copied to the output buffer. If <i>dwBufLen</i> is set to 0, the function returns the buffer size, in bytes, required to receive all requested information, excluding the terminating null character. The return value is always the size, in bytes, even if the requested data is a Unicode string.
 * 
 * This function returns one of the following negative error codes if it does not succeed:
 * 
 * 
 * <ul>
 * <li>IMM_ERROR_NODATA. Composition data is not ready in the input context.</li>
 * <li>IMM_ERROR_GENERAL. General error detected by IME.</li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetcompositionstringa
 * @since windows5.1.2600
 */
export ImmGetCompositionStringA(param0, param1, lpBuf, dwBufLen) {
    result := DllCall("IMM32.dll\ImmGetCompositionStringA", HIMC, param0, IME_COMPOSITION_STRING, param1, "ptr", lpBuf, "uint", dwBufLen, Int32)
    return result
}

/**
 * The ImmGetCompositionStringW (Unicode) function (immdev.h) retrieves information about the composition string.
 * @remarks
 * An application calls this function in response to the <a href="https://docs.microsoft.com/windows/desktop/Intl/wm-ime-composition">WM_IME_COMPOSITION</a> or <a href="https://docs.microsoft.com/windows/desktop/Intl/wm-ime-startcomposition">WM_IME_STARTCOMPOSITION</a> message. The IMM removes the information when the application calls the <a href="https://docs.microsoft.com/windows/desktop/api/imm/nf-imm-immreleasecontext">ImmReleaseContext</a> function.
 * 
 * <div class="alert"><b>Note</b>  You must write code to handle both full-width Hiragana and half-width Katakana if your application is used with the Soft Input Panel (SIP).</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The immdev.h header defines ImmGetCompositionString as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HIMC} param0 
 * @param {IME_COMPOSITION_STRING} param1 
 * @param {Integer} lpBuf Pointer to a buffer in which the function retrieves the composition string information.
 * @param {Integer} dwBufLen Size, in bytes, of the output buffer, even if the output is a Unicode string. The application sets this parameter to 0 if the function is to return the size of the required output buffer.
 * @returns {Integer} Returns the number of bytes copied to the output buffer. If <i>dwBufLen</i> is set to 0, the function returns the buffer size, in bytes, required to receive all requested information, excluding the terminating null character. The return value is always the size, in bytes, even if the requested data is a Unicode string.
 * 
 * This function returns one of the following negative error codes if it does not succeed:
 * 
 * 
 * <ul>
 * <li>IMM_ERROR_NODATA. Composition data is not ready in the input context.</li>
 * <li>IMM_ERROR_GENERAL. General error detected by IME.</li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetcompositionstringw
 * @since windows5.1.2600
 */
export ImmGetCompositionStringW(param0, param1, lpBuf, dwBufLen) {
    result := DllCall("IMM32.dll\ImmGetCompositionStringW", HIMC, param0, IME_COMPOSITION_STRING, param1, "ptr", lpBuf, "uint", dwBufLen, Int32)
    return result
}

/**
 * The ImmSetCompositionStringA (ANSI) function (immdev.h) sets the characters, attributes, and clauses of the composition and reading strings.
 * @remarks
 * The application can set <i>lpComp</i>, <i>lpRead</i>, or both. If the application does not specify a value for <i>lpComp</i>, it must set this parameter to <b>NULL</b> and set <i>dwCompLen</i> to 0.
 * 
 * When the application is changing attributes, all characters in a clause must have the same attribute. Converted characters must have the attribute ATTR_CONVERTED or ATTR_TARGET_CONVERTED. Unconverted characters must have the attribute ATTR_INPUT or ATTR_TARGET_NOTCONVERTED.
 * 
 * When the application is changing clause information, it can change only the target clause, just affecting one boundary at a time. The target clause has the attribute ATTR_TARGET_CONVERTED or ATTR_TARGET_NOTCONVERTED.
 * 
 * For additional information about attributes (ATTR_* values), see <a href="https://docs.microsoft.com/windows/desktop/Intl/composition-string">Composition String</a>.
 * 
 * When the IME completes the changes, it sends a <a href="https://docs.microsoft.com/windows/desktop/Intl/wm-ime-composition">WM_IME_COMPOSITION</a> message to the application to notify it of the changes.
 * 
 * <b>Windows Me/98, Windows 2000, Windows XP:</b> The SCS_*CONVERTSTRING values are used for reconversion. They can only be used for an IME that has the SCS_CAP_SETRECONVERTSTRING property. The application uses these values as follows:
 * 
 * <ol>
 * <li>Call <b>ImmSetCompositionString</b> with SCS_QUERYRECONVERTSTRING, so that IME adjusts the <a href="https://docs.microsoft.com/windows/desktop/api/imm/ns-imm-reconvertstring">RECONVERTSTRING</a> structure for the reconversion.</li>
 * <li>Call <b>ImmSetCompositionString</b> with SCS_SETRECONVERTSTRING, so that IME generates a new composition string. After this, <i>lpComp</i> and <i>lpRead</i> indicate a <a href="https://docs.microsoft.com/windows/desktop/api/imm/ns-imm-reconvertstring">RECONVERTSTRING</a> structure that contains the updated composition and reading string. Use the value of <i>lpRead</i> only when the selected IME has SCS_CAP_MAKEREAD set.</li>
 * </ol>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The immdev.h header defines ImmSetCompositionString as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HIMC} param0 
 * @param {SET_COMPOSITION_STRING_TYPE} dwIndex 
 * @param {Integer} lpComp Pointer to a buffer containing the information to set for the composition string, as specified by the value of <i>dwIndex</i>.
 * @param {Integer} dwCompLen Size, in bytes, of the information buffer for the composition string, even if SCS_SETSTR is specified and the buffer contains a Unicode string.
 * @param {Integer} lpRead Pointer to a buffer containing the information to set for the reading string, as specified by the value of <i>dwIndex</i>. The application can set this parameter to <b>NULL</b>.
 * @param {Integer} dwReadLen Size, in bytes, of the information buffer for the reading string, even if SCS_SETSTR is specified and the buffer contains a Unicode string.
 * @returns {BOOL} Returns a nonzero value if successful, or 0 otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immsetcompositionstringa
 * @since windows5.1.2600
 */
export ImmSetCompositionStringA(param0, dwIndex, lpComp, dwCompLen, lpRead, dwReadLen) {
    result := DllCall("IMM32.dll\ImmSetCompositionStringA", HIMC, param0, SET_COMPOSITION_STRING_TYPE, dwIndex, "ptr", lpComp, "uint", dwCompLen, "ptr", lpRead, "uint", dwReadLen, BOOL)
    return result
}

/**
 * The ImmSetCompositionStringW (Unicode) function (immdev.h) sets the characters, attributes, and clauses of the composition and reading strings.
 * @remarks
 * The application can set <i>lpComp</i>, <i>lpRead</i>, or both. If the application does not specify a value for <i>lpComp</i>, it must set this parameter to <b>NULL</b> and set <i>dwCompLen</i> to 0.
 * 
 * When the application is changing attributes, all characters in a clause must have the same attribute. Converted characters must have the attribute ATTR_CONVERTED or ATTR_TARGET_CONVERTED. Unconverted characters must have the attribute ATTR_INPUT or ATTR_TARGET_NOTCONVERTED.
 * 
 * When the application is changing clause information, it can change only the target clause, just affecting one boundary at a time. The target clause has the attribute ATTR_TARGET_CONVERTED or ATTR_TARGET_NOTCONVERTED.
 * 
 * For additional information about attributes (ATTR_* values), see <a href="https://docs.microsoft.com/windows/desktop/Intl/composition-string">Composition String</a>.
 * 
 * When the IME completes the changes, it sends a <a href="https://docs.microsoft.com/windows/desktop/Intl/wm-ime-composition">WM_IME_COMPOSITION</a> message to the application to notify it of the changes.
 * 
 * <b>Windows Me/98, Windows 2000, Windows XP:</b> The SCS_*CONVERTSTRING values are used for reconversion. They can only be used for an IME that has the SCS_CAP_SETRECONVERTSTRING property. The application uses these values as follows:
 * 
 * <ol>
 * <li>Call <b>ImmSetCompositionString</b> with SCS_QUERYRECONVERTSTRING, so that IME adjusts the <a href="https://docs.microsoft.com/windows/desktop/api/imm/ns-imm-reconvertstring">RECONVERTSTRING</a> structure for the reconversion.</li>
 * <li>Call <b>ImmSetCompositionString</b> with SCS_SETRECONVERTSTRING, so that IME generates a new composition string. After this, <i>lpComp</i> and <i>lpRead</i> indicate a <a href="https://docs.microsoft.com/windows/desktop/api/imm/ns-imm-reconvertstring">RECONVERTSTRING</a> structure that contains the updated composition and reading string. Use the value of <i>lpRead</i> only when the selected IME has SCS_CAP_MAKEREAD set.</li>
 * </ol>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The immdev.h header defines ImmSetCompositionString as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HIMC} param0 
 * @param {SET_COMPOSITION_STRING_TYPE} dwIndex 
 * @param {Integer} lpComp Pointer to a buffer containing the information to set for the composition string, as specified by the value of <i>dwIndex</i>.
 * @param {Integer} dwCompLen Size, in bytes, of the information buffer for the composition string, even if SCS_SETSTR is specified and the buffer contains a Unicode string.
 * @param {Integer} lpRead Pointer to a buffer containing the information to set for the reading string, as specified by the value of <i>dwIndex</i>. The application can set this parameter to <b>NULL</b>.
 * @param {Integer} dwReadLen Size, in bytes, of the information buffer for the reading string, even if SCS_SETSTR is specified and the buffer contains a Unicode string.
 * @returns {BOOL} Returns a nonzero value if successful, or 0 otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immsetcompositionstringw
 * @since windows5.1.2600
 */
export ImmSetCompositionStringW(param0, dwIndex, lpComp, dwCompLen, lpRead, dwReadLen) {
    result := DllCall("IMM32.dll\ImmSetCompositionStringW", HIMC, param0, SET_COMPOSITION_STRING_TYPE, dwIndex, "ptr", lpComp, "uint", dwCompLen, "ptr", lpRead, "uint", dwReadLen, BOOL)
    return result
}

/**
 * The ImmGetCandidateListCountA (ANSI) function (immdev.h) retrieves the size of the candidate lists.
 * @remarks
 * Applications typically call this function in response to an <a href="https://docs.microsoft.com/windows/desktop/Intl/imn-opencandidate">IMN_OPENCANDIDATE</a> or <a href="https://docs.microsoft.com/windows/desktop/Intl/imn-changecandidate">IMN_CHANGECANDIDATE</a> command.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The immdev.h header defines ImmGetCandidateListCount as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HIMC} param0 
 * @param {Pointer<Integer>} lpdwListCount Pointer to the buffer in which this function retrieves the size of the candidate lists.
 * @returns {Integer} Returns the number of bytes required for all candidate lists if successful, or 0 otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetcandidatelistcounta
 * @since windows5.1.2600
 */
export ImmGetCandidateListCountA(param0, lpdwListCount) {
    lpdwListCountMarshal := lpdwListCount is VarRef ? "uint*" : "ptr"

    result := DllCall("IMM32.dll\ImmGetCandidateListCountA", HIMC, param0, lpdwListCountMarshal, lpdwListCount, UInt32)
    return result
}

/**
 * The ImmGetCandidateListCountW (Unicode) function (immdev.h) retrieves the size of the candidate lists.
 * @remarks
 * Applications typically call this function in response to an <a href="https://docs.microsoft.com/windows/desktop/Intl/imn-opencandidate">IMN_OPENCANDIDATE</a> or <a href="https://docs.microsoft.com/windows/desktop/Intl/imn-changecandidate">IMN_CHANGECANDIDATE</a> command.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The immdev.h header defines ImmGetCandidateListCount as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HIMC} param0 
 * @param {Pointer<Integer>} lpdwListCount Pointer to the buffer in which this function retrieves the size of the candidate lists.
 * @returns {Integer} Returns the number of bytes required for all candidate lists if successful, or 0 otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetcandidatelistcountw
 * @since windows5.1.2600
 */
export ImmGetCandidateListCountW(param0, lpdwListCount) {
    lpdwListCountMarshal := lpdwListCount is VarRef ? "uint*" : "ptr"

    result := DllCall("IMM32.dll\ImmGetCandidateListCountW", HIMC, param0, lpdwListCountMarshal, lpdwListCount, UInt32)
    return result
}

/**
 * The ImmGetCandidateListA (ANSI) function (immdev.h) retrieves a candidate list.
 * @remarks
 * > [!NOTE]
 * > The immdev.h header defines ImmGetCandidateList as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HIMC} param0 
 * @param {Integer} deIndex Zero-based index of the candidate list.
 * @param {Integer} lpCandList Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/imm/ns-imm-candidatelist">CANDIDATELIST</a> structure in which the function retrieves the candidate list.
 * @param {Integer} dwBufLen Size, in bytes, of the buffer to receive the candidate list. The application can specify 0 for this parameter if the function is to return the required size of the output buffer only.
 * @returns {Integer} Returns the number of bytes copied to the candidate list buffer if successful. If the application has supplied 0 for the <i>dwBufLen</i> parameter, the function returns the size required for the candidate list buffer.
 * 
 * The function returns 0 if it does not succeed.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetcandidatelista
 * @since windows5.1.2600
 */
export ImmGetCandidateListA(param0, deIndex, lpCandList, dwBufLen) {
    result := DllCall("IMM32.dll\ImmGetCandidateListA", HIMC, param0, "uint", deIndex, "ptr", lpCandList, "uint", dwBufLen, UInt32)
    return result
}

/**
 * The ImmGetCandidateListW (Unicode) function (immdev.h) retrieves a candidate list.
 * @remarks
 * > [!NOTE]
 * > The immdev.h header defines ImmGetCandidateList as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HIMC} param0 
 * @param {Integer} deIndex Zero-based index of the candidate list.
 * @param {Integer} lpCandList Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/imm/ns-imm-candidatelist">CANDIDATELIST</a> structure in which the function retrieves the candidate list.
 * @param {Integer} dwBufLen Size, in bytes, of the buffer to receive the candidate list. The application can specify 0 for this parameter if the function is to return the required size of the output buffer only.
 * @returns {Integer} Returns the number of bytes copied to the candidate list buffer if successful. If the application has supplied 0 for the <i>dwBufLen</i> parameter, the function returns the size required for the candidate list buffer.
 * 
 * The function returns 0 if it does not succeed.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetcandidatelistw
 * @since windows5.1.2600
 */
export ImmGetCandidateListW(param0, deIndex, lpCandList, dwBufLen) {
    result := DllCall("IMM32.dll\ImmGetCandidateListW", HIMC, param0, "uint", deIndex, "ptr", lpCandList, "uint", dwBufLen, UInt32)
    return result
}

/**
 * The ImmGetGuideLineA (ANSI) function (immdev.h) retrieves information about errors. Applications use the information for user notifications.
 * @remarks
 * Applications typically call this function after receiving an <a href="https://docs.microsoft.com/windows/desktop/Intl/imn-guideline">IMN_GUIDELINE</a> command.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The immdev.h header defines ImmGetGuideLine as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HIMC} param0 
 * @param {GET_GUIDE_LINE_TYPE} dwIndex 
 * @param {Integer} lpBuf Pointer to a buffer in which the function retrieves the error message string. This parameter contains <b>NULL</b> if <i>dwIndex</i> is not GGL_STRING or GGL_PRIVATE or if <i>dwBufLen</i> is set to 0.
 * @param {Integer} dwBufLen Size, in bytes, of the output buffer. The application sets this parameter to 0 if the function is to return the buffer size needed to receive the error message string, not including the terminating null character.
 * @returns {Integer} Returns an error level, an error index, or the size of an error message string, depending on the value of the <i>dwIndex</i> parameter. If <i>dwIndex</i> is GGL_LEVEL, the return is one of the following values.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td>GL_LEVEL_ERROR</td>
 * <td>Error. The IME might not be able to continue.</td>
 * </tr>
 * <tr>
 * <td>GL_LEVEL_FATAL</td>
 * <td>Fatal error. The IME cannot continue, and data might be lost.</td>
 * </tr>
 * <tr>
 * <td>GL_LEVEL_INFORMATION</td>
 * <td>No error. Information is available for the user.</td>
 * </tr>
 * <tr>
 * <td>GL_LEVEL_NOGUIDELINE</td>
 * <td>No error. Remove previous error message if still visible.</td>
 * </tr>
 * <tr>
 * <td>GL_LEVEL_WARNING</td>
 * <td>Unexpected input or other result. The user should be warned, but the IME can continue.</td>
 * </tr>
 * </table>
 *  
 * 
 * If <i>dwIndex</i> is GGL_INDEX, the return value is one of the following values.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td>GL_ID_CANNOTSAVE</td>
 * <td>The dictionary or the statistics data cannot be saved.</td>
 * </tr>
 * <tr>
 * <td>GL_ID_NOCONVERT</td>
 * <td>The IME cannot convert any more.</td>
 * </tr>
 * <tr>
 * <td>GL_ID_NODICTIONARY</td>
 * <td>The IME cannot find the dictionary, or the dictionary has an unexpected format.</td>
 * </tr>
 * <tr>
 * <td>GL_ID_NOMODULE</td>
 * <td>The IME cannot find the module that is needed.</td>
 * </tr>
 * <tr>
 * <td>GL_ID_READINGCONFLICT</td>
 * <td>A reading conflict occurred. For example, some vowels cannot be put together to form one character.</td>
 * </tr>
 * <tr>
 * <td>GL_ID_TOOMANYSTROKE</td>
 * <td>There are too many strokes for one character or one clause.</td>
 * </tr>
 * <tr>
 * <td>GL_ID_TYPINGERROR</td>
 * <td>Typing error. The IME cannot handle this typing.</td>
 * </tr>
 * <tr>
 * <td>GL_ID_UNKNOWN</td>
 * <td>Unknown error. Refer to the error message string.</td>
 * </tr>
 * <tr>
 * <td>GL_ID_INPUTREADING</td>
 * <td>The IME is accepting reading character input from the end user.</td>
 * </tr>
 * <tr>
 * <td>GL_ID_INPUTRADICAL</td>
 * <td>The IME is accepting radical character input from the end user.</td>
 * </tr>
 * <tr>
 * <td>GL_ID_INPUTCODE</td>
 * <td>The IME is accepting character code input from the end user.</td>
 * </tr>
 * <tr>
 * <td>GL_ID_CHOOSECANDIDATE</td>
 * <td>The IME is accepting candidate string selection from the end user.</td>
 * </tr>
 * <tr>
 * <td>GL_ID_REVERSECONVERSION</td>
 * <td>Information about reverse conversion is available by calling <b>ImmGetGuideLine</b>, specifying GGL_PRIVATE. The information retrieved is in <a href="https://docs.microsoft.com/windows/desktop/api/imm/ns-imm-candidatelist">CANDIDATELIST</a> format.</td>
 * </tr>
 * </table>
 *  
 * 
 * If <i>dwIndex</i> is GGL_STRING, the return value is the number of bytes of the string copied to the buffer. However, if <i>dwBufLen</i> is 0, the return value is the buffer size needed to receive the string, not including the terminating null character. For Unicode, if <i>dwBufLen</i> is 0, the return value is the size, in bytes not including the Unicode terminating null character.
 * 
 * If <i>dwIndex</i> is GGL_PRIVATE, the return value is the number of bytes of information copied to the buffer. If <i>dwIndex</i> is GGL_PRIVATE and <i>dwBufLen</i> is 0, the return value is the buffer size needed to receive the information.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetguidelinea
 * @since windows5.1.2600
 */
export ImmGetGuideLineA(param0, dwIndex, lpBuf, dwBufLen) {
    result := DllCall("IMM32.dll\ImmGetGuideLineA", HIMC, param0, GET_GUIDE_LINE_TYPE, dwIndex, "ptr", lpBuf, "uint", dwBufLen, UInt32)
    return result
}

/**
 * The ImmGetGuideLineW (Unicode) function (immdev.h) retrieves information about errors. Applications use the information for user notifications.
 * @remarks
 * Applications typically call this function after receiving an <a href="https://docs.microsoft.com/windows/desktop/Intl/imn-guideline">IMN_GUIDELINE</a> command.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The immdev.h header defines ImmGetGuideLine as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HIMC} param0 
 * @param {GET_GUIDE_LINE_TYPE} dwIndex 
 * @param {Integer} lpBuf Pointer to a buffer in which the function retrieves the error message string. This parameter contains <b>NULL</b> if <i>dwIndex</i> is not GGL_STRING or GGL_PRIVATE or if <i>dwBufLen</i> is set to 0.
 * @param {Integer} dwBufLen Size, in bytes, of the output buffer. The application sets this parameter to 0 if the function is to return the buffer size needed to receive the error message string, not including the terminating null character.
 * @returns {Integer} Returns an error level, an error index, or the size of an error message string, depending on the value of the <i>dwIndex</i> parameter. If <i>dwIndex</i> is GGL_LEVEL, the return is one of the following values.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td>GL_LEVEL_ERROR</td>
 * <td>Error. The IME might not be able to continue.</td>
 * </tr>
 * <tr>
 * <td>GL_LEVEL_FATAL</td>
 * <td>Fatal error. The IME cannot continue, and data might be lost.</td>
 * </tr>
 * <tr>
 * <td>GL_LEVEL_INFORMATION</td>
 * <td>No error. Information is available for the user.</td>
 * </tr>
 * <tr>
 * <td>GL_LEVEL_NOGUIDELINE</td>
 * <td>No error. Remove previous error message if still visible.</td>
 * </tr>
 * <tr>
 * <td>GL_LEVEL_WARNING</td>
 * <td>Unexpected input or other result. The user should be warned, but the IME can continue.</td>
 * </tr>
 * </table>
 *  
 * 
 * If <i>dwIndex</i> is GGL_INDEX, the return value is one of the following values.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td>GL_ID_CANNOTSAVE</td>
 * <td>The dictionary or the statistics data cannot be saved.</td>
 * </tr>
 * <tr>
 * <td>GL_ID_NOCONVERT</td>
 * <td>The IME cannot convert any more.</td>
 * </tr>
 * <tr>
 * <td>GL_ID_NODICTIONARY</td>
 * <td>The IME cannot find the dictionary, or the dictionary has an unexpected format.</td>
 * </tr>
 * <tr>
 * <td>GL_ID_NOMODULE</td>
 * <td>The IME cannot find the module that is needed.</td>
 * </tr>
 * <tr>
 * <td>GL_ID_READINGCONFLICT</td>
 * <td>A reading conflict occurred. For example, some vowels cannot be put together to form one character.</td>
 * </tr>
 * <tr>
 * <td>GL_ID_TOOMANYSTROKE</td>
 * <td>There are too many strokes for one character or one clause.</td>
 * </tr>
 * <tr>
 * <td>GL_ID_TYPINGERROR</td>
 * <td>Typing error. The IME cannot handle this typing.</td>
 * </tr>
 * <tr>
 * <td>GL_ID_UNKNOWN</td>
 * <td>Unknown error. Refer to the error message string.</td>
 * </tr>
 * <tr>
 * <td>GL_ID_INPUTREADING</td>
 * <td>The IME is accepting reading character input from the end user.</td>
 * </tr>
 * <tr>
 * <td>GL_ID_INPUTRADICAL</td>
 * <td>The IME is accepting radical character input from the end user.</td>
 * </tr>
 * <tr>
 * <td>GL_ID_INPUTCODE</td>
 * <td>The IME is accepting character code input from the end user.</td>
 * </tr>
 * <tr>
 * <td>GL_ID_CHOOSECANDIDATE</td>
 * <td>The IME is accepting candidate string selection from the end user.</td>
 * </tr>
 * <tr>
 * <td>GL_ID_REVERSECONVERSION</td>
 * <td>Information about reverse conversion is available by calling <b>ImmGetGuideLine</b>, specifying GGL_PRIVATE. The information retrieved is in <a href="https://docs.microsoft.com/windows/desktop/api/imm/ns-imm-candidatelist">CANDIDATELIST</a> format.</td>
 * </tr>
 * </table>
 *  
 * 
 * If <i>dwIndex</i> is GGL_STRING, the return value is the number of bytes of the string copied to the buffer. However, if <i>dwBufLen</i> is 0, the return value is the buffer size needed to receive the string, not including the terminating null character. For Unicode, if <i>dwBufLen</i> is 0, the return value is the size, in bytes not including the Unicode terminating null character.
 * 
 * If <i>dwIndex</i> is GGL_PRIVATE, the return value is the number of bytes of information copied to the buffer. If <i>dwIndex</i> is GGL_PRIVATE and <i>dwBufLen</i> is 0, the return value is the buffer size needed to receive the information.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetguidelinew
 * @since windows5.1.2600
 */
export ImmGetGuideLineW(param0, dwIndex, lpBuf, dwBufLen) {
    result := DllCall("IMM32.dll\ImmGetGuideLineW", HIMC, param0, GET_GUIDE_LINE_TYPE, dwIndex, "ptr", lpBuf, "uint", dwBufLen, UInt32)
    return result
}

/**
 * The ImmGetConversionStatus function (immdev.h) retrieves the current conversion status.
 * @remarks
 * Conversion and sentence mode values are set only if the IME supports those modes.
 * @param {HIMC} param0 
 * @param {Pointer<IME_CONVERSION_MODE>} lpfdwConversion Pointer to a variable in which the function retrieves a combination of conversion mode values. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Intl/ime-conversion-mode-values">IME Conversion Mode Values</a>.
 * @param {Pointer<IME_SENTENCE_MODE>} lpfdwSentence Pointer to a variable in which the function retrieves a sentence mode value. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Intl/ime-sentence-mode-values">IME Sentence Mode Values</a>.
 * @returns {BOOL} Returns a nonzero value if successful, or 0 otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetconversionstatus
 * @since windows5.1.2600
 */
export ImmGetConversionStatus(param0, lpfdwConversion, lpfdwSentence) {
    lpfdwConversionMarshal := lpfdwConversion is VarRef ? "uint*" : "ptr"
    lpfdwSentenceMarshal := lpfdwSentence is VarRef ? "uint*" : "ptr"

    result := DllCall("IMM32.dll\ImmGetConversionStatus", HIMC, param0, lpfdwConversionMarshal, lpfdwConversion, lpfdwSentenceMarshal, lpfdwSentence, BOOL)
    return result
}

/**
 * The ImmSetConversionStatus function (immdev.h) sets the current conversion status.
 * @remarks
 * This function sends the <a href="https://docs.microsoft.com/windows/desktop/Intl/imn-setconversionmode">IMN_SETCONVERSIONMODE</a> and <a href="https://docs.microsoft.com/windows/desktop/Intl/imn-setsentencemode">IMN_SETSENTENCEMODE</a> commands to the application.
 * 
 * <div class="alert"><b>Note</b>  <b>Beginning with Windows 8:</b> By default, the input switch is set per user instead of per thread. 
 * The Microsoft IME (Japanese) respects the mode globally, and therefore  <b>ImmSetConversionStatus</b> fails when getting focus.</div>
 * <div> </div>
 * @param {HIMC} param0 
 * @param {IME_CONVERSION_MODE} param1 
 * @param {IME_SENTENCE_MODE} param2 
 * @returns {BOOL} Returns a nonzero value if successful, or 0 otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immsetconversionstatus
 * @since windows5.1.2600
 */
export ImmSetConversionStatus(param0, param1, param2) {
    result := DllCall("IMM32.dll\ImmSetConversionStatus", HIMC, param0, IME_CONVERSION_MODE, param1, IME_SENTENCE_MODE, param2, BOOL)
    return result
}

/**
 * The ImmGetOpenStatus function (immdev.h) determines whether the IME is open or closed.
 * @param {HIMC} param0 
 * @returns {BOOL} Returns a nonzero value if the IME is open, or 0 otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetopenstatus
 * @since windows5.1.2600
 */
export ImmGetOpenStatus(param0) {
    result := DllCall("IMM32.dll\ImmGetOpenStatus", HIMC, param0, BOOL)
    return result
}

/**
 * The ImmSetOpenStatus function (immdev.h) opens or closes the IME.
 * @remarks
 * This function causes an <a href="https://docs.microsoft.com/windows/desktop/Intl/imn-setopenstatus">IMN_SETOPENSTATUS</a> command to be sent to the application.
 * @param {HIMC} param0 
 * @param {BOOL} param1 
 * @returns {BOOL} Returns a nonzero value if successful, or 0 otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immsetopenstatus
 * @since windows5.1.2600
 */
export ImmSetOpenStatus(param0, param1) {
    result := DllCall("IMM32.dll\ImmSetOpenStatus", HIMC, param0, BOOL, param1, BOOL)
    return result
}

/**
 * The ImmGetCompositionFontA (ANSI) function (immdev.h) retrieves information about the logical font currently used to display characters in the composition window.
 * @remarks
 * > [!NOTE]
 * > The immdev.h header defines ImmGetCompositionFont as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HIMC} param0 
 * @param {Pointer<LOGFONTA>} lplf Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a> structure in which this function retrieves the font information.
 * @returns {BOOL} Returns a nonzero value if successful, or 0 otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetcompositionfonta
 * @since windows5.1.2600
 */
export ImmGetCompositionFontA(param0, lplf) {
    result := DllCall("IMM32.dll\ImmGetCompositionFontA", HIMC, param0, LOGFONTA.Ptr, lplf, BOOL)
    return result
}

/**
 * The ImmGetCompositionFontW (Unicode) function (immdev.h) retrieves information about the logical font currently used to display characters in the composition window.
 * @remarks
 * > [!NOTE]
 * > The immdev.h header defines ImmGetCompositionFont as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HIMC} param0 
 * @param {Pointer<LOGFONTW>} lplf Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a> structure in which this function retrieves the font information.
 * @returns {BOOL} Returns a nonzero value if successful, or 0 otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetcompositionfontw
 * @since windows5.1.2600
 */
export ImmGetCompositionFontW(param0, lplf) {
    result := DllCall("IMM32.dll\ImmGetCompositionFontW", HIMC, param0, LOGFONTW.Ptr, lplf, BOOL)
    return result
}

/**
 * The ImmSetCompositionFontA (ANSI) function (immdev.h) sets the logical font to use to display characters in the composition window.
 * @remarks
 * This function causes a <a href="https://docs.microsoft.com/windows/desktop/Intl/imn-setcompositionfont">IMN_SETCOMPOSITIONFONT</a> command to be sent to an application. Even if the application never uses the composition window, it must set the appropriate font to ensure that characters are displayed properly. This is especially true for vertical writing.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The immdev.h header defines ImmSetCompositionFont as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HIMC} param0 
 * @param {Pointer<LOGFONTA>} lplf Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a> structure containing the font information to set.
 * @returns {BOOL} Returns a nonzero value if successful, or 0 otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immsetcompositionfonta
 * @since windows5.1.2600
 */
export ImmSetCompositionFontA(param0, lplf) {
    result := DllCall("IMM32.dll\ImmSetCompositionFontA", HIMC, param0, LOGFONTA.Ptr, lplf, BOOL)
    return result
}

/**
 * The ImmSetCompositionFontW (Unicode) function (immdev.h) sets the logical font to use to display characters in the composition window.
 * @remarks
 * This function causes a <a href="https://docs.microsoft.com/windows/desktop/Intl/imn-setcompositionfont">IMN_SETCOMPOSITIONFONT</a> command to be sent to an application. Even if the application never uses the composition window, it must set the appropriate font to ensure that characters are displayed properly. This is especially true for vertical writing.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The immdev.h header defines ImmSetCompositionFont as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HIMC} param0 
 * @param {Pointer<LOGFONTW>} lplf Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a> structure containing the font information to set.
 * @returns {BOOL} Returns a nonzero value if successful, or 0 otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immsetcompositionfontw
 * @since windows5.1.2600
 */
export ImmSetCompositionFontW(param0, lplf) {
    result := DllCall("IMM32.dll\ImmSetCompositionFontW", HIMC, param0, LOGFONTW.Ptr, lplf, BOOL)
    return result
}

/**
 * The ImmConfigureIMEA (ANSI) function (immdev.h) displays the configuration dialog box for the IME of the specified input locale identifier.
 * @remarks
 * > [!NOTE]
 * > The immdev.h header defines ImmConfigureIME as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKL} param0 
 * @param {HWND} param1 
 * @param {Integer} param2 
 * @param {Pointer<Void>} param3 
 * @returns {BOOL} Returns a nonzero value if successful, or 0 otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immconfigureimea
 * @since windows5.1.2600
 */
export ImmConfigureIMEA(param0, param1, param2, param3) {
    param3Marshal := param3 is VarRef ? "ptr" : "ptr"

    result := DllCall("IMM32.dll\ImmConfigureIMEA", HKL, param0, HWND, param1, "uint", param2, param3Marshal, param3, BOOL)
    return result
}

/**
 * The ImmConfigureIMEW (Unicode) function (immdev.h) displays the configuration dialog box for the IME of the specified input locale identifier.
 * @remarks
 * > [!NOTE]
 * > The immdev.h header defines ImmConfigureIME as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKL} param0 
 * @param {HWND} param1 
 * @param {Integer} param2 
 * @param {Pointer<Void>} param3 
 * @returns {BOOL} Returns a nonzero value if successful, or 0 otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immconfigureimew
 * @since windows5.1.2600
 */
export ImmConfigureIMEW(param0, param1, param2, param3) {
    param3Marshal := param3 is VarRef ? "ptr" : "ptr"

    result := DllCall("IMM32.dll\ImmConfigureIMEW", HKL, param0, HWND, param1, "uint", param2, param3Marshal, param3, BOOL)
    return result
}

/**
 * The ImmEscapeA (ANSI) function (immdev.h) accesses capabilities of particular IMEs that are not available through other IME API functions.
 * @remarks
 * When <i>uEscape</i> is set to IME_ESC_QUERY_SUPPORT, <i>lpData</i> indicates the buffer containing the IME escape value. For example, to see if the current IME supports IME_ESC_GETHELPFILENAME, your application uses the following call:
 * 
 * 
 * ```cpp
 * DWORD dwEsc = IME_ESC_GETHELPFILENAME;
 * LRESULT lRet = ImmEscape(hKL,
 *                          hIMC,
 *                          IME_ESC_QUERY_SUPPORT,
 *                          (LPVOID)&dwEsc);
 * 
 * ```
 * 
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The immdev.h header defines ImmEscape as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKL} param0 
 * @param {HIMC} param1 
 * @param {IME_ESCAPE} param2 
 * @param {Pointer<Void>} param3 
 * @returns {LRESULT} Returns an operation-specific value if successful, or 0 otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immescapea
 * @since windows5.1.2600
 */
export ImmEscapeA(param0, param1, param2, param3) {
    param3Marshal := param3 is VarRef ? "ptr" : "ptr"

    result := DllCall("IMM32.dll\ImmEscapeA", HKL, param0, HIMC, param1, IME_ESCAPE, param2, param3Marshal, param3, LRESULT)
    return result
}

/**
 * The ImmEscapeW (Unicode) function (immdev.h) accesses capabilities of particular IMEs that are not available through other IME API functions.
 * @remarks
 * When <i>uEscape</i> is set to IME_ESC_QUERY_SUPPORT, <i>lpData</i> indicates the buffer containing the IME escape value. For example, to see if the current IME supports IME_ESC_GETHELPFILENAME, your application uses the following call:
 * 
 * 
 * ```cpp
 * DWORD dwEsc = IME_ESC_GETHELPFILENAME;
 * LRESULT lRet = ImmEscape(hKL,
 *                          hIMC,
 *                          IME_ESC_QUERY_SUPPORT,
 *                          (LPVOID)&dwEsc);
 * 
 * ```
 * 
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The immdev.h header defines ImmEscape as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKL} param0 
 * @param {HIMC} param1 
 * @param {IME_ESCAPE} param2 
 * @param {Pointer<Void>} param3 
 * @returns {LRESULT} Returns an operation-specific value if successful, or 0 otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immescapew
 * @since windows5.1.2600
 */
export ImmEscapeW(param0, param1, param2, param3) {
    param3Marshal := param3 is VarRef ? "ptr" : "ptr"

    result := DllCall("IMM32.dll\ImmEscapeW", HKL, param0, HIMC, param1, IME_ESCAPE, param2, param3Marshal, param3, LRESULT)
    return result
}

/**
 * The ImmGetConversionListA (ANSI) function (immdev.h) retrieves the conversion result list of characters or words without generating any IME-related messages.
 * @remarks
 * > [!NOTE]
 * > The immdev.h header defines ImmGetConversionList as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKL} param0 
 * @param {HIMC} param1 
 * @param {PSTR} lpSrc Pointer to a null-terminated character string specifying the source of the list.
 * @param {Integer} lpDst Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/imm/ns-imm-candidatelist">CANDIDATELIST</a> structure in which the function retrieves the list.
 * @param {Integer} dwBufLen Size, in bytes, of the output buffer. The application sets this parameter to 0 if the function is to return the buffer size required for the complete conversion result list.
 * @param {GET_CONVERSION_LIST_FLAG} uFlag 
 * @returns {Integer} Returns the number of bytes copied to the output buffer. If the application sets the <i>dwBufLen</i> parameter to 0, the function returns the size, in bytes, of the required output buffer.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetconversionlista
 * @since windows5.1.2600
 */
export ImmGetConversionListA(param0, param1, lpSrc, lpDst, dwBufLen, uFlag) {
    lpSrc := lpSrc is String ? StrPtr(lpSrc) : lpSrc

    result := DllCall("IMM32.dll\ImmGetConversionListA", HKL, param0, HIMC, param1, "ptr", lpSrc, "ptr", lpDst, "uint", dwBufLen, GET_CONVERSION_LIST_FLAG, uFlag, UInt32)
    return result
}

/**
 * The ImmGetConversionListW (Unicode) function (immdev.h) retrieves the conversion result list of characters or words without generating any IME-related messages.
 * @remarks
 * > [!NOTE]
 * > The immdev.h header defines ImmGetConversionList as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKL} param0 
 * @param {HIMC} param1 
 * @param {PWSTR} lpSrc Pointer to a null-terminated character string specifying the source of the list.
 * @param {Integer} lpDst Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/imm/ns-imm-candidatelist">CANDIDATELIST</a> structure in which the function retrieves the list.
 * @param {Integer} dwBufLen Size, in bytes, of the output buffer. The application sets this parameter to 0 if the function is to return the buffer size required for the complete conversion result list.
 * @param {GET_CONVERSION_LIST_FLAG} uFlag 
 * @returns {Integer} Returns the number of bytes copied to the output buffer. If the application sets the <i>dwBufLen</i> parameter to 0, the function returns the size, in bytes, of the required output buffer.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetconversionlistw
 * @since windows5.1.2600
 */
export ImmGetConversionListW(param0, param1, lpSrc, lpDst, dwBufLen, uFlag) {
    lpSrc := lpSrc is String ? StrPtr(lpSrc) : lpSrc

    result := DllCall("IMM32.dll\ImmGetConversionListW", HKL, param0, HIMC, param1, "ptr", lpSrc, "ptr", lpDst, "uint", dwBufLen, GET_CONVERSION_LIST_FLAG, uFlag, UInt32)
    return result
}

/**
 * The ImmNotifyIME function (immdev.h) notifies the IME about changes to the status of the input context.
 * @param {HIMC} param0 
 * @param {NOTIFY_IME_ACTION} dwAction 
 * @param {NOTIFY_IME_INDEX} dwIndex 
 * @param {Integer} dwValue Index of a candidate string. The application can set this parameter or ignore it, depending on the value of the <i>dwAction</i> parameter.
 * @returns {BOOL} Returns nonzero if successful, or 0 otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immnotifyime
 * @since windows5.1.2600
 */
export ImmNotifyIME(param0, dwAction, dwIndex, dwValue) {
    result := DllCall("IMM32.dll\ImmNotifyIME", HIMC, param0, NOTIFY_IME_ACTION, dwAction, NOTIFY_IME_INDEX, dwIndex, "uint", dwValue, BOOL)
    return result
}

/**
 * The ImmGetStatusWindowPos function (immdev.h) retrieves the position of the status window.
 * @param {HIMC} param0 
 * @param {Pointer<POINT>} lpptPos Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a> structure in which the function retrieves the position coordinates. These are screen coordinates, relative to the upper left corner of the screen.
 * @returns {BOOL} Returns a nonzero value if successful, or 0 otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetstatuswindowpos
 * @since windows5.1.2600
 */
export ImmGetStatusWindowPos(param0, lpptPos) {
    result := DllCall("IMM32.dll\ImmGetStatusWindowPos", HIMC, param0, POINT.Ptr, lpptPos, BOOL)
    return result
}

/**
 * The ImmSetStatusWindowPos function (immdev.h) sets the position of the status window.
 * @remarks
 * This function causes an <a href="https://docs.microsoft.com/windows/desktop/Intl/imn-setstatuswindowpos">IMN_SETSTATUSWINDOWPOS</a> command to be sent to the application.
 * @param {HIMC} param0 
 * @param {Pointer<POINT>} lpptPos Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a> structure containing the new position of the status window, in screen coordinates relative to the upper left corner of the display screen.
 * @returns {BOOL} Returns a nonzero value if successful, or 0 otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immsetstatuswindowpos
 * @since windows5.1.2600
 */
export ImmSetStatusWindowPos(param0, lpptPos) {
    result := DllCall("IMM32.dll\ImmSetStatusWindowPos", HIMC, param0, POINT.Ptr, lpptPos, BOOL)
    return result
}

/**
 * The ImmGetCompositionWindow function (immdev.h) retrieves information about the composition window.
 * @param {HIMC} param0 
 * @param {Pointer<COMPOSITIONFORM>} lpCompForm Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/imm/ns-imm-compositionform">COMPOSITIONFORM</a> structure in which the function retrieves information about the composition window.
 * @returns {BOOL} Returns a nonzero value if successful, or 0 otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetcompositionwindow
 * @since windows5.1.2600
 */
export ImmGetCompositionWindow(param0, lpCompForm) {
    result := DllCall("IMM32.dll\ImmGetCompositionWindow", HIMC, param0, COMPOSITIONFORM.Ptr, lpCompForm, BOOL)
    return result
}

/**
 * The ImmSetCompositionWindow function (immdev.h) sets the position of the composition window.
 * @remarks
 * This function causes an <a href="https://docs.microsoft.com/windows/desktop/Intl/imn-setcompositionwindow">IMN_SETCOMPOSITIONWINDOW</a> command to be sent to the application.
 * @param {HIMC} param0 
 * @param {Pointer<COMPOSITIONFORM>} lpCompForm Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/imm/ns-imm-compositionform">COMPOSITIONFORM</a> structure that contains the new position and other related information about the composition window.
 * @returns {BOOL} Returns a nonzero value if successful, or 0 otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immsetcompositionwindow
 * @since windows5.1.2600
 */
export ImmSetCompositionWindow(param0, lpCompForm) {
    result := DllCall("IMM32.dll\ImmSetCompositionWindow", HIMC, param0, COMPOSITIONFORM.Ptr, lpCompForm, BOOL)
    return result
}

/**
 * The ImmGetCandidateWindow function (immdev.h) retrieves information about the candidates window.
 * @param {HIMC} param0 
 * @param {Integer} param1 
 * @param {Pointer<CANDIDATEFORM>} lpCandidate Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/imm/ns-imm-candidateform">CANDIDATEFORM</a> structure in which this function retrieves information about the candidates window.
 * @returns {BOOL} Returns a nonzero value if successful, or 0 otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetcandidatewindow
 * @since windows5.1.2600
 */
export ImmGetCandidateWindow(param0, param1, lpCandidate) {
    result := DllCall("IMM32.dll\ImmGetCandidateWindow", HIMC, param0, "uint", param1, CANDIDATEFORM.Ptr, lpCandidate, BOOL)
    return result
}

/**
 * The ImmSetCandidateWindow function (immdev.h) sets information about the candidates window.
 * @remarks
 * This function causes an <a href="https://docs.microsoft.com/windows/desktop/Intl/imn-setcandidatepos">IMN_SETCANDIDATEPOS</a> command to be sent. Both the IME and the application call this function.
 * @param {HIMC} param0 
 * @param {Pointer<CANDIDATEFORM>} lpCandidate Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/imm/ns-imm-candidateform">CANDIDATEFORM</a> structure that contains information about the candidates window.
 * @returns {BOOL} Returns a nonzero value if successful, or 0 otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immsetcandidatewindow
 * @since windows5.1.2600
 */
export ImmSetCandidateWindow(param0, lpCandidate) {
    result := DllCall("IMM32.dll\ImmSetCandidateWindow", HIMC, param0, CANDIDATEFORM.Ptr, lpCandidate, BOOL)
    return result
}

/**
 * The ImmIsUIMessageA (ANSI) function (immdev.h) checks for messages intended for the IME window and sends those messages to the window.
 * @remarks
 * An application typically uses this function to display a composition string or candidate list specified by the IME. If <i>hWndIME</i> is <b>NULL</b>, the function determines if the message is a user interface message.
 * 
 * <b>Windows Me/98:</b> This function has only an ANSI version. To receive Unicode characters from a Unicode-based IME, the application should use <a href="https://docs.microsoft.com/windows/desktop/api/imm/nf-imm-immgetcompositionstringa">ImmGetCompositionString</a>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The immdev.h header defines ImmIsUIMessage as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HWND} param0 
 * @param {Integer} param1 
 * @param {WPARAM} param2 
 * @param {LPARAM} param3 
 * @returns {BOOL} Returns a nonzero value if the message is processed by the IME window, or 0 otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immisuimessagea
 * @since windows5.1.2600
 */
export ImmIsUIMessageA(param0, param1, param2, param3) {
    result := DllCall("IMM32.dll\ImmIsUIMessageA", HWND, param0, "uint", param1, WPARAM, param2, LPARAM, param3, BOOL)
    return result
}

/**
 * The ImmIsUIMessageW (Unicode) function (immdev.h) checks for messages intended for the IME window and sends those messages to the window.
 * @remarks
 * An application typically uses this function to display a composition string or candidate list specified by the IME. If <i>hWndIME</i> is <b>NULL</b>, the function determines if the message is a user interface message.
 * 
 * <b>Windows Me/98:</b> This function has only an ANSI version. To receive Unicode characters from a Unicode-based IME, the application should use <a href="https://docs.microsoft.com/windows/desktop/api/imm/nf-imm-immgetcompositionstringa">ImmGetCompositionString</a>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The immdev.h header defines ImmIsUIMessage as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HWND} param0 
 * @param {Integer} param1 
 * @param {WPARAM} param2 
 * @param {LPARAM} param3 
 * @returns {BOOL} Returns a nonzero value if the message is processed by the IME window, or 0 otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immisuimessagew
 * @since windows5.1.2600
 */
export ImmIsUIMessageW(param0, param1, param2, param3) {
    result := DllCall("IMM32.dll\ImmIsUIMessageW", HWND, param0, "uint", param1, WPARAM, param2, LPARAM, param3, BOOL)
    return result
}

/**
 * The ImmGetVirtualKey function (immdev.h) retrieves the original virtual key value associated with a key input message that the IME has already processed.
 * @remarks
 * Although the IME sets the virtual key value to VK_PROCESSKEY after processing a key input message, an application can recover the original virtual key value with the <b>ImmGetVirtualKey</b> function. This function is used only for key input messages containing the VK_PROCESSKEY value. Applications can only get the original virtual key by using this function after receiving 
 * 
 * the <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keydown">WM_KEYDOWN</a> (VK_PROCESSKEY) message, and before <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-translatemessage">TranslateMessage</a> is called in its own 
 * 
 * message loop.
 * @param {HWND} param0 
 * @returns {Integer} If <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-translatemessage">TranslateMessage</a> has been called by the application, <b>ImmGetVirtualKey</b> returns VK_PROCESSKEY; otherwise, it returns the virtual key.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetvirtualkey
 * @since windows5.1.2600
 */
export ImmGetVirtualKey(param0) {
    result := DllCall("IMM32.dll\ImmGetVirtualKey", HWND, param0, UInt32)
    return result
}

/**
 * The ImmRegisterWordA (ANSI) function (immdev.h) registers a string with the dictionary of the IME associated with the specified input locale.
 * @remarks
 * An IME independent software vendor (ISV) can define private styles for an IME in the IME_REGWORD_STYLE_USER_FIRST and IME_REGWORD_STYLE_USER_LAST values. For example:
 * 
 * 
 * ```cpp
 * @param {HKL} param0 
 * @param {PSTR} lpszReading Pointer to a null-terminated reading string associated with the string to register.
 * @param {Integer} param2 
 * @param {PSTR} lpszRegister Pointer to the null-terminated string to register.
 * @returns {BOOL} Returns a nonzero value if successful, or 0 otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immregisterworda
 * @since windows5.1.2600
 */
export ImmRegisterWordA(param0, lpszReading, param2, lpszRegister) {
    lpszReading := lpszReading is String ? StrPtr(lpszReading) : lpszReading
    lpszRegister := lpszRegister is String ? StrPtr(lpszRegister) : lpszRegister

    result := DllCall("IMM32.dll\ImmRegisterWordA", HKL, param0, "ptr", lpszReading, "uint", param2, "ptr", lpszRegister, BOOL)
    return result
}

/**
 * The ImmRegisterWordW (Unicode) function (immdev.h) registers a string with the dictionary of the IME associated with the specified input locale.
 * @remarks
 * An IME independent software vendor (ISV) can define private styles for an IME in the IME_REGWORD_STYLE_USER_FIRST and IME_REGWORD_STYLE_USER_LAST values. For example:
 * 
 * 
 * ```cpp
 * @param {HKL} param0 
 * @param {PWSTR} lpszReading Pointer to a null-terminated reading string associated with the string to register.
 * @param {Integer} param2 
 * @param {PWSTR} lpszRegister Pointer to the null-terminated string to register.
 * @returns {BOOL} Returns a nonzero value if successful, or 0 otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immregisterwordw
 * @since windows5.1.2600
 */
export ImmRegisterWordW(param0, lpszReading, param2, lpszRegister) {
    lpszReading := lpszReading is String ? StrPtr(lpszReading) : lpszReading
    lpszRegister := lpszRegister is String ? StrPtr(lpszRegister) : lpszRegister

    result := DllCall("IMM32.dll\ImmRegisterWordW", HKL, param0, "ptr", lpszReading, "uint", param2, "ptr", lpszRegister, BOOL)
    return result
}

/**
 * The ImmUnregisterWordA (ANSI) function (immdev.h) removes a register string from the dictionary of the IME associated with the specified input locale.
 * @remarks
 * > [!NOTE]
 * > The immdev.h header defines ImmUnregisterWord as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKL} param0 
 * @param {PSTR} lpszReading Pointer to a null-terminated reading string associated with the string to remove.
 * @param {Integer} param2 
 * @param {PSTR} lpszUnregister Pointer to a null-terminated string specifying the register string to remove.
 * @returns {BOOL} Returns a nonzero value if successful, or 0 otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immunregisterworda
 * @since windows5.1.2600
 */
export ImmUnregisterWordA(param0, lpszReading, param2, lpszUnregister) {
    lpszReading := lpszReading is String ? StrPtr(lpszReading) : lpszReading
    lpszUnregister := lpszUnregister is String ? StrPtr(lpszUnregister) : lpszUnregister

    result := DllCall("IMM32.dll\ImmUnregisterWordA", HKL, param0, "ptr", lpszReading, "uint", param2, "ptr", lpszUnregister, BOOL)
    return result
}

/**
 * The ImmUnregisterWordW (Unicode) function (immdev.h) removes a register string from the dictionary of the IME associated with the specified input locale.
 * @remarks
 * > [!NOTE]
 * > The immdev.h header defines ImmUnregisterWord as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKL} param0 
 * @param {PWSTR} lpszReading Pointer to a null-terminated reading string associated with the string to remove.
 * @param {Integer} param2 
 * @param {PWSTR} lpszUnregister Pointer to a null-terminated string specifying the register string to remove.
 * @returns {BOOL} Returns a nonzero value if successful, or 0 otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immunregisterwordw
 * @since windows5.1.2600
 */
export ImmUnregisterWordW(param0, lpszReading, param2, lpszUnregister) {
    lpszReading := lpszReading is String ? StrPtr(lpszReading) : lpszReading
    lpszUnregister := lpszUnregister is String ? StrPtr(lpszUnregister) : lpszUnregister

    result := DllCall("IMM32.dll\ImmUnregisterWordW", HKL, param0, "ptr", lpszReading, "uint", param2, "ptr", lpszUnregister, BOOL)
    return result
}

/**
 * The ImmGetRegisterWordStyleA (ANSI) function (immdev.h) retrieves a list of the styles supported by the IME associated with the specified input locale.
 * @remarks
 * > [!NOTE]
 * > The immdev.h header defines ImmGetRegisterWordStyle as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKL} param0 
 * @param {Integer} nItem Maximum number of styles that the output buffer can hold. The application sets this parameter to 0 if the function is to count the number of styles available in the IME.
 * @param {Pointer<STYLEBUFA>} lpStyleBuf Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/imm/ns-imm-stylebufa">STYLEBUF</a> structure in which the function retrieves the style information.
 * @returns {Integer} Returns the number of styles copied to the buffer. If the application sets the <i>nItem</i> parameter to 0, the return value is the number of styles available in the IME.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetregisterwordstylea
 * @since windows5.1.2600
 */
export ImmGetRegisterWordStyleA(param0, nItem, lpStyleBuf) {
    result := DllCall("IMM32.dll\ImmGetRegisterWordStyleA", HKL, param0, "uint", nItem, STYLEBUFA.Ptr, lpStyleBuf, UInt32)
    return result
}

/**
 * The ImmGetRegisterWordStyleW (Unicode) function (immdev.h) retrieves a list of the styles supported by the IME associated with the specified input locale.
 * @remarks
 * > [!NOTE]
 * > The immdev.h header defines ImmGetRegisterWordStyle as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKL} param0 
 * @param {Integer} nItem Maximum number of styles that the output buffer can hold. The application sets this parameter to 0 if the function is to count the number of styles available in the IME.
 * @param {Pointer<STYLEBUFW>} lpStyleBuf Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/imm/ns-imm-stylebufa">STYLEBUF</a> structure in which the function retrieves the style information.
 * @returns {Integer} Returns the number of styles copied to the buffer. If the application sets the <i>nItem</i> parameter to 0, the return value is the number of styles available in the IME.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetregisterwordstylew
 * @since windows5.1.2600
 */
export ImmGetRegisterWordStyleW(param0, nItem, lpStyleBuf) {
    result := DllCall("IMM32.dll\ImmGetRegisterWordStyleW", HKL, param0, "uint", nItem, STYLEBUFW.Ptr, lpStyleBuf, UInt32)
    return result
}

/**
 * The ImmEnumRegisterWordA (ANSI) function (immdev.h) enumerates the register strings having the specified reading string, style, and register string.
 * @remarks
 * If <i>dwStyle</i> is set to 0 and both <i>lpszReading</i> and <i>lpszRegister</i> are set to <b>NULL</b>, this function enumerates all register strings in the IME dictionary.
 * 
 * > [!NOTE]
 * > The immdev.h header defines ImmEnumRegisterWord as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKL} param0 
 * @param {Pointer<REGISTERWORDENUMPROCA>} param1 
 * @param {PSTR} lpszReading Pointer to the reading string to enumerate. The application sets this parameter to <b>NULL</b> if the function is to enumerate all available reading strings that match the <i>dwStyle</i> and <i>lpszRegister</i> settings.
 * @param {Integer} param3 
 * @param {PSTR} lpszRegister Pointer to the register string to enumerate. The application sets this parameter to <b>NULL</b> if the function is to enumerate all register strings that match the <i>lpszReading</i> and <i>dwStyle</i> settings.
 * @param {Pointer<Void>} param5 
 * @returns {Integer} Returns the last value returned by the callback function, with the meaning defined by the application. The function returns 0 if it cannot enumerate the register strings.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immenumregisterworda
 * @since windows5.1.2600
 */
export ImmEnumRegisterWordA(param0, param1, lpszReading, param3, lpszRegister, param5) {
    lpszReading := lpszReading is String ? StrPtr(lpszReading) : lpszReading
    lpszRegister := lpszRegister is String ? StrPtr(lpszRegister) : lpszRegister

    param5Marshal := param5 is VarRef ? "ptr" : "ptr"

    result := DllCall("IMM32.dll\ImmEnumRegisterWordA", HKL, param0, "ptr", param1, "ptr", lpszReading, "uint", param3, "ptr", lpszRegister, param5Marshal, param5, UInt32)
    return result
}

/**
 * The ImmEnumRegisterWordW (Unicode) function (immdev.h) enumerates the register strings having the specified reading string, style, and register string.
 * @remarks
 * If <i>dwStyle</i> is set to 0 and both <i>lpszReading</i> and <i>lpszRegister</i> are set to <b>NULL</b>, this function enumerates all register strings in the IME dictionary.
 * 
 * > [!NOTE]
 * > The immdev.h header defines ImmEnumRegisterWord as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HKL} param0 
 * @param {Pointer<REGISTERWORDENUMPROCW>} param1 
 * @param {PWSTR} lpszReading Pointer to the reading string to enumerate. The application sets this parameter to <b>NULL</b> if the function is to enumerate all available reading strings that match the <i>dwStyle</i> and <i>lpszRegister</i> settings.
 * @param {Integer} param3 
 * @param {PWSTR} lpszRegister Pointer to the register string to enumerate. The application sets this parameter to <b>NULL</b> if the function is to enumerate all register strings that match the <i>lpszReading</i> and <i>dwStyle</i> settings.
 * @param {Pointer<Void>} param5 
 * @returns {Integer} Returns the last value returned by the callback function, with the meaning defined by the application. The function returns 0 if it cannot enumerate the register strings.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immenumregisterwordw
 * @since windows5.1.2600
 */
export ImmEnumRegisterWordW(param0, param1, lpszReading, param3, lpszRegister, param5) {
    lpszReading := lpszReading is String ? StrPtr(lpszReading) : lpszReading
    lpszRegister := lpszRegister is String ? StrPtr(lpszRegister) : lpszRegister

    param5Marshal := param5 is VarRef ? "ptr" : "ptr"

    result := DllCall("IMM32.dll\ImmEnumRegisterWordW", HKL, param0, "ptr", param1, "ptr", lpszReading, "uint", param3, "ptr", lpszRegister, param5Marshal, param5, UInt32)
    return result
}

/**
 * The ImmDisableIME function (immdev.h) disables the IME for a thread or for all threads in a process.
 * @remarks
 * The application must call this function before the first top-level window in the thread receives the <a href="https://docs.microsoft.com/windows/desktop/winmsg/wm-create">WM_CREATE</a> message. Thus, the application must call this function in one of the following places:
 * 
 * <ul>
 * <li>Any time before calling <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-createwindowa">CreateWindow</a> to create the first top-level window</li>
 * <li>In the <a href="https://docs.microsoft.com/windows/desktop/winmsg/wm-nccreate">WM_NCCREATE</a> handler for first top-level window</li>
 * </ul>
 * @param {Integer} param0 
 * @returns {BOOL} Returns <b>TRUE</b> if successful or <b>FALSE</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immdisableime
 * @since windows5.1.2600
 */
export ImmDisableIME(param0) {
    result := DllCall("IMM32.dll\ImmDisableIME", "uint", param0, BOOL)
    return result
}

/**
 * The ImmEnumInputContext function (immdev.h) retrieves the input context for the specified thread.
 * @remarks
 * This function calls the application callback function for each enumerated input context, and passes the specified <i>lParam</i> value.
 * @param {Integer} idThread 
 * @param {Pointer<IMCENUMPROC>} lpfn Pointer to the enumeration callback function. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/imm/nc-imm-imcenumproc">EnumInputContext</a>.
 * @param {LPARAM} _lParam Application-supplied data. The function passes this data to the callback function.
 * @returns {BOOL} Returns <b>TRUE</b> if successful or <b>FALSE</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immenuminputcontext
 * @since windows5.1.2600
 */
export ImmEnumInputContext(idThread, lpfn, _lParam) {
    result := DllCall("IMM32.dll\ImmEnumInputContext", "uint", idThread, "ptr", lpfn, LPARAM, _lParam, BOOL)
    return result
}

/**
 * The ImmGetImeMenuItemsA (ANSI) function (immdev.h) retrieves the menu items that are registered in the IME menu of a specified input context.
 * @remarks
 * > [!NOTE]
 * > The immdev.h header defines ImmGetImeMenuItems as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HIMC} param0 
 * @param {Integer} param1 
 * @param {Integer} param2 
 * @param {Pointer<IMEMENUITEMINFOA>} lpImeParentMenu Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/imm/ns-imm-imemenuiteminfoa">IMEMENUITEMINFO</a> structure in which the function retrieves parent menu information. To retrieve information about the submenu items of this parent menu, the application sets the <b>fType</b> member to MFT_SUBMENU. This parameter contains <b>NULL</b> if the function retrieves only top-level menu items.
 * @param {Integer} lpImeMenu Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/imm/ns-imm-imemenuiteminfoa">IMEMENUITEMINFO</a> structures in which the function retrieves information about the menu items. This parameter contains <b>NULL</b> if the function retrieves the number of registered menu items.
 * @param {Integer} dwSize Size of the buffer to receive the <a href="https://docs.microsoft.com/windows/desktop/api/imm/ns-imm-imemenuiteminfoa">IMEMENUITEMINFO</a> structure.
 * @returns {Integer} Returns the number of menu items copied into <i>lpImeMenu</i>. If <i>lpImeMenu</i> specifies <b>NULL</b>, the function returns the number of registered menu items in the specified input context.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetimemenuitemsa
 * @since windows5.1.2600
 */
export ImmGetImeMenuItemsA(param0, param1, param2, lpImeParentMenu, lpImeMenu, dwSize) {
    result := DllCall("IMM32.dll\ImmGetImeMenuItemsA", HIMC, param0, "uint", param1, "uint", param2, IMEMENUITEMINFOA.Ptr, lpImeParentMenu, "ptr", lpImeMenu, "uint", dwSize, UInt32)
    return result
}

/**
 * The ImmGetImeMenuItemsW (Unicode) function (immdev.h) retrieves the menu items that are registered in the IME menu of a specified input context.
 * @remarks
 * > [!NOTE]
 * > The immdev.h header defines ImmGetImeMenuItems as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HIMC} param0 
 * @param {Integer} param1 
 * @param {Integer} param2 
 * @param {Pointer<IMEMENUITEMINFOW>} lpImeParentMenu Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/imm/ns-imm-imemenuiteminfoa">IMEMENUITEMINFO</a> structure in which the function retrieves parent menu information. To retrieve information about the submenu items of this parent menu, the application sets the <b>fType</b> member to MFT_SUBMENU. This parameter contains <b>NULL</b> if the function retrieves only top-level menu items.
 * @param {Integer} lpImeMenu Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/imm/ns-imm-imemenuiteminfoa">IMEMENUITEMINFO</a> structures in which the function retrieves information about the menu items. This parameter contains <b>NULL</b> if the function retrieves the number of registered menu items.
 * @param {Integer} dwSize Size of the buffer to receive the <a href="https://docs.microsoft.com/windows/desktop/api/imm/ns-imm-imemenuiteminfoa">IMEMENUITEMINFO</a> structure.
 * @returns {Integer} Returns the number of menu items copied into <i>lpImeMenu</i>. If <i>lpImeMenu</i> specifies <b>NULL</b>, the function returns the number of registered menu items in the specified input context.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immgetimemenuitemsw
 * @since windows5.1.2600
 */
export ImmGetImeMenuItemsW(param0, param1, param2, lpImeParentMenu, lpImeMenu, dwSize) {
    result := DllCall("IMM32.dll\ImmGetImeMenuItemsW", HIMC, param0, "uint", param1, "uint", param2, IMEMENUITEMINFOW.Ptr, lpImeParentMenu, "ptr", lpImeMenu, "uint", dwSize, UInt32)
    return result
}

/**
 * The ImmDisableTextFrameService function (immdev.h) is no longer available for use as of Windows Vista.
 * @remarks
 * An application calls this function if it has a thread that is incompatible with TSF.
 * 
 * Note that TSF functionality is provided to applications that are not specifically written to use TSF, Input Method Manager (IMM32), or Active Input Method Manager (AIMM 1.2). Although an application can be written to use TSF, IMM32, and AIMM 1.2, there can be specific controls within the application that do not use these technologies. TSF support is provided to these specific controls as well. This TSF feature is available beginning with Windows XP when all of these dynamic-link libraries (DLLs) are loaded: system modules User32.dll, Imm32.dll, and Win32k.sys, and TSF modules Msctf.dll and Msimtf.dll.
 * @param {Integer} idThread Identifier of the thread for which to disable the text service. The thread must be in the same process as the application. The application sets this parameter to 0 to disable the service for the current thread. The application sets the parameter to –1 to disable the service for all threads in the current process.
 * @returns {BOOL} Returns <b>TRUE</b> if successful or <b>FALSE</b> otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immdisabletextframeservice
 * @since windows5.1.2600
 */
export ImmDisableTextFrameService(idThread) {
    result := DllCall("IMM32.dll\ImmDisableTextFrameService", "uint", idThread, BOOL)
    return result
}

/**
 * The ImmDisableLegacyIME function (immdev.h) indicates that this thread is a Windows Store app UI thread.
 * @remarks
 * Windows Store app brokers such as explorer.exe should call this function in Windows Store app UI threads to ensure that only IMEs that are compatible with  Windows Store apps are made available.  Those Windows Store app threads that don't require IME input should call <a href="https://docs.microsoft.com/windows/desktop/api/imm/nf-imm-immdisableime">ImmDisableIME</a> to disable IMM entirely for that thread.
 * 
 * The app must call this function before the first top-level window in the thread receives the <a href="https://docs.microsoft.com/windows/desktop/winmsg/wm-create">WM_CREATE</a> message. Thus, the app must call this function in one of the following places:
 * 
 * <ul>
 * <li>Any time before  <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-createwindowa">CreateWindow</a> is called to create the first top-level window.</li>
 * <li>In the <a href="https://docs.microsoft.com/windows/desktop/winmsg/wm-nccreate">WM_NCCREATE</a> handler for the first top-level window.</li>
 * </ul>
 * @returns {BOOL} Returns <b>TRUE</b> if successful;   otherwise, <b>FALSE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immdisablelegacyime
 * @since windows8.0
 */
export ImmDisableLegacyIME() {
    result := DllCall("IMM32.dll\ImmDisableLegacyIME", BOOL)
    return result
}

/**
 * 
 * @param {Integer} param0 
 * @param {Pointer<Integer>} lpuModifiers 
 * @param {Pointer<Integer>} lpuVKey 
 * @param {Pointer<HKL>} phKL 
 * @returns {BOOL} 
 */
export ImmGetHotKey(param0, lpuModifiers, lpuVKey, phKL) {
    lpuModifiersMarshal := lpuModifiers is VarRef ? "uint*" : "ptr"
    lpuVKeyMarshal := lpuVKey is VarRef ? "uint*" : "ptr"

    result := DllCall("IMM32.dll\ImmGetHotKey", "uint", param0, lpuModifiersMarshal, lpuModifiers, lpuVKeyMarshal, lpuVKey, HKL.Ptr, phKL, BOOL)
    return result
}

/**
 * 
 * @param {Integer} param0 
 * @param {Integer} param1 
 * @param {Integer} param2 
 * @param {HKL} param3 
 * @returns {BOOL} 
 */
export ImmSetHotKey(param0, param1, param2, param3) {
    result := DllCall("IMM32.dll\ImmSetHotKey", "uint", param0, "uint", param1, "uint", param2, HKL, param3, BOOL)
    return result
}

/**
 * 
 * @param {HIMC} param0 
 * @returns {BOOL} 
 */
export ImmGenerateMessage(param0) {
    result := DllCall("IMM32.dll\ImmGenerateMessage", HIMC, param0, BOOL)
    return result
}

/**
 * Generates a WM_IME_REQUEST message. (ANSI)
 * @remarks
 * IME must use this function instead of sending the <a href="https://docs.microsoft.com/windows/desktop/Intl/wm-ime-request">WM_IME_REQUEST</a> message to the application in a call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/oe/oe-ihttpmailtransport-sendmessage">SendMessage</a>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The immdev.h header defines ImmRequestMessage as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HIMC} param0 
 * @param {WPARAM} param1 
 * @param {LPARAM} param2 
 * @returns {LRESULT} Returns an operation-specific value if successful, or 0 otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immrequestmessagea
 * @since windows5.1.2600
 */
export ImmRequestMessageA(param0, param1, param2) {
    result := DllCall("IMM32.dll\ImmRequestMessageA", HIMC, param0, WPARAM, param1, LPARAM, param2, LRESULT)
    return result
}

/**
 * Generates a WM_IME_REQUEST message. (Unicode)
 * @remarks
 * IME must use this function instead of sending the <a href="https://docs.microsoft.com/windows/desktop/Intl/wm-ime-request">WM_IME_REQUEST</a> message to the application in a call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/oe/oe-ihttpmailtransport-sendmessage">SendMessage</a>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The immdev.h header defines ImmRequestMessage as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HIMC} param0 
 * @param {WPARAM} param1 
 * @param {LPARAM} param2 
 * @returns {LRESULT} Returns an operation-specific value if successful, or 0 otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/nf-immdev-immrequestmessagew
 * @since windows5.1.2600
 */
export ImmRequestMessageW(param0, param1, param2) {
    result := DllCall("IMM32.dll\ImmRequestMessageW", HIMC, param0, WPARAM, param1, LPARAM, param2, LRESULT)
    return result
}

/**
 * 
 * @param {Integer} param0 
 * @param {HWND} param1 
 * @param {Integer} param2 
 * @param {Integer} param3 
 * @returns {HWND} 
 */
export ImmCreateSoftKeyboard(param0, param1, param2, param3) {
    result := DllCall("IMM32.dll\ImmCreateSoftKeyboard", "uint", param0, HWND, param1, "int", param2, "int", param3, HWND)
    return result
}

/**
 * 
 * @param {HWND} param0 
 * @returns {BOOL} 
 */
export ImmDestroySoftKeyboard(param0) {
    result := DllCall("IMM32.dll\ImmDestroySoftKeyboard", HWND, param0, BOOL)
    return result
}

/**
 * 
 * @param {HWND} param0 
 * @param {Integer} param1 
 * @returns {BOOL} 
 */
export ImmShowSoftKeyboard(param0, param1) {
    result := DllCall("IMM32.dll\ImmShowSoftKeyboard", HWND, param0, "int", param1, BOOL)
    return result
}

/**
 * 
 * @param {HIMC} param0 
 * @returns {Pointer<INPUTCONTEXT>} 
 */
export ImmLockIMC(param0) {
    result := DllCall("IMM32.dll\ImmLockIMC", HIMC, param0, INPUTCONTEXT.Ptr)
    return result
}

/**
 * 
 * @param {HIMC} param0 
 * @returns {BOOL} 
 */
export ImmUnlockIMC(param0) {
    result := DllCall("IMM32.dll\ImmUnlockIMC", HIMC, param0, BOOL)
    return result
}

/**
 * 
 * @param {HIMC} param0 
 * @returns {Integer} 
 */
export ImmGetIMCLockCount(param0) {
    result := DllCall("IMM32.dll\ImmGetIMCLockCount", HIMC, param0, UInt32)
    return result
}

/**
 * 
 * @param {Integer} param0 
 * @returns {HIMCC} 
 */
export ImmCreateIMCC(param0) {
    result := DllCall("IMM32.dll\ImmCreateIMCC", "uint", param0, HIMCC)
    return result
}

/**
 * 
 * @param {HIMCC} param0 
 * @returns {HIMCC} 
 */
export ImmDestroyIMCC(param0) {
    result := DllCall("IMM32.dll\ImmDestroyIMCC", HIMCC, param0, HIMCC)
    return result
}

/**
 * 
 * @param {HIMCC} param0 
 * @returns {Pointer<Void>} 
 */
export ImmLockIMCC(param0) {
    result := DllCall("IMM32.dll\ImmLockIMCC", HIMCC, param0, IntPtr)
    return result
}

/**
 * 
 * @param {HIMCC} param0 
 * @returns {BOOL} 
 */
export ImmUnlockIMCC(param0) {
    result := DllCall("IMM32.dll\ImmUnlockIMCC", HIMCC, param0, BOOL)
    return result
}

/**
 * 
 * @param {HIMCC} param0 
 * @returns {Integer} 
 */
export ImmGetIMCCLockCount(param0) {
    result := DllCall("IMM32.dll\ImmGetIMCCLockCount", HIMCC, param0, UInt32)
    return result
}

/**
 * 
 * @param {HIMCC} param0 
 * @param {Integer} param1 
 * @returns {HIMCC} 
 */
export ImmReSizeIMCC(param0, param1) {
    result := DllCall("IMM32.dll\ImmReSizeIMCC", HIMCC, param0, "uint", param1, HIMCC)
    return result
}

/**
 * 
 * @param {HIMCC} param0 
 * @returns {Integer} 
 */
export ImmGetIMCCSize(param0) {
    result := DllCall("IMM32.dll\ImmGetIMCCSize", HIMCC, param0, UInt32)
    return result
}

;@endregion Functions
