#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITimer.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class ITimerService extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITimerService
     * @type {Guid}
     */
    static IID => Guid("{3050f35f-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateTimer", "GetNamedTimer", "SetNamedTimerReference"]

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
     * @param {ITimer} pReferenceTimer 
     * @returns {ITimer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/threadpoollegacyapiset/nf-threadpoollegacyapiset-createtimerqueue
     */
    CreateTimer(pReferenceTimer) {
        result := ComCall(3, this, "ptr", pReferenceTimer, "ptr*", &ppNewTimer := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITimer(ppNewTimer)
    }

    /**
     * 
     * @param {Pointer<Guid>} rguidName 
     * @returns {ITimer} 
     */
    GetNamedTimer(rguidName) {
        result := ComCall(4, this, "ptr", rguidName, "ptr*", &ppTimer := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITimer(ppTimer)
    }

    /**
     * 
     * @param {Pointer<Guid>} rguidName 
     * @param {ITimer} pReferenceTimer 
     * @returns {HRESULT} 
     */
    SetNamedTimerReference(rguidName, pReferenceTimer) {
        result := ComCall(5, this, "ptr", rguidName, "ptr", pReferenceTimer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
