#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class IHostTaskManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHostTaskManager
     * @type {Guid}
     */
    static IID => Guid("{997ff24c-43b7-4352-8667-0dc04fafd354}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCurrentTask", "CreateTask", "Sleep", "SwitchToTask", "SetUILocale", "SetLocale", "CallNeedsHostHook", "LeaveRuntime", "EnterRuntime", "ReverseLeaveRuntime", "ReverseEnterRuntime", "BeginDelayAbort", "EndDelayAbort", "BeginThreadAffinity", "EndThreadAffinity", "SetStackGuarantee", "GetStackGuarantee", "SetCLRTaskManager"]

    /**
     * 
     * @param {Pointer<IHostTask>} pTask 
     * @returns {HRESULT} 
     */
    GetCurrentTask(pTask) {
        result := ComCall(3, this, "ptr*", pTask, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStackSize 
     * @param {Pointer<LPTHREAD_START_ROUTINE>} pStartAddress 
     * @param {Pointer<Void>} pParameter 
     * @param {Pointer<IHostTask>} ppTask 
     * @returns {HRESULT} 
     */
    CreateTask(dwStackSize, pStartAddress, pParameter, ppTask) {
        pParameterMarshal := pParameter is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "uint", dwStackSize, "ptr", pStartAddress, pParameterMarshal, pParameter, "ptr*", ppTask, "HRESULT")
        return result
    }

    /**
     * Suspends the execution of the current thread until the time-out interval elapses.
     * @remarks
     * 
     * This function causes a thread to relinquish the remainder of its time slice and become unrunnable for an interval based on the value of <i>dwMilliseconds</i>. The system clock "ticks" at a constant rate. If <i>dwMilliseconds</i> is less than the resolution of the system clock, the thread may sleep for less than the specified length of time. If <i>dwMilliseconds</i> is greater than one tick but less than two, the wait can be anywhere between one and two ticks, and so on. To increase the accuracy of the sleep interval, call the <b>timeGetDevCaps</b> function to determine the supported minimum timer resolution and the <b>timeBeginPeriod</b> function to set the timer resolution to its minimum. Use caution when calling <b>timeBeginPeriod</b>, as frequent calls can significantly affect the system clock, system power usage, and the scheduler. If you call <b>timeBeginPeriod</b>, call it one time early in the application and be sure to call the <b>timeEndPeriod</b> function at the very end of the application.
     * 
     * After the sleep interval has passed, the thread is ready to run. If you specify 0 milliseconds, the thread will relinquish the remainder of its time slice but remain ready. Note that a ready thread is not guaranteed to run immediately. Consequently, the thread may not run until some time after the sleep interval elapses. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/scheduling-priorities">Scheduling Priorities</a>.
     * 
     * Be careful when using <b>Sleep</b> in the following scenarios:
     * 
     * <ul>
     * <li>Code  that directly or indirectly creates windows (for example, DDE and COM <b>CoInitialize</b>). If a thread creates any windows, it must process messages. Message broadcasts are sent to all windows in the system. If you have a thread that uses 
     * <b>Sleep</b> with infinite delay, the system will deadlock. </li>
     * <li>Threads that are under concurrency control. For example, an I/O completion port or thread pool limits the number of associated threads that can run. If the maximum number of threads is already running, no additional associated thread can run until a running thread finishes. If a thread uses <b>Sleep</b> with an interval of zero to wait for one of the additional associated threads to accomplish some work,  the process might deadlock. </li>
     * </ul>
     *  For these scenarios, use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-msgwaitformultipleobjects">MsgWaitForMultipleObjects</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-msgwaitformultipleobjectsex">MsgWaitForMultipleObjectsEx</a>, rather than 
     * <b>Sleep</b>.
     * 
     * <b>Windows Phone 8.1:</b> This function is supported for Windows Phone Store apps on Windows Phone 8.1 and later.
     * 
     * <b>Windows 8.1</b> and <b>Windows Server 2012 R2</b>: This function is supported for Windows Store apps on Windows 8.1, Windows Server 2012 R2, and later.
     * 
     * 
     * 
     * @param {Integer} dwMilliseconds The time interval for which execution is to be suspended, in milliseconds.
     * 
     * A value of zero causes the thread to relinquish the remainder of its time slice to any other thread  that is ready to run. If there are no other threads ready to run, the function returns immediately, and the thread continues execution.<b>Windows XP:  </b>A value of zero causes the thread to relinquish the remainder of its time slice to any other thread of equal priority that is ready to run. If there are no other threads of equal priority ready to run, the function returns immediately, and the thread continues execution. This behavior changed starting with Windows Server 2003.
     * 
     * 
     * 
     * A value of INFINITE indicates that the suspension should not time out.
     * @param {Integer} option 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-sleep
     */
    Sleep(dwMilliseconds, option) {
        result := ComCall(5, this, "uint", dwMilliseconds, "uint", option, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} option 
     * @returns {HRESULT} 
     */
    SwitchToTask(option) {
        result := ComCall(6, this, "uint", option, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lcid 
     * @returns {HRESULT} 
     */
    SetUILocale(lcid) {
        result := ComCall(7, this, "uint", lcid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lcid 
     * @returns {HRESULT} 
     */
    SetLocale(lcid) {
        result := ComCall(8, this, "uint", lcid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} target 
     * @param {Pointer<BOOL>} pbCallNeedsHostHook 
     * @returns {HRESULT} 
     */
    CallNeedsHostHook(target, pbCallNeedsHostHook) {
        result := ComCall(9, this, "ptr", target, "ptr", pbCallNeedsHostHook, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} target 
     * @returns {HRESULT} 
     */
    LeaveRuntime(target) {
        result := ComCall(10, this, "ptr", target, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EnterRuntime() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ReverseLeaveRuntime() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ReverseEnterRuntime() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    BeginDelayAbort() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EndDelayAbort() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    BeginThreadAffinity() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EndThreadAffinity() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} guarantee 
     * @returns {HRESULT} 
     */
    SetStackGuarantee(guarantee) {
        result := ComCall(18, this, "uint", guarantee, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pGuarantee 
     * @returns {HRESULT} 
     */
    GetStackGuarantee(pGuarantee) {
        pGuaranteeMarshal := pGuarantee is VarRef ? "uint*" : "ptr"

        result := ComCall(19, this, pGuaranteeMarshal, pGuarantee, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ICLRTaskManager} ppManager 
     * @returns {HRESULT} 
     */
    SetCLRTaskManager(ppManager) {
        result := ComCall(20, this, "ptr", ppManager, "HRESULT")
        return result
    }
}
