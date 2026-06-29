#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Data.HtmlHelp
 */

;@region Functions
/**
 * Displays a help window. (ANSI)
 * @remarks
 * The  syntax applies to ANSI character sets.  When using a Unicode character set, the type of the <i>pszFile</i> parameter should be "LPCTSTR  ".
 * 
 * When using the HTML Help API, set the stack size of the hosting executable to at least 100k. If the defined stack size is too small, then the thread created to run HTML Help will also be created with this stack size, and failure could result. Optionally, you can remove /STACK from the link command line, and remove any STACK setting in the executable's DEF file (default stack size is 1MB in this case). You can also you can set the stack size using the /Fnumber compiler command (the compiler will pass this to the linker as /STACK).
 * @param {HWND} hwndCaller Specifies the handle (<i>hwnd</i>) of the window calling <b>HtmlHelp</b>. The help window is owned by this window. 
 * 
 * 
 * 
 * When the help window is closed, <b>HtmlHelp</b> will return focus to the owner unless the owner is the desktop. If <i>hwndCaller</i> is the desktop, then the operating system determines where focus is returned.
 * 
 * In addition, if <b>HtmlHelp</b> sends any notification messages from the help window, they are sent to <i>hwndCaller</i> as long as you have enabled <a href="https://docs.microsoft.com/previous-versions/windows/desktop/htmlhelp/about-notification-messages">notification message</a> tracking in the help window definition.
 * @param {PSTR} pszFile Depending on the <i>uCommand</i> value, specifies the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/htmlhelp/about-html-help-urls">file path</a> to either a compiled help (.chm) file, or a topic file within a specified help file. 
 * 
 * 
 * 
 * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms644703(v=vs.85)">window type</a> name can also be specified, preceded with a greater-than (&gt;) character.
 * 
 * If the specified command does not require a file, this value may be NULL.
 * @param {Integer} uCommand Specifies the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/htmlhelp/about-commands">command</a> to complete.
 * @param {Pointer} dwData Specifies any data that may be required, based on the value of the <i>uCommand</i> parameter.
 * @returns {HWND} Depending on the specified <i>uCommand</i> and the result, <b>HtmlHelp</b> returns one or both of the following: 
 * 
 * <ul>
 * <li>The handle (hwnd) of the help window.</li>
 * <li>NULL. In some cases, NULL indicates failure; in other cases, NULL indicates that the help window has not yet been created. </li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/htmlhelp/nf-htmlhelp-htmlhelpa
 */
export HtmlHelpA(hwndCaller, pszFile, uCommand, dwData) {
    pszFile := pszFile is String ? StrPtr(pszFile) : pszFile

    result := DllCall("hhctrl.ocx\HtmlHelpA", HWND, hwndCaller, "ptr", pszFile, "uint", uCommand, "ptr", dwData, HWND)
    return result
}

/**
 * Displays a help window. (Unicode)
 * @remarks
 * The  syntax applies to ANSI character sets.  When using a Unicode character set, the type of the <i>pszFile</i> parameter should be "LPCTSTR  ".
 * 
 * When using the HTML Help API, set the stack size of the hosting executable to at least 100k. If the defined stack size is too small, then the thread created to run HTML Help will also be created with this stack size, and failure could result. Optionally, you can remove /STACK from the link command line, and remove any STACK setting in the executable's DEF file (default stack size is 1MB in this case). You can also you can set the stack size using the /Fnumber compiler command (the compiler will pass this to the linker as /STACK).
 * @param {HWND} hwndCaller Specifies the handle (<i>hwnd</i>) of the window calling <b>HtmlHelp</b>. The help window is owned by this window. 
 * 
 * 
 * 
 * When the help window is closed, <b>HtmlHelp</b> will return focus to the owner unless the owner is the desktop. If <i>hwndCaller</i> is the desktop, then the operating system determines where focus is returned.
 * 
 * In addition, if <b>HtmlHelp</b> sends any notification messages from the help window, they are sent to <i>hwndCaller</i> as long as you have enabled <a href="https://docs.microsoft.com/previous-versions/windows/desktop/htmlhelp/about-notification-messages">notification message</a> tracking in the help window definition.
 * @param {PWSTR} pszFile Depending on the <i>uCommand</i> value, specifies the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/htmlhelp/about-html-help-urls">file path</a> to either a compiled help (.chm) file, or a topic file within a specified help file. 
 * 
 * 
 * 
 * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms644703(v=vs.85)">window type</a> name can also be specified, preceded with a greater-than (&gt;) character.
 * 
 * If the specified command does not require a file, this value may be NULL.
 * @param {Integer} uCommand Specifies the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/htmlhelp/about-commands">command</a> to complete.
 * @param {Pointer} dwData Specifies any data that may be required, based on the value of the <i>uCommand</i> parameter.
 * @returns {HWND} Depending on the specified <i>uCommand</i> and the result, <b>HtmlHelp</b> returns one or both of the following: 
 * 
 * <ul>
 * <li>The handle (hwnd) of the help window.</li>
 * <li>NULL. In some cases, NULL indicates failure; in other cases, NULL indicates that the help window has not yet been created. </li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/htmlhelp/nf-htmlhelp-htmlhelpw
 */
export HtmlHelpW(hwndCaller, pszFile, uCommand, dwData) {
    pszFile := pszFile is String ? StrPtr(pszFile) : pszFile

    result := DllCall("hhctrl.ocx\HtmlHelpW", HWND, hwndCaller, "ptr", pszFile, "uint", uCommand, "ptr", dwData, HWND)
    return result
}

;@endregion Functions
