#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The TASKDIALOG_BUTTON structure contains information used to display a button in a task dialog. The TASKDIALOGCONFIG structure uses this structure.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-taskdialog_button
 * @namespace Windows.Win32.UI.Controls
 */
export default struct TASKDIALOG_BUTTON {
    #StructPack 8

    /**
     * Type: <b>int</b>
     * 
     * Indicates the value to be returned when this button is selected.
     */
    nButtonID : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">PCWSTR</a></b>
     * 
     * Pointer that references the string to be used to label the button. This parameter can be either a null-terminated string or an integer resource identifier passed to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a> macro. When using Command Links, you delineate the command from the note by placing a new line character in the string.
     */
    pszButtonText : PWSTR

}
