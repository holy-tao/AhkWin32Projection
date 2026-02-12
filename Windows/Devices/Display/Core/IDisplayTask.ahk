#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class IDisplayTask extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDisplayTask
     * @type {Guid}
     */
    static IID => Guid("{5e087448-135b-5bb0-bf63-637f84227c7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetScanout", "SetWait"]

    /**
     * 
     * @param {DisplayScanout} scanout 
     * @returns {HRESULT} 
     */
    SetScanout(scanout) {
        result := ComCall(6, this, "ptr", scanout, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Activates the specified waitable timer. When the due time arrives, the timer is signaled and the thread that set the timer calls the optional completion routine.
     * @remarks
     * Timers are initially inactive. To activate a timer, call 
     * <b>SetWaitableTimer</b>. If the timer is already active when you call 
     * <b>SetWaitableTimer</b>, the timer is stopped, then it is reactivated. Stopping the timer in this manner does not set the timer state to signaled, so threads blocked in a wait operation on the timer remain blocked. However, it does cancel any pending completion routines.
     * 
     * When the specified due time arrives, the timer becomes inactive and the optional APC is queued to the thread that set the timer. The state of the timer is set to signaled, the timer is reactivated using the specified period, and the thread that set the timer calls the completion routine when it enters an alertable wait state. If the timer is set before the thread enters an alertable wait state, the APC is canceled. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-queueuserapc">QueueUserAPC</a>. Note that APCs do not work as well as other signaling mechanisms  for thread pool threads because the system controls the lifetime of thread pool threads, so it is possible for a thread to be terminated before the notification is delivered. Instead of using the <i>pfnCompletionRoutine</i> parameter or another APC-based signaling mechanism, use a waitable object such as a timer created with <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-createthreadpooltimer">CreateThreadpoolTimer</a>. For I/O, use  an I/O completion object created with <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-createthreadpoolio">CreateThreadpoolIo</a> or an <i>hEvent</i>-based <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure where the event can be passed to the <a href="https://docs.microsoft.com/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-setthreadpoolwait">SetThreadpoolWait</a> function.
     * 
     * If the thread that set the timer terminates and there is an associated completion routine, the timer is canceled. However, the state of the timer remains unchanged. If there is no completion routine, then terminating the thread has no effect on the timer.
     * 
     * When a manual-reset timer is set to the signaled state, it remains in this state until 
     * <b>SetWaitableTimer</b> is called to reset the timer. As a result, a periodic manual-reset timer is set to the signaled state when the initial due time arrives and remains signaled until it is reset. When a synchronization timer is set to the signaled state, it remains in this state until a thread completes a wait operation on the timer object.
     * 
     * If the system time is adjusted, the due time of any outstanding absolute timers is adjusted.
     * 
     * To compile an application that uses this function, define <b>_WIN32_WINNT</b> as 0x0400 or later. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
     * 
     * To use a timer to schedule an event for a window, use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-settimer">SetTimer</a> function.
     * 
     * APIs that deal with timers use various different hardware clocks. These clocks may have resolutions significantly different from what you expect: some may be measured in milliseconds (for those that use an RTC-based timer chip), to those measured in nanoseconds (for those that use ACPI or TSC counters). You can change the resolution of your API with a  call to the <a href="https://docs.microsoft.com/windows/desktop/api/timeapi/nf-timeapi-timebeginperiod">timeBeginPeriod</a> and <a href="https://docs.microsoft.com/windows/desktop/api/timeapi/nf-timeapi-timeendperiod">timeEndPeriod</a> functions. How precise you can change the resolution depends on which hardware clock the particular API uses. For more information, check your hardware documentation.
     * @param {DisplayFence} readyFence 
     * @param {Integer} readyFenceValue 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/synchapi/nf-synchapi-setwaitabletimer
     */
    SetWait(readyFence, readyFenceValue) {
        result := ComCall(7, this, "ptr", readyFence, "uint", readyFenceValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
