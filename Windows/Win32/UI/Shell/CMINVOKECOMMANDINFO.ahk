#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains information needed by IContextMenu::InvokeCommand to invoke a shortcut menu command.
 * @remarks
 * Although the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icontextmenu-invokecommand">IContextMenu::InvokeCommand</a> declaration specifies a <b>CMINVOKECOMMANDINFO</b> structure for the <i>pici</i> parameter, it can also accept a <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-cminvokecommandinfoex">CMINVOKECOMMANDINFOEX</a> structure. If you are implementing this method, you must inspect <b>cbSize</b> to determine which structure has been passed.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-cminvokecommandinfo
 * @namespace Windows.Win32.UI.Shell
 */
export default struct CMINVOKECOMMANDINFO {
    #StructPack 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of this structure, in bytes.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b>DWORD</b>
     * 
     * Zero, or one or more of the following flags.
     */
    fMask : UInt32

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the window that is the owner of the shortcut menu. An extension can also use this handle as the owner of any message boxes or dialog boxes it displays.
     */
    hwnd : HWND

    /**
     * Type: <b>LPCSTR</b>
     * 
     * The address of a null-terminated string that specifies the language-independent name of the command to carry out. This member is typically a string when a command is being activated by an application. The system provides predefined constant values for the following command strings.
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Constant</th>
     * <th>Command string</th>
     * </tr>
     * <tr>
     * <td>CMDSTR_RUNAS</td>
     * <td>"RunAs"</td>
     * </tr>
     * <tr>
     * <td>CMDSTR_PRINT</td>
     * <td>"Print"</td>
     * </tr>
     * <tr>
     * <td>CMDSTR_PREVIEW</td>
     * <td>"Preview"</td>
     * </tr>
     * <tr>
     * <td>CMDSTR_OPEN</td>
     * <td>"Open"</td>
     * </tr>
     * </table>
     *  
     * 
     * This is not a fixed set; new canonical verbs can be invented by context menu handlers and applications can invoke them.
     * 
     * If a canonical verb exists and a menu handler does not implement the canonical verb, it must return a failure code to enable the next handler to be able to handle this verb. Failing to do this will break functionality in the system including <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-shellexecutea">ShellExecute</a>.
     * 
     * Alternatively, rather than a pointer, this parameter can be <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a>(offset) where <i>offset</i> is the menu-identifier offset of the command to carry out. Implementations can use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-is_intresource">IS_INTRESOURCE</a> macro to detect that this alternative is being employed. The Shell uses this alternative when the user chooses a menu command.
     */
    lpVerb : PSTR

    /**
     * Type: <b>LPCSTR</b>
     * 
     * An optional string containing parameters that are passed to the command. The format of this string is determined by the command that is to be invoked. This member is always <b>NULL</b> for menu items inserted by a Shell extension.
     */
    lpParameters : PSTR

    /**
     * Type: <b>LPCSTR</b>
     * 
     * An optional working directory name. This member is always <b>NULL</b> for menu items inserted by a Shell extension.
     */
    lpDirectory : PSTR

    /**
     * Type: <b>int</b>
     * 
     * A set of SW_ values to pass to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-showwindow">ShowWindow</a> function if the command displays a window or starts an application.
     */
    nShow : Int32

    /**
     * Type: <b>DWORD</b>
     * 
     * An optional keyboard shortcut to assign to any application activated by the command. If the <b>fMask</b> parameter does not specify <b>CMIC_MASK_HOTKEY</b>, this member is ignored.
     */
    dwHotKey : UInt32

    /**
     * Type: <b>HANDLE</b>
     * 
     * An icon to use for any application activated by the command. If the <b>fMask</b> member does not specify <b>CMIC_MASK_ICON</b>, this member is ignored.
     */
    hIcon : HANDLE

}
