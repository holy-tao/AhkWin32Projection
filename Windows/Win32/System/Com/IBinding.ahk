#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IBinding extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBinding
     * @type {Guid}
     */
    static IID => Guid("{79eac9c0-baf9-11ce-8c82-00aa004ba90b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Abort", "Suspend", "Resume", "SetPriority", "GetPriority", "GetBindResult"]

    /**
     * The AbortDoc function stops the current print job and erases everything drawn since the last call to the StartDoc function.
     * @remarks
     * <div class="alert"><b>Note</b>  This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation—factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.</div>
     * <div> </div>
     * Applications should call the <b>AbortDoc</b> function to stop a print job if an error occurs, or to stop a print job after the user cancels that job. To end a successful print job, an application should call the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-enddoc">EndDoc</a> function.
     * 
     * If Print Manager was used to start the print job, calling <b>AbortDoc</b> erases the entire spool job, so that the printer receives nothing. If Print Manager was not used to start the print job, the data may already have been sent to the printer. In this case, the printer driver resets the printer (when possible) and ends the print job.
     * @returns {HRESULT} If the function succeeds, the return value is greater than zero.
     * 
     * If the function fails, the return value is SP_ERROR.
     * @see https://learn.microsoft.com/windows/win32/api//content/wingdi/nf-wingdi-abortdoc
     */
    Abort() {
        result := ComCall(3, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Notifies the system that the app has saved its data and is ready to be suspended.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.suspendingdeferral.complete
     */
    Suspend() {
        result := ComCall(4, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Resume method resumes playback after a menu has been displayed.
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/resume-method
     */
    Resume() {
        result := ComCall(5, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the priority class for the specified process. This value together with the priority value of each thread of the process determines each thread's base priority level.
     * @remarks
     * Every thread has a base priority level determined by the thread's priority value and the priority class of its process. The system uses the base priority level of all executable threads to determine which thread gets the next slice of CPU time. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-setthreadpriority">SetThreadPriority</a> function enables setting the base priority level of a thread relative to the priority class of its process. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/scheduling-priorities">Scheduling Priorities</a>.
     * 
     * The <b>*_PRIORITY_CLASS</b> values affect the CPU scheduling priority of the process. For processes that perform background work such as file I/O, network I/O, or data processing, it is not sufficient to adjust the CPU scheduling priority; even an idle CPU priority process can easily interfere with system responsiveness when it uses the disk and memory. Processes that perform background work should use the <b>PROCESS_MODE_BACKGROUND_BEGIN</b> and <b>PROCESS_MODE_BACKGROUND_END</b> values to adjust their resource scheduling priorities; processes that interact with the user should not use <b>PROCESS_MODE_BACKGROUND_BEGIN</b>.
     * 
     * If a process is in background processing mode, the new threads it creates will also be in background processing mode. When a thread is in background processing mode, it should minimize sharing resources such as critical sections, heaps, and handles with other threads in the process, otherwise priority inversions can occur. If there are threads executing at high priority, a thread in background processing mode may not be scheduled promptly, but it will never be starved.
     * 
     * Each  thread can enter background processing mode independently using <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-setthreadpriority">SetThreadPriority</a>. Do not call <b>SetPriorityClass</b> to enter background processing mode after a thread in the process has called <b>SetThreadPriority</b> to enter background processing mode. After a process ends background processing mode, it resets all threads in the process; however, it is not possible for the process to know which threads were already in background processing mode.
     * @param {Integer} nPriority 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/processthreadsapi/nf-processthreadsapi-setpriorityclass
     */
    SetPriority(nPriority) {
        result := ComCall(6, this, "int", nPriority, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the priority class for the specified process. This value, together with the priority value of each thread of the process, determines each thread's base priority level.
     * @remarks
     * Every thread has a base priority level determined by the thread's priority value and the priority class of its process. The operating system uses the base priority level of all executable threads to determine which thread gets the next slice of CPU time. Threads are scheduled in a round-robin fashion at each priority level, and only when there are no executable threads at a higher level will scheduling of threads at a lower level take place.
     * 
     * For a table that shows the base priority levels for each combination of priority class and thread priority value, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/scheduling-priorities">Scheduling Priorities</a>.
     * 
     * Priority class is maintained by the executive, so all processes have a priority class that can be queried.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/processthreadsapi/nf-processthreadsapi-getpriorityclass
     */
    GetPriority() {
        result := ComCall(7, this, "int*", &pnPriority := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pnPriority
    }

    /**
     * 
     * @param {Pointer<Guid>} pclsidProtocol 
     * @param {Pointer<Integer>} pdwResult 
     * @param {Pointer<PWSTR>} pszResult 
     * @param {Pointer<Integer>} pdwReserved 
     * @returns {HRESULT} 
     */
    GetBindResult(pclsidProtocol, pdwResult, pszResult, pdwReserved) {
        pdwResultMarshal := pdwResult is VarRef ? "uint*" : "ptr"
        pszResultMarshal := pszResult is VarRef ? "ptr*" : "ptr"
        pdwReservedMarshal := pdwReserved is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "ptr", pclsidProtocol, pdwResultMarshal, pdwResult, pszResultMarshal, pszResult, pdwReservedMarshal, pdwReserved, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
