#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information needed by IContextMenu::InvokeCommand to invoke a shortcut menu command.
 * @remarks
 * Although the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icontextmenu-invokecommand">IContextMenu::InvokeCommand</a> declaration specifies a <b>CMINVOKECOMMANDINFO</b> structure for the <i>pici</i> parameter, it can also accept a <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-cminvokecommandinfoex">CMINVOKECOMMANDINFOEX</a> structure. If you are implementing this method, you must inspect <b>cbSize</b> to determine which structure has been passed.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-cminvokecommandinfo
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class CMINVOKECOMMANDINFO extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of this structure, in bytes.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Zero, or one or more of the following flags.
     * @type {Integer}
     */
    fMask {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the window that is the owner of the shortcut menu. An extension can also use this handle as the owner of any message boxes or dialog boxes it displays.
     * @type {Pointer<Ptr>}
     */
    hwnd {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

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
     * @type {Pointer<Ptr>}
     */
    lpVerb {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b>LPCSTR</b>
     * 
     * An optional string containing parameters that are passed to the command. The format of this string is determined by the command that is to be invoked. This member is always <b>NULL</b> for menu items inserted by a Shell extension.
     * @type {Pointer<Ptr>}
     */
    lpParameters {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b>LPCSTR</b>
     * 
     * An optional working directory name. This member is always <b>NULL</b> for menu items inserted by a Shell extension.
     * @type {Pointer<Ptr>}
     */
    lpDirectory {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: <b>int</b>
     * 
     * A set of SW_ values to pass to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-showwindow">ShowWindow</a> function if the command displays a window or starts an application.
     * @type {Integer}
     */
    nShow {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * An optional keyboard shortcut to assign to any application activated by the command. If the <b>fMask</b> parameter does not specify <b>CMIC_MASK_HOTKEY</b>, this member is ignored.
     * @type {Integer}
     */
    dwHotKey {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Type: <b>HANDLE</b>
     * 
     * An icon to use for any application activated by the command. If the <b>fMask</b> member does not specify <b>CMIC_MASK_ICON</b>, this member is ignored.
     * @type {Pointer<Ptr>}
     */
    hIcon {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 56
    }
}
