#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implement the IBackgroundCopyCallback interface to receive notification that a job is complete, has been modified, or is in error. Clients use this interface instead of polling for the status of the job.
 * @remarks
 * 
 * To receive notifications, call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-setnotifyinterface">IBackgroundCopyJob::SetNotifyInterface</a> method to specify the interface pointer to your 
 * <b>IBackgroundCopyCallback</b> implementation. To specify which notifications you want to receive, call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-setnotifyflags">IBackgroundCopyJob::SetNotifyFlags</a> method.
 * 
 * BITS will call your callbacks as long as the interface pointer is valid. The notification interface is no longer valid when your application terminates; BITS does not persist the notify interface. As a result, your application's initialization process should call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-setnotifyinterface">SetNotifyInterface</a> method on those existing jobs for which you want to receive notification.
 * 
 * BITS guarantees to call your callback at least once, even if the registration occurs after the event. For example, if you request notification of a job transfer after the transfer occurred, you will receive the job transferred callback. Also, if a job received a notification and the pointer is subsequently  no longer valid, that job would receive another notification if you later set the interface pointer on that job.
 * 
 * You must implement all methods of the 
 * <b>IBackgroundCopyCallback</b> interface. For example, if you do not register for the job modification callback, the <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopycallback-jobmodification">JobModification</a> method must still return <b>S_OK</b>.
 * 
 * The JobModification callbacks are launched using low priority threads whereas the JobTransferred and the JobError callbacks are launched using higher priority threads. So it is possible that while some JobModification callbacks are pending the JobTransferred callback is received by the client first although it is launched after the pending JobModification callbacks.
 * 
 * BITS supports up to four simultaneous notifications per user. If one or more applications  block all four notifications for a user from returning, an application running as the same user will not receive  notifications until one or more of the blocking notifications return. To reduce the chance that your callback blocks other notifications, keep your implementation short.
 * 			
 * 			
 * 
 * If an administrator takes ownership of the job, the notification callbacks are made in the context of the user who requested notification.
 * 
 * If your application uses the <a href="https://docs.microsoft.com/windows/desktop/com/single-threaded-apartments">single-threaded apartment</a> model, your callback methods can become reentrant if you call COM objects from inside your callback method. For example, if you call <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-getprogress">IBackgroundCopyJob::GetProgress</a> from inside your <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopycallback-jobmodification">JobModification</a> callback, BITS can send your job modification callback another notification while you are still processing the current notification. If it is not important to your application to respond to every <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopycallback-jobmodification">JobModification</a> callback, you could ignore reentrant callbacks as shown in the following example. 
 * 
 * 
 * ```cpp
 * //A member variable is used to determine if the callback
 * //is already processing another job modification callback.
 * LONG m_PendingJobModificationCount = 0;
 * 
 * //If you are already processing a callback, ignore this notification.
 * if (InterlockedCompareExchange(&m_PendingJobModificationCount, 1, 0) == 1)
 * {
 *   return S_OK;
 * }
 * 
 * ...  //processing the current notification
 * 
 * m_PendingJobModificationCount = 0;
 * return hr;
 * 
 * ```
 * 
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//bits/nn-bits-ibackgroundcopycallback
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class IBackgroundCopyCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundCopyCallback
     * @type {Guid}
     */
    static IID => Guid("{97ea99c7-0186-4ad4-8df9-c5b4e0ed6b22}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["JobTransferred", "JobError", "JobModification"]

    /**
     * 
     * @param {IBackgroundCopyJob} pJob 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopycallback-jobtransferred
     */
    JobTransferred(pJob) {
        result := ComCall(3, this, "ptr", pJob, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IBackgroundCopyJob} pJob 
     * @param {IBackgroundCopyError} pError 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopycallback-joberror
     */
    JobError(pJob, pError) {
        result := ComCall(4, this, "ptr", pJob, "ptr", pError, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IBackgroundCopyJob} pJob 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopycallback-jobmodification
     */
    JobModification(pJob, dwReserved) {
        result := ComCall(5, this, "ptr", pJob, "uint", dwReserved, "HRESULT")
        return result
    }
}
