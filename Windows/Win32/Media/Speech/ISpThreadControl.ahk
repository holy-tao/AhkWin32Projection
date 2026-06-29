#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\ISpNotifySink.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class ISpThreadControl extends ISpNotifySink {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpThreadControl
     * @type {Guid}
     */
    static IID => Guid("{a6be4d73-4403-4358-b22d-0346e23b1764}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StartThread", "WaitForThreadDone", "TerminateThread", "ThreadHandle", "ThreadId", "NotifyEvent", "WindowHandle", "ThreadCompleteEvent", "ExitThreadEvent"]

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HWND} 
     */
    StartThread(dwFlags) {
        phwnd := HWND()
        result := ComCall(4, this, "uint", dwFlags, "ptr", phwnd, "HRESULT")
        return phwnd
    }

    /**
     * 
     * @param {BOOL} fForceStop 
     * @param {Integer} msTimeOut 
     * @returns {HRESULT} 
     */
    WaitForThreadDone(fForceStop, msTimeOut) {
        result := ComCall(5, this, "int", fForceStop, "int*", &phrThreadResult := 0, "uint", msTimeOut, "HRESULT")
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
        result := ComCall(7, this, "ptr")
        resultHandle := HANDLE({Value: result}, True)
        return resultHandle
    }

    /**
     * 
     * @returns {Integer} 
     */
    ThreadId() {
        result := ComCall(8, this, "uint")
        return result
    }

    /**
     * 
     * @returns {HANDLE} 
     */
    NotifyEvent() {
        result := ComCall(9, this, "ptr")
        resultHandle := HANDLE({Value: result}, True)
        return resultHandle
    }

    /**
     * 
     * @returns {HWND} 
     */
    WindowHandle() {
        result := ComCall(10, this, "ptr")
        resultHandle := HWND({Value: result}, True)
        return resultHandle
    }

    /**
     * 
     * @returns {HANDLE} 
     */
    ThreadCompleteEvent() {
        result := ComCall(11, this, "ptr")
        resultHandle := HANDLE({Value: result}, True)
        return resultHandle
    }

    /**
     * 
     * @returns {HANDLE} 
     */
    ExitThreadEvent() {
        result := ComCall(12, this, "ptr")
        resultHandle := HANDLE({Value: result}, True)
        return resultHandle
    }
}
