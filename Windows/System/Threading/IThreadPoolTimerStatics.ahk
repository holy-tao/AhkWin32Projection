#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ThreadPoolTimer.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Threading
 * @version WindowsRuntime 1.4
 */
class IThreadPoolTimerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IThreadPoolTimerStatics
     * @type {Guid}
     */
    static IID => Guid("{1a8a9d02-e482-461b-b8c7-8efad1cce590}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreatePeriodicTimer", "CreateTimer", "CreatePeriodicTimerWithCompletion", "CreateTimerWithCompletion"]

    /**
     * 
     * @param {TimerElapsedHandler} handler 
     * @param {TimeSpan} period 
     * @returns {ThreadPoolTimer} 
     */
    CreatePeriodicTimer(handler, period) {
        result := ComCall(6, this, "ptr", handler, "ptr", period, "ptr*", &timer := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ThreadPoolTimer(timer)
    }

    /**
     * Creates a queue for timers.
     * @remarks
     * To add a timer to the queue, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/threadpoollegacyapiset/nf-threadpoollegacyapiset-createtimerqueuetimer">CreateTimerQueueTimer</a> function. To remove a timer from the queue, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/threadpoollegacyapiset/nf-threadpoollegacyapiset-deletetimerqueuetimer">DeleteTimerQueueTimer</a> function.
     * 
     * When you are finished with the queue of timers, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/threadpoollegacyapiset/nf-threadpoollegacyapiset-deletetimerqueueex">DeleteTimerQueueEx</a> function to delete the timer queue. Any pending timers in the queue are canceled and deleted.
     * 
     * To compile an application that uses this function, define <b>_WIN32_WINNT</b> as 0x0500 or later. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
     * @param {TimerElapsedHandler} handler 
     * @param {TimeSpan} delay 
     * @returns {ThreadPoolTimer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/threadpoollegacyapiset/nf-threadpoollegacyapiset-createtimerqueue
     */
    CreateTimer(handler, delay) {
        result := ComCall(7, this, "ptr", handler, "ptr", delay, "ptr*", &timer := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ThreadPoolTimer(timer)
    }

    /**
     * 
     * @param {TimerElapsedHandler} handler 
     * @param {TimeSpan} period 
     * @param {TimerDestroyedHandler} destroyed 
     * @returns {ThreadPoolTimer} 
     */
    CreatePeriodicTimerWithCompletion(handler, period, destroyed) {
        result := ComCall(8, this, "ptr", handler, "ptr", period, "ptr", destroyed, "ptr*", &timer := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ThreadPoolTimer(timer)
    }

    /**
     * Creates a queue for timers.
     * @remarks
     * To add a timer to the queue, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/threadpoollegacyapiset/nf-threadpoollegacyapiset-createtimerqueuetimer">CreateTimerQueueTimer</a> function. To remove a timer from the queue, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/threadpoollegacyapiset/nf-threadpoollegacyapiset-deletetimerqueuetimer">DeleteTimerQueueTimer</a> function.
     * 
     * When you are finished with the queue of timers, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/threadpoollegacyapiset/nf-threadpoollegacyapiset-deletetimerqueueex">DeleteTimerQueueEx</a> function to delete the timer queue. Any pending timers in the queue are canceled and deleted.
     * 
     * To compile an application that uses this function, define <b>_WIN32_WINNT</b> as 0x0500 or later. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
     * @param {TimerElapsedHandler} handler 
     * @param {TimeSpan} delay 
     * @param {TimerDestroyedHandler} destroyed 
     * @returns {ThreadPoolTimer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/threadpoollegacyapiset/nf-threadpoollegacyapiset-createtimerqueue
     */
    CreateTimerWithCompletion(handler, delay, destroyed) {
        result := ComCall(9, this, "ptr", handler, "ptr", delay, "ptr", destroyed, "ptr*", &timer := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ThreadPoolTimer(timer)
    }
}
