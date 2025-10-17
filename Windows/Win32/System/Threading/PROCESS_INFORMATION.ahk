#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * Contains information about a newly created process and its primary thread. It is used with the CreateProcess, CreateProcessAsUser, CreateProcessWithLogonW, or CreateProcessWithTokenW function.
 * @remarks
 * 
  * If the function succeeds, be sure to call the <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> function to close the <b>hProcess</b> and <b>hThread</b> handles when you are finished with them. Otherwise, when the child process exits, the system cannot clean up the process structures for the child process because the parent process still has open handles to the child process. However, the system will close these handles when the parent process terminates, so the structures related to the child process object would be cleaned up at this point.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/ns-processthreadsapi-process_information
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class PROCESS_INFORMATION extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A handle to the newly created process. The handle is used to specify the process in all functions that perform operations on the process object.
     * @type {HANDLE}
     */
    hProcess{
        get {
            if(!this.HasProp("__hProcess"))
                this.__hProcess := HANDLE(0, this)
            return this.__hProcess
        }
    }

    /**
     * A handle to the primary thread of the newly created process. The handle is used to specify the thread in all functions that perform operations on the thread object.
     * @type {HANDLE}
     */
    hThread{
        get {
            if(!this.HasProp("__hThread"))
                this.__hThread := HANDLE(8, this)
            return this.__hThread
        }
    }

    /**
     * A value that can be used to identify a process. The value is valid from the time the process is created until all handles to the process are closed and the process object is freed; at this point, the identifier may be reused.
     * @type {Integer}
     */
    dwProcessId {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A value that can be used to identify a thread. The value is valid from the time the thread is created until all handles to the thread are closed and the thread object is freed; at this point, the identifier may be reused.
     * @type {Integer}
     */
    dwThreadId {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
