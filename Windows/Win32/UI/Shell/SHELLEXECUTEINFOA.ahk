#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include ..\..\Foundation\HINSTANCE.ahk
#Include ..\..\System\Registry\HKEY.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * Contains information used by ShellExecuteEx. (ANSI)
 * @remarks
 * The <b>SEE_MASK_NOASYNC</b> flag must be specified if the thread calling <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-shellexecuteexa">ShellExecuteEx</a> does not have a message loop or if the thread or process will terminate soon after <b>ShellExecuteEx</b> returns. Under such conditions, the calling thread will not be available to complete the DDE conversation, so it is important that <b>ShellExecuteEx</b> complete the conversation before returning control to the calling application. Failure to complete the conversation can result in an unsuccessful launch of the document.
  * 
  * If the calling thread has a message loop and will exist for some time after the call to <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-shellexecuteexa">ShellExecuteEx</a> returns, the <b>SEE_MASK_NOASYNC</b> flag is optional. If the flag is omitted, the calling thread's message pump will be used to complete the DDE conversation. The calling application regains control sooner, since the DDE conversation can be completed in the background.
  * 
  * To include double quotation marks in <b>lpParameters</b>, enclose each mark in a pair of quotation marks, as in the following example.
  * 
  * ``` cpp
  * sei.lpParameters = "An example: \"\"\"quoted text\"\"\"";
  * ```
  * 
  * In this case, the application receives three parameters: <i>An</i>, <i>example:</i>, and <i>"quoted text"</i>.
  * 
  * > [!NOTE]
  * > The shellapi.h header defines SHELLEXECUTEINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/shellapi/ns-shellapi-shellexecuteinfoa
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 * @charset ANSI
 */
class SHELLEXECUTEINFOA extends Win32Struct
{
    static sizeof => 104

    static packingSize => 1

    /**
     * Type: <b>DWORD</b>
     * 
     * Required. The size of this structure, in bytes.
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
     * Optional. A handle to the owner window, used to display and position any UI that the system might produce while executing this function.
     * @type {HWND}
     */
    hwnd{
        get {
            if(!this.HasProp("__hwnd"))
                this.__hwnd := HWND(this.ptr + 8)
            return this.__hwnd
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * A string, referred to as a <i>verb</i>, that specifies the action to be performed. The set of available verbs depends on the particular file or folder. Generally, the actions available from an object's shortcut menu are available verbs. This parameter can be <b>NULL</b>, in which case the default verb is used if available. If not, the "open" verb is used. If neither verb is available, the system uses the first verb listed in the registry. The following verbs are commonly used:
     * 
     * - **edit**: Launches an editor and opens the document for editing. If <b>lpFile</b> is not a document file, the function will fail.
     * - **explore**: Explores the folder specified by <b>lpFile</b>.
     * - **find**: Initiates a search starting from the specified directory.
     * - **open**: Opens the file specified by the <b>lpFile</b> parameter. The file can be an executable file, a document file, or a folder.
     * - **print**: Prints the document file specified by <b>lpFile</b>. If <b>lpFile</b> is not a document file, the function will fail.
     * - **properties**: Displays the file or folder's properties.
     * - **runas**: Launches an application as Administrator. User Account Control (UAC) will prompt the user for consent to run the application elevated or enter the credentials of an administrator account used to run the application.
     * @type {PSTR}
     */
    lpVerb{
        get {
            if(!this.HasProp("__lpVerb"))
                this.__lpVerb := PSTR(this.ptr + 16)
            return this.__lpVerb
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * The address of a null-terminated string that specifies the name of the file or object on which <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-shellexecuteexa">ShellExecuteEx</a> will perform the action specified by the <b>lpVerb</b> parameter. The system registry verbs that are supported by the <b>ShellExecuteEx</b> function include "open" for executable files and document files and "print" for document files for which a print handler has been registered. Other applications might have added Shell verbs through the system registry, such as "play" for .avi and .wav files. To specify a Shell namespace object, pass the fully qualified parse name and set the <b>SEE_MASK_INVOKEIDLIST</b> flag in the <b>fMask</b> parameter.
     * 
     * <div class="alert"><b>Note:</b> If the <b>SEE_MASK_INVOKEIDLIST</b> flag is set, you can use either <b>lpFile</b> or <b>lpIDList</b> to identify the item by its file system path or its PIDL respectively. One of the two values—<b>lpFile</b> or <b>lpIDList</b>—must be set.</div>
     * 
     * <div class="alert"><b>Note:</b> If the path is not included with the name, the current directory is assumed.</div>
     * @type {PSTR}
     */
    lpFile{
        get {
            if(!this.HasProp("__lpFile"))
                this.__lpFile := PSTR(this.ptr + 24)
            return this.__lpFile
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Optional. The address of a null-terminated string that contains the application parameters. The parameters must be separated by spaces. If the <b>lpFile</b> member specifies a document file, <b>lpParameters</b> should be <b>NULL</b>.
     * @type {PSTR}
     */
    lpParameters{
        get {
            if(!this.HasProp("__lpParameters"))
                this.__lpParameters := PSTR(this.ptr + 32)
            return this.__lpParameters
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Optional. The address of a null-terminated string that specifies the name of the working directory. If this member is <b>NULL</b>, the current directory is used as the working directory.
     * @type {PSTR}
     */
    lpDirectory{
        get {
            if(!this.HasProp("__lpDirectory"))
                this.__lpDirectory := PSTR(this.ptr + 40)
            return this.__lpDirectory
        }
    }

    /**
     * Type: <b>int</b>
     * 
     * Required. Flags that specify how an application is to be shown when it is opened; one of the SW_ values listed for the <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-shellexecutea">ShellExecute</a> function. If <b>lpFile</b> specifies a document file, the flag is simply passed to the associated application. It is up to the application to decide how to handle it.
     * @type {Integer}
     */
    nShow {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * Type: <b>HINSTANCE</b>
     * 
     * [out] If SEE_MASK_NOCLOSEPROCESS is set and the <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-shellexecuteexa">ShellExecuteEx</a> call succeeds, it sets this member to a value greater than 32. If the function fails, it is set to an SE_ERR_XXX error value that indicates the cause of the failure. Although <b>hInstApp</b> is declared as an HINSTANCE for compatibility with 16-bit Windows applications, it is not a true HINSTANCE. It can be cast only to an <b>int</b> and compared to either 32 or the following SE_ERR_XXX error codes.
     * 
     * <br/>
     * 
     * | Error Code | Reason |
     * | ---------- | ------ |
     * | SE_ERR_FNF (2) | File not found. |
     * | SE_ERR_PNF (3) | Path not found. |
     * | SE_ERR_ACCESSDENIED (5) | Access denied. |
     * | SE_ERR_OOM (8) | Out of memory. |
     * | SE_ERR_DLLNOTFOUND (32) | Dynamic-link library not found. |
     * | SE_ERR_SHARE (26) | Cannot share an open file. |
     * | SE_ERR_ASSOCINCOMPLETE (27) | File association information not complete. |
     * | SE_ERR_DDETIMEOUT (28) | DDE operation timed out. |
     * | SE_ERR_DDEFAIL (29) | DDE operation failed. |
     * | SE_ERR_DDEBUSY (30) | DDE operation is busy. |
     * | SE_ERR_NOASSOC (31) | File association not available. |
     * @type {HINSTANCE}
     */
    hInstApp{
        get {
            if(!this.HasProp("__hInstApp"))
                this.__hInstApp := HINSTANCE(this.ptr + 52)
            return this.__hInstApp
        }
    }

    /**
     * Type: <b>LPVOID</b>
     * 
     * The address of an absolute <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-itemidlist">ITEMIDLIST</a> structure (PCIDLIST_ABSOLUTE) to contain an item identifier list that uniquely identifies the file to execute. This member is ignored if the <b>fMask</b> member does not include <b>SEE_MASK_IDLIST</b> or <b>SEE_MASK_INVOKEIDLIST</b>.
     * @type {Pointer<Void>}
     */
    lpIDList {
        get => NumGet(this, 60, "ptr")
        set => NumPut("ptr", value, this, 60)
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * The address of a null-terminated string that specifies one of the following:
     * 
     * - A ProgId. For example, "Paint.Picture".</li>
     * - A URI protocol scheme. For example, "http".</li>
     * - A file extension. For example, ".txt".</li>
     * - A registry path under HKEY_CLASSES_ROOT that names a subkey that contains one or more Shell verbs. This key will have a subkey that conforms to the Shell verb registry schema, such as <b>shell</b>&#92;<i>verb name</i>.
     * 
     * This member is ignored if <b>fMask</b> does not include <b>SEE_MASK_CLASSNAME</b>.
     * @type {PSTR}
     */
    lpClass{
        get {
            if(!this.HasProp("__lpClass"))
                this.__lpClass := PSTR(this.ptr + 68)
            return this.__lpClass
        }
    }

    /**
     * Type: <b>HKEY</b>
     * 
     * A handle to the registry key for the file type. The access rights for this registry key should be set to KEY_READ. This member is ignored if <b>fMask</b> does not include <b>SEE_MASK_CLASSKEY</b>.
     * @type {HKEY}
     */
    hkeyClass{
        get {
            if(!this.HasProp("__hkeyClass"))
                this.__hkeyClass := HKEY(this.ptr + 76)
            return this.__hkeyClass
        }
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * A keyboard shortcut to associate with the application. The low-order word is the virtual key code, and the high-order word is a modifier flag (HOTKEYF_). For a list of modifier flags, see the description of the <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-sethotkey">WM_SETHOTKEY</a> message. This member is ignored if <b>fMask</b> does not include <b>SEE_MASK_HOTKEY</b>.
     * @type {Integer}
     */
    dwHotKey {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * @type {HANDLE}
     */
    hIcon{
        get {
            if(!this.HasProp("__hIcon"))
                this.__hIcon := HANDLE(this.ptr + 88)
            return this.__hIcon
        }
    }

    /**
     * @type {HANDLE}
     */
    hMonitor{
        get {
            if(!this.HasProp("__hMonitor"))
                this.__hMonitor := HANDLE(this.ptr + 88)
            return this.__hMonitor
        }
    }

    /**
     * Type: <b>HANDLE</b>
     * 
     * A handle to the newly started application. This member is set on return and is always <b>NULL</b> unless <b>fMask</b> is set to <b>SEE_MASK_NOCLOSEPROCESS</b>. Even if <b>fMask</b> is set to <b>SEE_MASK_NOCLOSEPROCESS</b>, <b>hProcess</b> will be <b>NULL</b> if no process was launched. For example, if a document to be launched is a URL and an instance of Internet Explorer is already running, it will display the document. No new process is launched, and <b>hProcess</b> will be <b>NULL</b>.
     * 
     * <div class="alert"><b>Note:</b> <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-shellexecuteexa">ShellExecuteEx</a> does not always return an <b>hProcess</b>, even if a process is launched as the result of the call. For example, an <b>hProcess</b> does not return when you use <b>SEE_MASK_INVOKEIDLIST</b> to invoke <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-icontextmenu">IContextMenu</a>.</div>
     * @type {HANDLE}
     */
    hProcess{
        get {
            if(!this.HasProp("__hProcess"))
                this.__hProcess := HANDLE(this.ptr + 96)
            return this.__hProcess
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
