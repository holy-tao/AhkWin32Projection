#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IInternetProtocolRoot extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInternetProtocolRoot
     * @type {Guid}
     */
    static IID => Guid("{79eac9e3-baf9-11ce-8c82-00aa004ba90b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Start", "Continue", "Abort", "Terminate", "Suspend", "Resume"]

    /**
     * Specifies the date and time when the trigger is activated.
     * @remarks
     * The **&lt;StartBoundary&gt;** element is a required element for time and calendar triggers ([**&lt;TimeTrigger&gt;**](taskschedulerschema-timetrigger-triggergroup-element.md) and [**&lt;CalendarTrigger&gt;**](taskschedulerschema-calendartrigger-triggergroup-element.md)).
     * 
     * For scripting development, the end boundary is specified using the [**Trigger.StartBoundary**](trigger-startboundary.md) property that is inherited by the all trigger objects.
     * 
     * For C++ development, the end boundary is specified using the [**ITrigger::StartBoundary**](/windows/desktop/api/taskschd/nf-taskschd-itrigger-get_startboundary) property that is inherited by the all trigger interfaces.
     * @param {PWSTR} szUrl 
     * @param {IInternetProtocolSink} pOIProtSink 
     * @param {IInternetBindInfo} pOIBindInfo 
     * @param {Integer} grfPI 
     * @param {HANDLE_PTR} dwReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/TaskSchd/taskschedulerschema-startboundary-triggerbasetype-element
     */
    Start(szUrl, pOIProtSink, pOIBindInfo, grfPI, dwReserved) {
        szUrl := szUrl is String ? StrPtr(szUrl) : szUrl

        result := ComCall(3, this, "ptr", szUrl, "ptr", pOIProtSink, "ptr", pOIBindInfo, "uint", grfPI, "ptr", dwReserved, "HRESULT")
        return result
    }

    /**
     * Enables a debugger to continue a thread that previously reported a debugging event.
     * @remarks
     * Only the thread that created <i>dwProcessId</i> with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a> function can call 
     * <b>ContinueDebugEvent</b>.
     * 
     * After the 
     * <b>ContinueDebugEvent</b> function succeeds, the specified thread continues. Depending on the debugging event previously reported by the thread, different actions occur. If the continued thread previously reported an EXIT_THREAD_DEBUG_EVENT debugging event, 
     * <b>ContinueDebugEvent</b> closes the handle the debugger has to the thread. If the continued thread previously reported an EXIT_PROCESS_DEBUG_EVENT debugging event, 
     * <b>ContinueDebugEvent</b> closes the handles the debugger has to the process and to the thread.
     * @param {Pointer<PROTOCOLDATA>} pProtocolData 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/debugapi/nf-debugapi-continuedebugevent
     */
    Continue(pProtocolData) {
        result := ComCall(4, this, "ptr", pProtocolData, "HRESULT")
        return result
    }

    /**
     * The AbortDoc function stops the current print job and erases everything drawn since the last call to the StartDoc function.
     * @remarks
     * <div class="alert"><b>Note</b>  This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation—factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.</div>
     * <div> </div>
     * Applications should call the <b>AbortDoc</b> function to stop a print job if an error occurs, or to stop a print job after the user cancels that job. To end a successful print job, an application should call the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-enddoc">EndDoc</a> function.
     * 
     * If Print Manager was used to start the print job, calling <b>AbortDoc</b> erases the entire spool job, so that the printer receives nothing. If Print Manager was not used to start the print job, the data may already have been sent to the printer. In this case, the printer driver resets the printer (when possible) and ends the print job.
     * @param {HRESULT} hrReason 
     * @param {Integer} dwOptions 
     * @returns {HRESULT} If the function succeeds, the return value is greater than zero.
     * 
     * If the function fails, the return value is SP_ERROR.
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-abortdoc
     */
    Abort(hrReason, dwOptions) {
        result := ComCall(5, this, "int", hrReason, "uint", dwOptions, "HRESULT")
        return result
    }

    /**
     * Eliminates the cache and ends asynchronous I/O with the DLL.
     * @param {Integer} dwOptions 
     * @returns {HRESULT} Returns <b>TRUE</b> if the function succeeds; otherwise, it returns <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/filehc/nf-filehc-terminatecache
     */
    Terminate(dwOptions) {
        result := ComCall(6, this, "uint", dwOptions, "HRESULT")
        return result
    }

    /**
     * Suspends the specified thread.
     * @remarks
     * If the function succeeds, execution of the specified thread is suspended and the thread's suspend count is incremented. Suspending a thread causes the thread to stop executing user-mode (application) code.
     * 
     * This function is primarily designed for use by debuggers. It is not intended to be used for thread synchronization. Calling 
     * <b>SuspendThread</b> on a thread that owns a synchronization object, such as a mutex or critical section, can lead to a deadlock if the calling thread tries to obtain a synchronization object owned by a suspended thread. To avoid this situation, a thread within an application that is not a debugger should signal the other thread to suspend itself. The target thread must be designed to watch for this signal and respond appropriately.
     * 
     * Each thread has a suspend count (with a maximum value of <b>MAXIMUM_SUSPEND_COUNT</b>). If the suspend count is greater than zero, the thread is suspended; otherwise, the thread is not suspended and is eligible for execution. Calling 
     * <b>SuspendThread</b> causes the target thread's suspend count to be incremented. Attempting to increment past the maximum suspend count causes an error without incrementing the count.
     * 
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-resumethread">ResumeThread</a> function decrements the suspend count of a suspended thread.
     * 
     * <b>Windows Phone 8.1:</b> This function is supported for Windows Phone Store apps on Windows Phone 8.1 and later.
     * 
     * <b>Windows 8.1</b> and <b>Windows Server 2012 R2</b>: This function is supported for Windows Store apps on Windows 8.1, Windows Server 2012 R2, and later.
     * @returns {HRESULT} If the function succeeds, the return value is the thread's previous suspend count; otherwise, it is <c>(DWORD) -1</c>. To get extended error information, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-suspendthread
     */
    Suspend() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * The Resume method resumes playback after a menu has been displayed.
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/resume-method
     */
    Resume() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
