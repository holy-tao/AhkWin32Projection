#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The TASKDIALOG_BUTTON structure contains information used to display a button in a task dialog. The TASKDIALOGCONFIG structure uses this structure.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-taskdialog_button
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class TASKDIALOG_BUTTON extends Win32Struct
{
    static sizeof => 12

    static packingSize => 1

    /**
     * Type: <b>int</b>
     * 
     * Indicates the value to be returned when this button is selected.
     * @type {Integer}
     */
    nButtonID {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">PCWSTR</a></b>
     * 
     * Pointer that references the string to be used to label the button. This parameter can be either a null-terminated string or an integer resource identifier passed to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a> macro. When using Command Links, you delineate the command from the note by placing a new line character in the string.
     * @type {Pointer<Ptr>}
     */
    pszButtonText {
        get => NumGet(this, 4, "ptr")
        set => NumPut("ptr", value, this, 4)
    }
}
