#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISpNotifySink.ahk" { ISpNotifySink }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpThreadControl extends ISpNotifySink {
    /**
     * The interface identifier for ISpThreadControl
     * @type {Guid}
     */
    static IID := Guid("{a6be4d73-4403-4358-b22d-0346e23b1764}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpThreadControl interfaces
    */
    struct Vtbl extends ISpNotifySink.Vtbl {
        StartThread         : IntPtr
        WaitForThreadDone   : IntPtr
        TerminateThread     : IntPtr
        ThreadHandle        : IntPtr
        ThreadId            : IntPtr
        NotifyEvent         : IntPtr
        WindowHandle        : IntPtr
        ThreadCompleteEvent : IntPtr
        ExitThreadEvent     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpThreadControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HWND} 
     */
    StartThread(dwFlags) {
        phwnd := HWND()
        result := ComCall(4, this, "uint", dwFlags, HWND.Ptr, phwnd, "HRESULT")
        return phwnd
    }

    /**
     * 
     * @param {BOOL} fForceStop 
     * @param {Integer} msTimeOut 
     * @returns {HRESULT} 
     */
    WaitForThreadDone(fForceStop, msTimeOut) {
        result := ComCall(5, this, BOOL, fForceStop, "int*", &phrThreadResult := 0, "uint", msTimeOut, "HRESULT")
        return phrThreadResult
    }

    /**
     * Terminates a thread.
     * @remarks
     * <b>TerminateThread</b> is used to cause a thread to exit. When this occurs, the target thread has no chance to execute any user-mode code. DLLs attached to the thread are not notified that the thread is terminating. The system frees the thread's initial stack.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>The target thread's initial stack is not freed, causing a resource leak.
     * 
     * <b>TerminateThread</b> is a dangerous function that should only be used in the most extreme cases. You should call 
     * <b>TerminateThread</b> only if you know exactly what the target thread is doing, and you control all of the code that the target thread could possibly be running at the time of the termination. For example, 
     * <b>TerminateThread</b> can result in the following problems:
     * 
     * <ul>
     * <li>If the target thread owns a critical section, the critical section will not be released.</li>
     * <li>If the target thread is allocating memory from the heap, the heap lock will not be released.</li>
     * <li>If the target thread is executing certain kernel32 calls when it is terminated, the kernel32 state for the thread's process could be inconsistent.</li>
     * <li>If the target thread is manipulating the global state of a shared DLL, the state of the DLL could be destroyed, affecting other users of the DLL.</li>
     * </ul>
     * A thread cannot protect itself against 
     * <b>TerminateThread</b>, other than by controlling access to its handles. The thread handle returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createthread">CreateThread</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a> functions has <b>THREAD_TERMINATE</b> access, so any caller holding one of these handles can terminate your thread.
     * 
     * If the target thread is the last thread of a process when this function is called, the thread's process is also terminated.
     * 
     * The state of the thread object becomes signaled, releasing any other threads that had been waiting for the thread to terminate. The thread's termination status changes from <b>STILL_ACTIVE</b> to the value of the <i>dwExitCode</i> parameter.
     * 
     * Terminating a thread does not necessarily remove the thread object from the system. A thread object is deleted when the last thread handle is closed.
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-terminatethread
     */
    TerminateThread() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HANDLE} 
     */
    ThreadHandle() {
        result := ComCall(7, this, HANDLE.Owned)
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    ThreadId() {
        result := ComCall(8, this, UInt32)
        return result
    }

    /**
     * 
     * @returns {HANDLE} 
     */
    NotifyEvent() {
        result := ComCall(9, this, HANDLE.Owned)
        return result
    }

    /**
     * 
     * @returns {HWND} 
     */
    WindowHandle() {
        result := ComCall(10, this, HWND)
        return result
    }

    /**
     * 
     * @returns {HANDLE} 
     */
    ThreadCompleteEvent() {
        result := ComCall(11, this, HANDLE.Owned)
        return result
    }

    /**
     * 
     * @returns {HANDLE} 
     */
    ExitThreadEvent() {
        result := ComCall(12, this, HANDLE.Owned)
        return result
    }

    Query(iid) {
        if (ISpThreadControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.StartThread := CallbackCreate(GetMethod(implObj, "StartThread"), flags, 3)
        this.vtbl.WaitForThreadDone := CallbackCreate(GetMethod(implObj, "WaitForThreadDone"), flags, 4)
        this.vtbl.TerminateThread := CallbackCreate(GetMethod(implObj, "TerminateThread"), flags, 1)
        this.vtbl.ThreadHandle := CallbackCreate(GetMethod(implObj, "ThreadHandle"), flags, 1)
        this.vtbl.ThreadId := CallbackCreate(GetMethod(implObj, "ThreadId"), flags, 1)
        this.vtbl.NotifyEvent := CallbackCreate(GetMethod(implObj, "NotifyEvent"), flags, 1)
        this.vtbl.WindowHandle := CallbackCreate(GetMethod(implObj, "WindowHandle"), flags, 1)
        this.vtbl.ThreadCompleteEvent := CallbackCreate(GetMethod(implObj, "ThreadCompleteEvent"), flags, 1)
        this.vtbl.ExitThreadEvent := CallbackCreate(GetMethod(implObj, "ExitThreadEvent"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.StartThread)
        CallbackFree(this.vtbl.WaitForThreadDone)
        CallbackFree(this.vtbl.TerminateThread)
        CallbackFree(this.vtbl.ThreadHandle)
        CallbackFree(this.vtbl.ThreadId)
        CallbackFree(this.vtbl.NotifyEvent)
        CallbackFree(this.vtbl.WindowHandle)
        CallbackFree(this.vtbl.ThreadCompleteEvent)
        CallbackFree(this.vtbl.ExitThreadEvent)
    }
}
