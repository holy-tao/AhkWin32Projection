#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class IHostTask extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHostTask
     * @type {Guid}
     */
    static IID => Guid("{c2275828-c4b1-4b55-82c9-92135f74df1a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Start", "Alert", "Join", "SetPriority", "GetPriority", "SetCLRTask"]

    /**
     * Specifies the date and time when the trigger is activated.
     * @remarks
     * The **&lt;StartBoundary&gt;** element is a required element for time and calendar triggers ([**&lt;TimeTrigger&gt;**](taskschedulerschema-timetrigger-triggergroup-element.md) and [**&lt;CalendarTrigger&gt;**](taskschedulerschema-calendartrigger-triggergroup-element.md)).
     * 
     * For scripting development, the end boundary is specified using the [**Trigger.StartBoundary**](trigger-startboundary.md) property that is inherited by the all trigger objects.
     * 
     * For C++ development, the end boundary is specified using the [**ITrigger::StartBoundary**](/windows/desktop/api/taskschd/nf-taskschd-itrigger-get_startboundary) property that is inherited by the all trigger interfaces.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/TaskSchd/taskschedulerschema-startboundary-triggerbasetype-element
     */
    Start() {
        result := ComCall(3, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Notifies the system that there are new time samples available.
     * @remarks
     * The time provider manager uses this notification to determine when to send a TPC_GetSamples command. A hardware provider does not need to call this function, as the time provider manager requests samples without this notification. Time providers that provide samples sporadically, such as a provider that works in the background when a user establishes a transient dial-up connection, must call this function.
     * 
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/timeprov/nf-timeprov-timeprovopen">TimeProvOpen</a> function returns a pointer to this function.
     * @returns {HRESULT} If the function succeeds, the return value is S_OK. Otherwise, the return value is one of the error codes defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api//content/timeprov/nc-timeprov-alertsamplesavailfunc
     */
    Alert() {
        result := ComCall(4, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} dwMilliseconds 
     * @param {Integer} option 
     * @returns {HRESULT} 
     */
    Join(dwMilliseconds, option) {
        result := ComCall(5, this, "uint", dwMilliseconds, "uint", option, "int")
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
     * @param {Integer} newPriority 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/processthreadsapi/nf-processthreadsapi-setpriorityclass
     */
    SetPriority(newPriority) {
        result := ComCall(6, this, "int", newPriority, "int")
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
        result := ComCall(7, this, "int*", &pPriority := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pPriority
    }

    /**
     * 
     * @param {ICLRTask} pCLRTask 
     * @returns {HRESULT} 
     */
    SetCLRTask(pCLRTask) {
        result := ComCall(8, this, "ptr", pCLRTask, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
