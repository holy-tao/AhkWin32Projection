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
     * @see https://learn.microsoft.com/windows/win32/ktop-src/TaskSchd/taskschedulerschema-startboundary-triggerbasetype-element
     */
    Start(szUrl, pOIProtSink, pOIBindInfo, grfPI, dwReserved) {
        szUrl := szUrl is String ? StrPtr(szUrl) : szUrl
        dwReserved := dwReserved is Win32Handle ? NumGet(dwReserved, "ptr") : dwReserved

        result := ComCall(3, this, "ptr", szUrl, "ptr", pOIProtSink, "ptr", pOIBindInfo, "uint", grfPI, "ptr", dwReserved, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/debugapi/nf-debugapi-continuedebugevent
     */
    Continue(pProtocolData) {
        result := ComCall(4, this, "ptr", pProtocolData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/wingdi/nf-wingdi-abortdoc
     */
    Abort(hrReason, dwOptions) {
        result := ComCall(5, this, "int", hrReason, "uint", dwOptions, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Eliminates the cache and ends asynchronous I/O with the DLL.
     * @param {Integer} dwOptions 
     * @returns {HRESULT} Returns <b>TRUE</b> if the function succeeds; otherwise, it returns <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/filehc/nf-filehc-terminatecache
     */
    Terminate(dwOptions) {
        result := ComCall(6, this, "uint", dwOptions, "int")
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
        result := ComCall(7, this, "int")
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
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
