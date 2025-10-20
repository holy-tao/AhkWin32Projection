#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IActiveIME.ahk

/**
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class IActiveIME2 extends IActiveIME{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActiveIME2
     * @type {Guid}
     */
    static IID => Guid("{e1c4bf0e-2d53-11d2-93e1-0060b067b86e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Sleep", "Unsleep"]

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
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//synchapi/nf-synchapi-sleep
     */
    Sleep() {
        result := ComCall(20, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fDead 
     * @returns {HRESULT} 
     */
    Unsleep(fDead) {
        result := ComCall(21, this, "int", fDead, "HRESULT")
        return result
    }
}
