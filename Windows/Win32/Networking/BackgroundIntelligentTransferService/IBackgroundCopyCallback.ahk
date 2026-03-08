#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implement the IBackgroundCopyCallback interface to receive notification that a job is complete, has been modified, or is in error. Clients use this interface instead of polling for the status of the job.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/bits/nn-bits-ibackgroundcopycallback
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
     * BITS calls your implementation of the JobTransferred method when all of the files in the job have been successfully transferred.
     * @remarks
     * Typically, your implementation should call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-complete">IBackgroundCopyJob::Complete</a> method to acknowledge that BITS successfully transferred the files. Download files and the reply file are not available on the client until you call the 
     * <b>Complete</b> method.
     * 
     * If you do not call the <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-complete">Complete</a> method or the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-cancel">IBackgroundCopyJob::Cancel</a> method within 90 days (default <a href="https://docs.microsoft.com/windows/desktop/Bits/group-policies">JobInactivityTimeout</a> Group Policy), BITS cancels the job and deletes the downloaded files and reply file; job cancellation does not affect files that have been successfully uploaded.
     * 
     * If you want to retrieve the reply data in your callback, query <i>pJob</i> for the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits1_5/nn-bits1_5-ibackgroundcopyjob2">IBackgroundCopyJob2</a> interface and call its 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits1_5/nf-bits1_5-ibackgroundcopyjob2-getreplydata">GetReplyData</a> method. To retrieve the name of the file that contains the reply data, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits1_5/nf-bits1_5-ibackgroundcopyjob2-getreplyfilename">GetReplyFileName</a> method.
     * 
     * BITS does not guarantee the integrity of the transferred files against third-party intrusions. Clients can implement integrity checks to validate transferred files before calling the <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-complete">Complete</a>  method. To get notification when a file is transferred, implement the <a href="https://docs.microsoft.com/windows/desktop/api/bits3_0/nf-bits3_0-ibackgroundcopycallback2-filetransferred">IBackgroundCopyCallback2::FileTransferred</a> method. Inside the callback, call the <a href="https://docs.microsoft.com/windows/desktop/api/bits3_0/nf-bits3_0-ibackgroundcopyfile3-gettemporaryname">IBackgroundCopyFile3::GetTemporaryName</a> method to get the name of the temporary file that contains the downloaded content. Validate the contents and then call the <a href="https://docs.microsoft.com/windows/desktop/api/bits3_0/nf-bits3_0-ibackgroundcopyfile3-setvalidationstate">IBackgroundCopyFile3::SetValidationState</a> method to indicate if the content is valid. If the content is not valid and BITS downloaded the file from the origin server, the job goes in the error state. If the job was downloaded from a peer, BITS downloads the file from the origin server.
     * 
     * <div class="alert"><b>Note</b>  BITS supports up to four simultaneous notifications per user. If one or more applications  block all four notifications for a user from returning, an application running as the same user will not receive  notifications until one or more of the blocking notifications return. To reduce the chance that your callback blocks other notifications, keep your implementation short.</div>
     * <div> </div>
     * @param {IBackgroundCopyJob} pJob Contains job-related information, such as the time the job completed, the number of bytes transferred, and the number of files transferred. Do not release <i>pJob</i>; BITS releases the interface when the method returns.
     * @returns {HRESULT} This method should return <b>S_OK</b>; otherwise,  BITS continues to call this method until <b>S_OK</b> is returned. For performance reasons, you should limit the number  of times you return a value other than <b>S_OK</b> to a few times. As an alternative to returning an error code, consider always returning <b>S_OK</b> and handling the error internally. The interval at which this method is called is arbitrary.
     * 
     * Note that if this method fails and you   called the <a href="https://docs.microsoft.com/windows/desktop/api/bits1_5/nf-bits1_5-ibackgroundcopyjob2-setnotifycmdline">IBackgroundCopyJob2::SetNotifyCmdLine</a> method, the command line is executed and this method is not called again.
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopycallback-jobtransferred
     */
    JobTransferred(pJob) {
        result := ComCall(3, this, "ptr", pJob, "HRESULT")
        return result
    }

    /**
     * BITS calls your implementation of the JobError method when the state of the job changes to BG_JOB_STATE_ERROR.
     * @remarks
     * After you determine the cause of the error, perform one of the following options:
     * 
     * <ul>
     * <li>To cancel the job, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-cancel">IBackgroundCopyJob::Cancel</a>  method. The cancel request has no effect on upload jobs if the error occurred after the file was successfully uploaded. However, if the job type is BG_JOB_TYPE_UPLOAD_REPLY and the upload was successful, calling the 
     * <b>Cancel</b> method cancels the request for the reply data.</li>
     * <li>To accept the portion of the job that transferred successfully before the error occurred, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-complete">IBackgroundCopyJob::Complete</a> method. This option does not apply to upload jobs; you cannot complete a portion of an upload job.</li>
     * <li>To finish processing the job, fix the problem, and then call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-resume">IBackgroundCopyJob::Resume</a> method.</li>
     * </ul>
     * If the job remains in an error state for 90 days (default <a href="https://docs.microsoft.com/windows/desktop/Bits/group-policies">JobInactivityTimeout</a> Group Policy), BITS cancels the job and deletes related temporary files; job cancellation does not affect files that have been successfully uploaded.
     * 
     * Transient errors do not generate calls to the 
     * <b>JobError</b> method.
     * 
     * To determine whether the upload, reply, or server application portion of an upload reply job failed, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyerror-geterror">IBackgroundCopyError::GetError</a> method to retrieve the 
     * [context](./ne-bits-bg_error_context.md) in which the error occurred. The server application failed if the context is BG_ERROR_CONTEXT_REMOTE_APPLICATION. The context for upload and reply is BG_ERROR_CONTEXT_REMOTE_FILE. The reply failed if the <b>BytesTotal</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits1_5/ns-bits1_5-bg_job_reply_progress">BG_JOB_REPLY_PROGRESS</a> structure is not BG_SIZE_UNKNOWN. Otherwise, the upload failed.
     * 
     * <div class="alert"><b>Note</b>  BITS supports up to four simultaneous notifications per user. If one or more applications  block all four notifications for a user from returning, an application running as the same user will not receive  notifications until one or more of the blocking notifications return. To reduce the chance that your callback blocks other notifications, keep your implementation short.</div>
     * <div> </div>
     * @param {IBackgroundCopyJob} pJob Contains job-related information, such as the number of bytes and files transferred before the error occurred. It also contains the methods to resume and cancel the job. Do not release <i>pJob</i>; BITS releases the interface when the <b>JobError</b> method returns.
     * @param {IBackgroundCopyError} pError Contains error information, such as the file being processed at the time the fatal error occurred and a description of the error. Do not release <i>pError</i>; BITS releases the interface when the <b>JobError</b> method returns.
     * @returns {HRESULT} This method should return <b>S_OK</b>; otherwise,  BITS continues to call this method until <b>S_OK</b> is returned. For performance reasons, you should limit the number  of times you return a value other than <b>S_OK</b> to a few times. As an alternative to returning an error code, consider always returning <b>S_OK</b> and handling the error internally. The interval at which this method is called is arbitrary.
     * 
     * Note that if this method fails and you   called the <a href="https://docs.microsoft.com/windows/desktop/api/bits1_5/nf-bits1_5-ibackgroundcopyjob2-setnotifycmdline">IBackgroundCopyJob2::SetNotifyCmdLine</a> method, the command line is executed and this method is not called again.
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopycallback-joberror
     */
    JobError(pJob, pError) {
        result := ComCall(4, this, "ptr", pJob, "ptr", pError, "HRESULT")
        return result
    }

    /**
     * BITS calls your implementation of the JobModification method when the job has been modified.
     * @remarks
     * Your implementation may not receive all modification events under maximum resource load conditions.
     * 
     * BITS generates a high volume of modification events; consider creating a timer and polling for state and progress information or limiting your use of this callback. If you use this callback, keep your implementation short.
     * 
     * BITS does not generate a modify event when the state of the job changes to BG_JOB_STATE_ERROR or BG_JOB_STATE_TRANSFERRED.
     * 
     * <div class="alert"><b>Note</b>  BITS supports up to four simultaneous notifications per user. If one or more applications  block all four notifications for a user from returning, an application running as the same user will not receive  notifications until one or more of the blocking notifications return. </div>
     * <div> </div>
     * @param {IBackgroundCopyJob} pJob Contains the methods for accessing property, progress, and state information of the job. Do not release <i>pJob</i>; BITS releases the interface when the <b>JobModification</b> method returns.
     * @param {Integer} dwReserved Reserved for future use.
     * @returns {HRESULT} This method should return <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopycallback-jobmodification
     */
    JobModification(pJob, dwReserved) {
        result := ComCall(5, this, "ptr", pJob, "uint", dwReserved, "HRESULT")
        return result
    }
}
