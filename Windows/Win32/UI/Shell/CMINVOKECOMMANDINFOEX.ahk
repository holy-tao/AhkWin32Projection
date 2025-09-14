#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\POINT.ahk

/**
 * Contains extended information about a shortcut menu command. This structure is an extended version of CMINVOKECOMMANDINFO that allows the use of Unicode values.
 * @remarks
 * Although the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icontextmenu-invokecommand">IContextMenu::InvokeCommand</a> declaration specifies a <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-cminvokecommandinfo">CMINVOKECOMMANDINFO</a> structure for the <i>pici</i> parameter, it can also accept a <b>CMINVOKECOMMANDINFOEX</b> structure. If you are implementing this method, you must inspect <b>cbSize</b> to determine which structure has been passed. 
  * 			
  * 
  * By default, all 16-bit Windows-based applications run as threads in a single, shared VDM. The advantage of running separately is that a crash only terminates the single VDM; any other programs running in distinct VDMs continue to function normally. Also, 16-bit Windows-based applications that are run in separate VDMs have separate input queues. That means that if one application stops responding momentarily, applications in separate VDMs continue to receive input. The disadvantage of running separately is that it takes significantly more memory to do so.
  * 
  * <b>CMINVOKECOMMANDINFOEX</b> itself is defined in Shobjidl.h, but you must also include Shellapi.h to have full access to all flags.
  * 
  * <div class="alert"><b>Note</b>  Prior to Windows Vista, this structure was declared in Shlobj.h.</div>
  * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-cminvokecommandinfoex
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class CMINVOKECOMMANDINFOEX extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of this structure, in bytes. This member should be filled in by callers of <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icontextmenu-invokecommand">IContextMenu::InvokeCommand</a> and tested by the implementations to know that the structure is a <b>CMINVOKECOMMANDINFOEX</b> structure rather than <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-cminvokecommandinfo">CMINVOKECOMMANDINFO</a>.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Zero, or one or more of the following flags are set to indicate desired behavior and indicate that other fields in the structure are to be used.
     * @type {Integer}
     */
    fMask {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the window that is the owner of the shortcut menu. An extension can also use this handle as the owner of any message boxes or dialog boxes it displays. Callers must specify a legitimate HWND that can be used as the owner window for any UI that may be displayed. Failing to specify an HWND when calling from a UI thread (one with windows already created) will result in reentrancy and possible bugs in the implementation of a <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icontextmenu-invokecommand">IContextMenu::InvokeCommand</a> call.
     * @type {Pointer<HWND>}
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
     * @type {Pointer<PSTR>}
     */
    lpVerb {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b>LPCSTR</b>
     * 
     * Optional parameters. This member is always <b>NULL</b> for menu items inserted by a Shell extension.
     * @type {Pointer<PSTR>}
     */
    lpParameters {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b>LPCSTR</b>
     * 
     * An optional working directory name. This member is always <b>NULL</b> for menu items inserted by a Shell extension.
     * @type {Pointer<PSTR>}
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
     * An optional keyboard shortcut to assign to any application activated by the command. If the 
     *     					<b>fMask</b> member does not specify <b>CMIC_MASK_HOTKEY</b>, this member is ignored.
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
     * @type {Pointer<HANDLE>}
     */
    hIcon {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Type: <b>LPCSTR</b>
     * 
     * An ASCII title.
     * @type {Pointer<PSTR>}
     */
    lpTitle {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Type: <b>LPCWSTR</b>
     * 
     * A Unicode verb, for those commands that can use it.
     * @type {Pointer<PWSTR>}
     */
    lpVerbW {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Type: <b>LPCWSTR</b>
     * 
     * A Unicode parameters, for those commands that can use it.
     * @type {Pointer<PWSTR>}
     */
    lpParametersW {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Type: <b>LPCWSTR</b>
     * 
     * A Unicode directory, for those commands that can use it.
     * @type {Pointer<PWSTR>}
     */
    lpDirectoryW {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Type: <b>LPCWSTR</b>
     * 
     * A Unicode title.
     * @type {Pointer<PWSTR>}
     */
    lpTitleW {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a></b>
     * 
     * The point where the command is invoked. If the <b>fMask</b> member does not specify <b>CMIC_MASK_PTINVOKE</b>, this member is ignored. This member is not valid prior to Internet Explorer 4.0.
     * @type {POINT}
     */
    ptInvoke{
        get {
            if(!this.HasProp("__ptInvoke"))
                this.__ptInvoke := POINT(this.ptr + 96)
            return this.__ptInvoke
        }
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 104
    }
}
