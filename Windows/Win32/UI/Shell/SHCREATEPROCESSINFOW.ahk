#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * Contains the information needed by SHCreateProcessAsUserW to create a process.
 * @remarks
 * To include double quotation marks in <b>pszParameters</b>, you must enclose each mark in a pair of quotation marks, as in the following example:
 * 
 * 				
 * 
 * 
 * ```
 * sei.lpParameters = "An example: \"\"\"quoted text\"\"\"";
 * ```
 * 
 * 
 * In this case, the application receives three parameters: <i>An, example:, and "quoted text"</i>.
 * @see https://learn.microsoft.com/windows/win32/api/shellapi/ns-shellapi-shcreateprocessinfow
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SHCREATEPROCESSINFOW extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>ULONG</b>
     * @type {Integer}
     */
    fMask {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>HWND</b>
     * 
     * A parent window handle.
     * @type {HWND}
     */
    hwnd{
        get {
            if(!this.HasProp("__hwnd"))
                this.__hwnd := HWND(8, this)
            return this.__hwnd
        }
    }

    /**
     * Type: <b>LPCWSTR</b>
     * 
     * A pointer to a null-terminated Unicode string that specifies the executable file on which <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-shcreateprocessasuserw">SHCreateProcessAsUserW</a> will perform the action specified by the <b>runas</b> verb. The <b>runas</b> verb must be supported by the file's class.
     * 
     * <div class="alert"><b>Note</b>   If the path is not included with the file name, the current directory is assumed.</div>
     * <div> </div>
     * @type {PWSTR}
     */
    pszFile {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b>LPCWSTR</b>
     * 
     * A pointer to a null-terminated Unicode string containing the application parameters. The parameters must be separated by spaces.
     * @type {PWSTR}
     */
    pszParameters {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b>LPCWSTR</b>
     * 
     * A null-terminated Unicode string that contains the current directory.
     * @type {PWSTR}
     */
    pszCurrentDirectory {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: <b>HANDLE</b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-tokens">Access token</a> that can be used to represent a particular user. It is needed when there are multiple users for those folders that are treated as belonging to a single user. The calling application must have appropriate security privileges for the particular user, including TOKEN_QUERY and TOKEN_IMPERSONATE, and the user's registry hive must be currently mounted. For further discussion of access control issues, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control">Access Control</a>.
     * @type {HANDLE}
     */
    hUserToken{
        get {
            if(!this.HasProp("__hUserToken"))
                this.__hUserToken := HANDLE(40, this)
            return this.__hUserToken
        }
    }

    /**
     * Type: <b>LPSECURITY_ATTRIBUTES</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure with the security descriptor for the new process. It also specifies whether a child process can be inherited. If this parameter is set to <b>NULL</b>, the process will have a default security descriptor and the handle cannot be inherited.
     * 
     * <b>Security Warning:  </b>Using a security descriptor incorrectly can compromise the security of your application. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a>.
     * @type {Pointer<SECURITY_ATTRIBUTES>}
     */
    lpProcessAttributes {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Type: <b>LPSECURITY_ATTRIBUTES</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure with the security descriptor for the new thread. It also specifies whether a child process can be inherited. If this parameter is set to <b>NULL</b>, the process will have a default security descriptor and the handle cannot be inherited.
     * 
     * <b>Security Warning:  </b>Using a security descriptor incorrectly can compromise the security of your application. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a>.
     * @type {Pointer<SECURITY_ATTRIBUTES>}
     */
    lpThreadAttributes {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * An indicator for whether the new process inherits handles from the calling process. If set to <b>TRUE</b>, each inheritable open handle in the calling process is inherited by the new process. Inherited handles have the same value and access privileges as the original handles.
     * @type {BOOL}
     */
    bInheritHandles {
        get => NumGet(this, 64, "int")
        set => NumPut("int", value, this, 64)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Flags that control the creation of the process and the priority class. For a list of the available flags, see <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessasusera">CreateProcessAsUser</a>.
     * @type {Integer}
     */
    dwCreationFlags {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * Type: <b>LPSTARTUPINFOW</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/ns-processthreadsapi-startupinfoa">STARTUPINFO</a> structure that specifies how the main window for the new process should appear.
     * @type {Pointer<STARTUPINFOW>}
     */
    lpStartupInfo {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Type: <b>LPPROCESS_INFORMATION</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/processthreadsapi/ns-processthreadsapi-process_information">PROCESS_INFORMATION</a> structure that receives information about the new process. Set this member to a valid structure pointer, and set the SEE_MASK_NOCLOSEPROCESS flag in the <b>fMask</b> member, and the process will remain open when the function returns. The <b>PROCESS_INFORMATION</b> structure's <b>hProcess</b> and <b>hThread</b> members will then hold the process and thread handles, respectively. Set this member to <b>NULL</b>, and the process will be closed before the function returns.
     * @type {Pointer<PROCESS_INFORMATION>}
     */
    lpProcessInformation {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 88
    }
}
