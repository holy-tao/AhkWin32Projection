#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include .\DispatcherQueueTimer.ahk
#Include ..\Foundation\EventRegistrationToken.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class IDispatcherQueue extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDispatcherQueue
     * @type {Guid}
     */
    static IID => Guid("{603e88e4-a338-4ffe-a457-a5cfb9ceb899}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateTimer", "TryEnqueue", "TryEnqueueWithPriority", "add_ShutdownStarting", "remove_ShutdownStarting", "add_ShutdownCompleted", "remove_ShutdownCompleted"]

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
     * @returns {DispatcherQueueTimer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/threadpoollegacyapiset/nf-threadpoollegacyapiset-createtimerqueue
     */
    CreateTimer() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DispatcherQueueTimer(result_)
    }

    /**
     * 
     * @param {DispatcherQueueHandler} callback 
     * @returns {Boolean} 
     */
    TryEnqueue(callback) {
        result := ComCall(7, this, "ptr", callback, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} priority_ 
     * @param {DispatcherQueueHandler} callback 
     * @returns {Boolean} 
     */
    TryEnqueueWithPriority(priority_, callback) {
        result := ComCall(8, this, "int", priority_, "ptr", callback, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {TypedEventHandler<DispatcherQueue, DispatcherQueueShutdownStartingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ShutdownStarting(handler) {
        token := EventRegistrationToken()
        result := ComCall(9, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ShutdownStarting(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(10, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<DispatcherQueue, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ShutdownCompleted(handler) {
        token := EventRegistrationToken()
        result := ComCall(11, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ShutdownCompleted(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(12, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
