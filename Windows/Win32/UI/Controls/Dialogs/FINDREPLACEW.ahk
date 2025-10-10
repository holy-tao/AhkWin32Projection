#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains information that the FindText and ReplaceText functions use to initialize the Find and Replace dialog boxes.
 * @remarks
 * 
  * > [!NOTE]
  * > The commdlg.h header defines FINDREPLACE as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//commdlg/ns-commdlg-findreplacew
 * @namespace Windows.Win32.UI.Controls.Dialogs
 * @version v4.0.30319
 * @charset Unicode
 */
class FINDREPLACEW extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The length, in bytes, of the structure.
     * @type {Integer}
     */
    lStructSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the window that owns the dialog box. The window procedure of the specified window receives <a href="https://docs.microsoft.com/windows/desktop/dlgbox/findmsgstring">FINDMSGSTRING</a> messages from the dialog box. This member can be any valid window handle, but it must not be <b>NULL</b>.
     * @type {Pointer<Void>}
     */
    hwndOwner {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>HINSTANCE</b>
     * 
     * If the <b>FR_ENABLETEMPLATEHANDLE</b> flag is set in the <b>Flags</b>, <b>hInstance</b> is a handle to a memory object containing a dialog box template. If the <b>FR_ENABLETEMPLATE</b> flag is set, <b>hInstance</b> is a handle to a module that contains a dialog box template named by the <b>lpTemplateName</b> member. If neither flag is set, this member is ignored.
     * @type {Pointer<Void>}
     */
    hInstance {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b>DWORD</b>
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b>LPTSTR</b>
     * 
     * The search string that the user typed in the <b>Find What</b> edit control. You must dynamically allocate the buffer or use a global or static array so it does not go out of scope before the dialog box closes. The buffer should be at least 80 characters long. If the buffer contains a string when you initialize the dialog box, the string is displayed in the <b>Find What</b> edit control. If a <a href="https://docs.microsoft.com/windows/desktop/dlgbox/findmsgstring">FINDMSGSTRING</a> message specifies the <b>FR_FINDNEXT</b> flag, <b>lpstrFindWhat</b> contains the string to search for. The <b>FR_DOWN</b>, <b>FR_WHOLEWORD</b>, and <b>FR_MATCHCASE</b> flags indicate the direction and type of search. If a <b>FINDMSGSTRING</b> message specifies the <b>FR_REPLACE</b> or <b>FR_REPLACE</b> flags, <b>lpstrFindWhat</b> contains the string to be replaced.
     * @type {Pointer<Char>}
     */
    lpstrFindWhat {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: <b>LPTSTR</b>
     * 
     * The replacement string that the user typed in the <b>Replace With</b> edit control. You must dynamically allocate the buffer or use a global or static array so it does not go out of scope before the dialog box closes. If the buffer contains a string when you initialize the dialog box, the string is displayed in the <b>Replace With</b> edit control.
     * 
     * If a <a href="https://docs.microsoft.com/windows/desktop/dlgbox/findmsgstring">FINDMSGSTRING</a> message specifies the <b>FR_REPLACE</b> or <b>FR_REPLACEALL</b> flags, <b>lpstrReplaceWith</b> contains the replacement string . 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nf-commdlg-findtexta">FindText</a> function ignores this member.
     * @type {Pointer<Char>}
     */
    lpstrReplaceWith {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Type: <b>WORD</b>
     * 
     * The length, in bytes, of the buffer pointed to by the <b>lpstrFindWhat</b> member.
     * @type {Integer}
     */
    wFindWhatLen {
        get => NumGet(this, 48, "ushort")
        set => NumPut("ushort", value, this, 48)
    }

    /**
     * Type: <b>WORD</b>
     * 
     * The length, in bytes, of the buffer pointed to by the <b>lpstrReplaceWith</b> member.
     * @type {Integer}
     */
    wReplaceWithLen {
        get => NumGet(this, 50, "ushort")
        set => NumPut("ushort", value, this, 50)
    }

    /**
     * Type: <b>LPARAM</b>
     * 
     * Application-defined data that the system passes to the hook procedure identified by the <b>lpfnHook</b> member. When the system sends the <a href="https://docs.microsoft.com/windows/desktop/dlgbox/wm-initdialog">WM_INITDIALOG</a> message to the hook procedure, the message's <i>lParam</i> parameter is a pointer to the <b>FINDREPLACE</b> structure specified when the dialog was created. The hook procedure can use this pointer to get the <b>lCustData</b> value.
     * @type {Pointer}
     */
    lCustData {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Type: <b>LPFRHOOKPROC</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nc-commdlg-lpfrhookproc">FRHookProc</a> hook procedure that can process messages intended for the dialog box. This member is ignored unless the <b>FR_ENABLEHOOK</b> flag is set in the <b>Flags</b> member. If the hook procedure returns <b>FALSE</b> in response to the <a href="https://docs.microsoft.com/windows/desktop/dlgbox/wm-initdialog">WM_INITDIALOG</a> message, the hook procedure must display the dialog box or else the dialog box will not be shown. To do this, first perform any other paint operations, and then call the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-showwindow">ShowWindow</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-updatewindow">UpdateWindow</a> functions.
     * @type {Pointer<LPFRHOOKPROC>}
     */
    lpfnHook {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * The name of the dialog box template resource in the module identified by the <b>hInstance</b> member. This template is substituted for the standard dialog box template. For numbered dialog box resources, this can be a value returned by the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a> macro. This member is ignored unless the <b>FR_ENABLETEMPLATE</b> flag is set in the <b>Flags</b> member.
     * @type {Pointer<Char>}
     */
    lpTemplateName {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }
}
