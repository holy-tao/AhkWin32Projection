#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumBackgroundCopyFiles.ahk
#Include .\BG_JOB_PROGRESS.ahk
#Include .\BG_JOB_TIMES.ahk
#Include .\IBackgroundCopyError.ahk
#Include ..\..\System\Com\Apis.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Use the IBackgroundCopyJob interface to add files to the job, set the priority level of the job, determine the state of the job, and to start and stop the job.
 * @see https://learn.microsoft.com/windows/win32/api/bits/nn-bits-ibackgroundcopyjob
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class IBackgroundCopyJob extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundCopyJob
     * @type {Guid}
     */
    static IID => Guid("{37668d37-507e-4160-9316-26306d150b12}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddFileSet", "AddFile", "EnumFiles", "Suspend", "Resume", "Cancel", "Complete", "GetId", "GetType", "GetProgress", "GetTimes", "GetState", "GetError", "GetOwner", "SetDisplayName", "GetDisplayName", "SetDescription", "GetDescription", "SetPriority", "GetPriority", "SetNotifyFlags", "GetNotifyFlags", "SetNotifyInterface", "GetNotifyInterface", "SetMinimumRetryDelay", "GetMinimumRetryDelay", "SetNoProgressTimeout", "GetNoProgressTimeout", "GetErrorCount", "SetProxySettings", "GetProxySettings", "TakeOwnership"]

    /**
     * Adds multiple files to a job.
     * @remarks
     * It is more efficient to call the <b>AddFileSet</b> method when adding multiple files to a job than to call the <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-addfile">IBackgroundCopyJob::AddFile</a> method in a loop. To add a single file to a job, call the 
     * <b>AddFile</b> method. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Bits/adding-files-to-a-job">Adding Files to a Job</a>.
     * 
     * To add a file to a job from which BITS downloads ranges of data from the file, call the <a href="https://docs.microsoft.com/windows/desktop/api/bits2_0/nf-bits2_0-ibackgroundcopyjob3-addfilewithranges">IBackgroundCopyJob3::AddFileWithRanges</a> method.
     * 
     * Upload jobs can contain only one file. If you add more than one file, the method returns BG_E_TOO_MANY_FILES.
     * 
     * For downloads, BITS guarantees that the version of a file (based on file size and date, not content) that it transfers will be consistent; however, it does not guarantee that a set of files will be consistent. For example, if BITS is in the middle of downloading the second of two files at the time that the files are updated on the server, BITS restarts the download of the second file; however, the first file is not downloaded again.
     * 
     * Note that if you own the file being downloaded from the server, you should create a new URL for each new version of the file. If you use the same URL for  new versions of the file, some proxy servers may serve stale data from their cache because they do not verify with the original server if the file is stale. 
     * 
     * For uploads, BITS generates an error if the local file changes while the file is transferring. The error code is BG_E_FILE_CHANGED and the context is BG_ERROR_CONTEXT_LOCAL_FILE.
     * 
     * BITS transfers the files within a job  sequentially. If an error occurs while transferring a file, the job moves to an error state and no more files within the job are processed until the error is resolved.
     * 
     * By default, a user can add up to 200 files to a job. This limit does not apply to administrators or service accounts. To change the default, set the <b>MaxFilesPerJob</b> group policies.
     * 
     * <b>Prior to Windows Vista:  </b>There is no limit on the number of files that a user can add to a job.
     * 
     * For scalability concerns, see <a href="https://docs.microsoft.com/windows/desktop/Bits/best-practices-when-using-bits">Best Practices When Using BITS</a>.
     * @param {Integer} cFileCount Number of elements in <i>paFileSet</i>.
     * @param {Pointer<BG_FILE_INFO>} pFileSet Array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/ns-bits-bg_file_info">BG_FILE_INFO</a> structures that identify the local and remote file names of the files to transfer. 
     * 
     * 
     * 
     * 
     * Upload jobs are restricted to a single file. If the array contains more than one element, or the job already contains a file, the method returns BG_E_TOO_MANY_FILES.
     * @returns {HRESULT} This method returns the following <b>HRESULT</b> values, as well as others.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Files were successfully added to the job.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>BG_E_TOO_MANY_FILES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Upload jobs can only contain one file; you cannot add more than one file to the job. None of the files in the array were added to the job.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>BG_E_TOO_MANY_FILES_IN_JOB</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The MaxFilesPerJob Group Policy setting determines how many files a job can contain. Adding the file to the job exceeds the MaxFilesPerJob limit.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * You can receive this error for one of the following reasons:
     * 
     * <ul>
     * <li>The local or remote file name is not valid.</li>
     * <li>The remote file name uses an unsupported protocol.</li>
     * <li>The local file name was specified using a relative path.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * User does not have permission to write to the specified directory on the client.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-addfileset
     */
    AddFileSet(cFileCount, pFileSet) {
        result := ComCall(3, this, "uint", cFileCount, "ptr", pFileSet, "HRESULT")
        return result
    }

    /**
     * Adds a single file to the job.
     * @remarks
     * To add more than one file at a time to a  job, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-addfileset">IBackgroundCopyJob::AddFileSet</a> method. It is more efficient to call the <b>AddFileSet</b> method when adding multiple files to a job than to call the <b>AddFile</b> method in a loop. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Bits/adding-files-to-a-job">Adding Files to a Job</a>.
     * 
     * To add a file to a job from which BITS downloads ranges of data from the file, call the <a href="https://docs.microsoft.com/windows/desktop/api/bits2_0/nf-bits2_0-ibackgroundcopyjob3-addfilewithranges">IBackgroundCopyJob3::AddFileWithRanges</a> method.
     * 
     * Upload jobs can only contain one file. If you add a second file, the method returns BG_E_TOO_MANY_FILES.
     * 
     * For downloads, BITS guarantees that the version of a file (based on file size and date, not content) that it transfers will be consistent; however, it does not guarantee that a set of files will be consistent. For example, if BITS is in the middle of downloading the second of two files in the job at the time that the files are updated on the server, BITS restarts the download of the second file; however, the first file is not downloaded again.
     * 
     * Note that if you own the file being downloaded from the server, you should create a new URL for each new version of the file. If you use the same URL for  new versions of the file, some proxy servers may serve stale data from their cache because they do not verify with the original server if the file is stale. 
     * 
     * For uploads, BITS generates an error if the local file changes while the file is transferring. The error code is BG_E_FILE_CHANGED and the context is BG_ERROR_CONTEXT_LOCAL_FILE.
     * 
     * BITS transfers the files within a job  sequentially. If an error occurs while transferring a file, the job moves to an error state and no more files within the job are processed until the error is resolved.
     * 
     * By default, a user can add up to 200 files to a job. This limit does not apply to administrators or service accounts. To change the default, set the <b>MaxFilesPerJob</b> group policies.
     * 
     * <b>Prior to Windows Vista:  </b>There is no limit on the number of files that a user can add to a job.
     * 
     * For scalability concerns, see <a href="https://docs.microsoft.com/windows/desktop/Bits/best-practices-when-using-bits">Best Practices When Using BITS</a>.
     * @param {PWSTR} RemoteUrl Null-terminated string that contains the name of the file on the server. For information on specifying the remote name, see the <b>RemoteName</b> member and Remarks section of the <a href="https://docs.microsoft.com/windows/desktop/api/bits/ns-bits-bg_file_info">BG_FILE_INFO</a> structure.
     * @param {PWSTR} LocalName Null-terminated string that contains the name of the file on the client. For information on specifying the local name, see the <b>LocalName</b> member and Remarks section of the <a href="https://docs.microsoft.com/windows/desktop/api/bits/ns-bits-bg_file_info">BG_FILE_INFO</a> structure.
     * @returns {HRESULT} This method returns the following <b>HRESULT</b> values, as well as others.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * File was successfully added to the job.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>BG_E_TOO_MANY_FILES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Upload jobs can only contain one file; you cannot add another file to the job.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>BG_E_TOO_MANY_FILES_IN_JOB</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The MaxFilesPerJob Group Policy setting determines how many files a job can contain. Adding the file to the job exceeds the MaxFilesPerJob limit.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * You can receive this error for one of the following reasons:
     * 
     * <ul>
     * <li>The local or remote file name is not valid.</li>
     * <li>The remote file name uses an unsupported protocol.</li>
     * <li>The local file name was specified using a relative path.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * User does not have permission to write to the specified directory on the client.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-addfile
     */
    AddFile(RemoteUrl, LocalName) {
        RemoteUrl := RemoteUrl is String ? StrPtr(RemoteUrl) : RemoteUrl
        LocalName := LocalName is String ? StrPtr(LocalName) : LocalName

        result := ComCall(4, this, "ptr", RemoteUrl, "ptr", LocalName, "HRESULT")
        return result
    }

    /**
     * Retrieves an IEnumBackgroundCopyFiles interface pointer that you use to enumerate the files in a job.
     * @returns {IEnumBackgroundCopyFiles} <a href="https://docs.microsoft.com/windows/desktop/api/bits/nn-bits-ienumbackgroundcopyfiles">IEnumBackgroundCopyFiles</a> interface pointer that you use to enumerate the files in the job. Release <i>ppEnumFiles</i> when done.
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-enumfiles
     */
    EnumFiles() {
        result := ComCall(5, this, "ptr*", &pEnum := 0, "HRESULT")
        return IEnumBackgroundCopyFiles(pEnum)
    }

    /**
     * Suspends a job. New jobs, jobs that are in error, and jobs that have finished transferring files are automatically suspended.
     * @returns {HRESULT} This method returns the following <b>HRESULT</b> values, as well as others.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully suspended the job.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>BG_E_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The state of the job cannot be BG_JOB_STATE_CANCELLED or BG_JOB_STATE_ACKNOWLEDGED.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-suspend
     */
    Suspend() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * Activates a new job or restarts a job that has been suspended.
     * @remarks
     * When you create a job, the job is initially suspended. Calling <b>Resume</b> moves the job from the suspended state to the queued state. The job stays in the queued state until the scheduler determines it is the job's turn to transfer files. Note that the job must contain one or more files before calling this method. If the job is of type BG_JOB_TYPE_UPLOAD_REPLY and you want to specify the name of the reply file, you should call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits1_5/nf-bits1_5-ibackgroundcopyjob2-setreplyfilename">IBackgroundCopyJob2::SetReplyFileName</a> method before calling 
     * <b>Resume</b>.
     * 
     * If a job that is in the BG_JOB_STATE_TRANSIENT_ERROR or BG_JOB_STATE_ERROR state, call the 
     * <b>Resume</b> method to restart the job after you fix the error.
     * @returns {HRESULT} This method returns the following <b>HRESULT</b> values, as well as others.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Job was successfully restarted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>BG_E_EMPTY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are no files to transfer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>BG_E_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The state of the job cannot be BG_JOB_STATE_CANCELLED or BG_JOB_STATE_ACKNOWLEDGED.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-resume
     */
    Resume() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Deletes the job from the transfer queue and removes related temporary files from the client (downloads) and server (uploads).
     * @remarks
     * You can 
     * <a href="https://docs.microsoft.com/windows/desktop/Bits/completing-and-canceling-a-job">cancel a job</a> at any time; however, the job cannot be recovered after it is canceled.
     * 
     * For upload jobs, if the server is unavailable, there may be a delay before BITS deletes the job from the queue. BITS periodically sends a cancel request to the BITS server for up to 24 hours. If the server does not respond within the 24-hour period, BITS removes the job from the queue. If the <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-setnoprogresstimeout">no-progress time-out period</a> is less than 24 hours, BITS uses the no-progress time-out period to limit the retries.
     * 
     * The 
     * <b>Cancel</b> method cancels an upload if the upload is not complete. If the upload is complete and the job is of type BG_JOB_TYPE_UPLOAD_REPLY, the method cancels the reply.
     * @returns {HRESULT} This method returns the following <b>HRESULT</b> values, as well as others.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Job was successfully canceled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>BG_S_UNABLE_TO_DELETE_FILES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Job was successfully canceled; however, the service was unable to delete the temporary files associated with the job.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>BG_E_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot cancel a job whose state is BG_JOB_STATE_CANCELLED or BG_JOB_STATE_ACKNOWLEDGED.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-cancel
     */
    Cancel() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * Ends the job and saves the transferred files on the client.
     * @remarks
     * Download files are not available until you call the 
     * <b>Complete</b> method. Call the 
     * <b>Complete</b> method after BITS successfully transfers the files. The 
     * method renames the temporary download files to their final destination names and removes the job from the queue. Note that BITS renames the temporary upload file when the server receives the last fragment, which is why  download jobs require network connectivity and upload jobs do not. 
     * 
     * All of the files have been successfully transferred if the job's state is <b>BG_JOB_STATE_TRANSFERRED</b>. To check the state of the job, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-getstate">IBackgroundCopyJob::GetState</a> method. You can also implement the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nn-bits-ibackgroundcopycallback">IBackgroundCopyCallback</a> interface to receive notification when all of the files have been transferred to the client. 
     * 
     * If you do not call the 
     * <b>Complete</b> method or the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-cancel">IBackgroundCopyJob::Cancel</a> method within 90 days (default <a href="https://docs.microsoft.com/windows/desktop/Bits/group-policies">JobInactivityTimeout</a> Group Policy), the service cancels the job. If the service cancels the job, the downloaded files and the reply file are not available to the client; job cancellation does not affect files that have been successfully uploaded.
     * 
     * BITS removes the job from the transfer queue if the HRESULT is <b>S_OK</b> or BG_S_PARTIAL_COMPLETE. The job remains in the transfer queue if BITS was unable to rename all of the temporary files. Files that were renamed successfully are available to the user. The job remains in the queue (the state is <b>BG_JOB_STATE_TRANSFERRED</b>) until the application is able to fix the problem and calls either the 
     * <b>Complete</b> method again or the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-cancel">IBackgroundCopyJob::Cancel</a> method to cancel the job. To determine which files were not renamed for download jobs, see the <b>Completed</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/ns-bits-bg_file_progress">BG_FILE_PROGRESS</a> structure. 
     * 
     * For download jobs, you can call the 
     * <b>Complete</b> method at anytime during the transfer process; however, only files that were successfully transferred to the client before calling this method are saved. For example, if you call the 
     * <b>Complete</b> method while BITS is processing the third of five files, only the first two files are saved. To determine which files have been transferred, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyfile-getprogress">IBackgroundCopyFile::GetProgress</a> method and compare the <b>BytesTransferred</b> member to the <b>BytesTotal</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/ns-bits-bg_file_progress">BG_FILE_PROGRESS</a> structure.
     * 
     * For upload jobs, you can call the 
     * <b>Complete</b> method only when the job's state is <b>BG_JOB_STATE_TRANSFERRED</b>.
     * 
     * BITS does not guarantee the integrity of the transferred files against third-party intrusions. Clients can implement integrity checks to validate transferred files after calling the 
     * <b>Complete</b> method.
     * 
     * The owner of the file is the user who made the call. For example, if an administrator completes someone else's job, the administrator—not the owner of the job—owns the file.
     * 
     * <b>BITS 1.2 and earlier:  </b>The owner of the file is the owner of the job, regardless of who called the <b>Complete</b> method.
     * @returns {HRESULT} This method returns the following <b>HRESULT</b> values. The method can also return errors related to renaming the temporary copies of the transferred files to their given names.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All files transferred successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>BG_S_PARTIAL_COMPLETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A subset of the files transferred successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>BG_S_UNABLE_TO_DELETE_FILES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Job was successfully completed; however, the service was unable to delete the temporary files associated with the job.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>BG_E_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * For downloads, the state of the job cannot be BG_JOB_STATE_CANCELLED or BG_JOB_STATE_ACKNOWLEDGED. 
     * 
     * 
     * 
     * 
     * For uploads, the state of the job must be BG_JOB_STATE_TRANSFERRED.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-complete
     */
    Complete() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * Retrieves the identifier used to identify the job in the queue.
     * @remarks
     * The service generates the identifier when you 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopymanager-createjob">create</a> the job. To use the identifier to retrieve an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nn-bits-ibackgroundcopyjob">IBackgroundCopyJob</a> interface pointer for the job, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopymanager-getjob">IBackgroundCopyManager::GetJob</a> method.
     * @returns {Guid} GUID that identifies the job within the BITS queue.
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-getid
     */
    GetId() {
        pVal := Guid()
        result := ComCall(10, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the type of transfer being performed, such as a file download or upload.
     * @remarks
     * Specify the type of transfer when you 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopymanager-createjob">create the job</a>.
     * @returns {Integer} Type of transfer being performed. For a list of transfer types, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/ne-bits-bg_job_type">BG_JOB_TYPE</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-gettype
     */
    GetType() {
        result := ComCall(11, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Retrieves job-related progress information, such as the number of bytes and files transferred.
     * @returns {BG_JOB_PROGRESS} Contains data that you can use to calculate the percentage of the job that is complete. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/ns-bits-bg_job_progress">BG_JOB_PROGRESS</a>.
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-getprogress
     */
    GetProgress() {
        pVal := BG_JOB_PROGRESS()
        result := ComCall(12, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Retrieves job-related time stamps, such as the time that the job was created or last modified.
     * @returns {BG_JOB_TIMES} Contains job-related time stamps. For available time stamps, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/ns-bits-bg_job_times">BG_JOB_TIMES</a> structure.
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-gettimes
     */
    GetTimes() {
        pVal := BG_JOB_TIMES()
        result := ComCall(13, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the state of the job.
     * @remarks
     * If you want to know when a job is in error or has transferred all the files in the job, you can use this method to poll for the state of the job or you can register to receive notification when  events occur. For details on registering to receive event notification, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nn-bits-ibackgroundcopycallback">IBackgroundCopyCallback</a> interface.
     * @returns {Integer} The state of the job. For example, the state reflects whether the job is in error, transferring data, or suspended. For a list of job states, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/ne-bits-bg_job_state">BG_JOB_STATE</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-getstate
     */
    GetState() {
        result := ComCall(14, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the error interface after an error occurs.
     * @remarks
     * The job is placed in an error state on fatal errors or after the 
     * no-progress-timeout  period expires for transient errors (this period is retrieved from the <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-getprogress">GetNoProgressTimeout</a> method). Use one of the following options to determine if the job is in error:
     * 
     * <ul>
     * <li>To poll for the state of the job, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-getstate">IBackgroundCopyJob::GetState</a> method. The job is in error if the state is BG_JOB_STATE_ERROR.</li>
     * <li>To receive notification when an error occurs, implement the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nn-bits-ibackgroundcopycallback">IBackgroundCopyCallback</a> interface (specifically, the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopycallback-joberror">JobError</a> method). Then, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-setnotifyinterface">IBackgroundCopyJob::SetNotifyInterface</a> method to register the callback and the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-setnotifyflags">IBackgroundCopyJob::SetNotifyFlags</a> method to set the BG_NOTIFY_JOB_ERROR flag.</li>
     * </ul>
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nn-bits-ibackgroundcopyerror">IBackgroundCopyError</a> interface contains information that you use to determine the cause of the error and if the transfer process can proceed. After you determine the cause of the error, perform one of the following options:
     * 
     * <ul>
     * <li>To cancel the job, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-cancel">IBackgroundCopyJob::Cancel</a> method.</li>
     * <li>To save those files that transferred successfully before the error occurred, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-complete">IBackgroundCopyJob::Complete</a> method.</li>
     * <li>To finish processing the job, fix the problem, and then call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-resume">IBackgroundCopyJob::Resume</a> method.</li>
     * </ul>
     * If the job remains in an error state for 90 days (default <a href="https://docs.microsoft.com/windows/desktop/Bits/group-policies">JobInactivityTimeout</a> Group Policy), the service removes the job from the queue and deletes the temporary files on the client; job deletion does not affect files that have been successfully uploaded.
     * 
     * To determine whether the upload, reply, or server application portion of an upload-reply job failed, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyerror-geterror">IBackgroundCopyError::GetError</a> method to retrieve the 
     * [context](./ne-bits-bg_error_context.md) in which the error occurred. The server application failed if the context is BG_ERROR_CONTEXT_REMOTE_APPLICATION. If the error is with the upload or reply, the context is BG_ERROR_CONTEXT_REMOTE_FILE. The upload failed if the <b>BytesTotal</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits1_5/ns-bits1_5-bg_job_reply_progress">BG_JOB_REPLY_PROGRESS</a> structure is BG_SIZE_UNKNOWN. Otherwise, the reply failed.
     * @returns {IBackgroundCopyError} Error interface that provides the error code, a description of the error, and the context in which the error occurred. This parameter also  identifies the file being transferred at the time the error occurred. Release <i>ppError</i> when done.
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-geterror
     */
    GetError() {
        result := ComCall(15, this, "ptr*", &ppError := 0, "HRESULT")
        return IBackgroundCopyError(ppError)
    }

    /**
     * Retrieves the identity of the job's owner.
     * @remarks
     * To convert the string format of the SID into a domain\user-name format, which is suitable for display in a user interface, call the following functions:
     * 
     * <ul>
     * <li>To convert the string SID to a SID, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sddl/nf-sddl-convertstringsidtosida">ConvertStringSidToSid</a> function.</li>
     * <li>To retrieve the domain and user name associated with the SID, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-lookupaccountsida">LookupAccountSid</a> function.</li>
     * </ul>
     * @returns {PWSTR} Null-terminated string that contains the string version of the SID that identifies the job's owner. Call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free <i>ppOwner</i> when done.
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-getowner
     */
    GetOwner() {
        result := ComCall(16, this, "ptr*", &pVal := 0, "int")
        if(result != 0) {
            Com.CoTaskMemFree(pVal)
            throw OSError()
        }

        return pVal
    }

    /**
     * Specifies a display name for the job. Typically, you use the display name to identify the job in a user interface.
     * @remarks
     * The display name is originally set when you create the job. For details on specifying the display name when you create the job, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopymanager-createjob">IBackgroundCopyManager::CreateJob</a> method.
     * @param {PWSTR} Val Null-terminated string that identifies the job. Must not be <b>NULL</b>. The length of the string is limited to 256 characters, not including the null terminator.
     * @returns {HRESULT} This method returns the following <b>HRESULT</b> values, as well as others.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Display name was successfully set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pDisplayName</i> parameter cannot be <b>NULL</b> or the name exceeds 256 characters.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>BG_E_STRING_TOO_LONG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The display name exceeds 256 characters.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>BG_E_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The state of the job cannot be BG_JOB_STATE_CANCELLED or BG_JOB_STATE_ACKNOWLEDGED.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-setdisplayname
     */
    SetDisplayName(Val) {
        Val := Val is String ? StrPtr(Val) : Val

        result := ComCall(17, this, "ptr", Val, "HRESULT")
        return result
    }

    /**
     * Retrieves the display name for the job. Typically, you use the display name to identify the job in a user interface.
     * @returns {PWSTR} Null-terminated string that contains the display name that identifies the job. More than one job can have the same display name. Call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free <i>ppDisplayName</i> when done.
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-getdisplayname
     */
    GetDisplayName() {
        result := ComCall(18, this, "ptr*", &pVal := 0, "int")
        if(result != 0) {
            Com.CoTaskMemFree(pVal)
            throw OSError()
        }

        return pVal
    }

    /**
     * Provides a description of the job.
     * @param {PWSTR} Val Null-terminated string that provides additional information about the job. The length of the string is limited to 1,024 characters, not including the null terminator.
     * @returns {HRESULT} This method returns the following <b>HRESULT</b> values, as well as others.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Description of the job was successfully set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pDescription</i> parameter cannot be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>BG_E_STRING_TOO_LONG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The description exceeds 1,024 characters.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>BG_E_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The state of the job cannot be BG_JOB_STATE_CANCELLED or BG_JOB_STATE_ACKNOWLEDGED.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-setdescription
     */
    SetDescription(Val) {
        Val := Val is String ? StrPtr(Val) : Val

        result := ComCall(19, this, "ptr", Val, "HRESULT")
        return result
    }

    /**
     * Retrieves the description of the job.
     * @returns {PWSTR} Null-terminated string that contains a short description of the job. Call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free <i>ppDescription</i> when done.
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-getdescription
     */
    GetDescription() {
        result := ComCall(20, this, "ptr*", &pVal := 0, "int")
        if(result != 0) {
            Com.CoTaskMemFree(pVal)
            throw OSError()
        }

        return pVal
    }

    /**
     * Specifies the priority level of your job. The priority level determines when your job is processed relative to other jobs in the transfer queue.
     * @param {Integer} Val Specifies the priority level of your job relative to other jobs in the transfer queue. The default is BG_JOB_PRIORITY_NORMAL. For a list of priority levels, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/ne-bits-bg_job_priority">BG_JOB_PRIORITY</a> enumeration.
     * @returns {HRESULT} This method returns the following <b>HRESULT</b> values, as well as others.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Job priority was successfully set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value for <i>Priority</i> is not defined in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/ne-bits-bg_job_priority">BG_JOB_PRIORITY</a> enumeration.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>BG_E_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The state of the job cannot be BG_JOB_STATE_CANCELLED or BG_JOB_STATE_ACKNOWLEDGED.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-setpriority
     */
    SetPriority(Val) {
        result := ComCall(21, this, "int", Val, "HRESULT")
        return result
    }

    /**
     * Retrieves the priority level for the job. The priority level determines when the job is processed relative to other jobs in the transfer queue.
     * @returns {Integer} Priority of the job relative to other jobs in the transfer queue.
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-getpriority
     */
    GetPriority() {
        result := ComCall(22, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Specifies the type of event notification you want to receive, such as job transferred events.
     * @remarks
     * Use the 
     * <b>SetNotifyFlags</b> method in conjunction with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-setnotifyinterface">IBackgroundCopyJob::SetNotifyInterface</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits1_5/nf-bits1_5-ibackgroundcopyjob2-setnotifycmdline">IBackgroundCopyJob2::SetNotifyCmdLine</a> methods to receive event notification.
     * @param {Integer} Val Set one or more of the following flags to identify the events that you want to receive.  
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BG_NOTIFY_JOB_TRANSFERRED"></a><a id="bg_notify_job_transferred"></a><dl>
     * <dt><b>BG_NOTIFY_JOB_TRANSFERRED</b></dt>
     * <dt>0x0001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All of the files in the job have been transferred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BG_NOTIFY_JOB_ERROR"></a><a id="bg_notify_job_error"></a><dl>
     * <dt><b>BG_NOTIFY_JOB_ERROR</b></dt>
     * <dt>0x0002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error has occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BG_NOTIFY_DISABLE"></a><a id="bg_notify_disable"></a><dl>
     * <dt><b>BG_NOTIFY_DISABLE</b></dt>
     * <dt>0x0004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Event notification is disabled. BITS ignores the other flags.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BG_NOTIFY_JOB_MODIFICATION"></a><a id="bg_notify_job_modification"></a><dl>
     * <dt><b>BG_NOTIFY_JOB_MODIFICATION</b></dt>
     * <dt>0x0008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The job has been modified. For example, a property value changed, the state of the job changed, or progress is made transferring the files. This flag is ignored in command-line callbacks if 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits1_5/nf-bits1_5-ibackgroundcopyjob2-setnotifycmdline">command line notification</a> is specified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BG_NOTIFY_FILE_TRANSFERRED"></a><a id="bg_notify_file_transferred"></a><dl>
     * <dt><b>BG_NOTIFY_FILE_TRANSFERRED</b></dt>
     * <dt>0x0010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A file in the job has been transferred.  This flag is ignored in command-line callbacks if 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits1_5/nf-bits1_5-ibackgroundcopyjob2-setnotifycmdline">command line notification</a> is specified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BG_NOTIFY_FILE_RANGES_TRANSFERRED"></a><a id="bg_notify_file_ranges_transferred"></a><dl>
     * <dt><b>BG_NOTIFY_FILE_RANGES_TRANSFERRED</b></dt>
     * <dt>0x0020</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A range of bytes in the file has been transferred.    This flag is ignored in command-line callbacks if 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits1_5/nf-bits1_5-ibackgroundcopyjob2-setnotifycmdline">command line notification</a> is specified. The flag can be specified for any job, but you will only get notifications for jobs that meet the requirements for a <b>BITS_JOB_PROPERTY_ON_DEMAND_MODE</b> job.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} This method returns the following <b>HRESULT</b> values, as well as others.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Type of event notification was successfully set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>NotifyFlags</i> value is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>BG_E_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The state of the job cannot be BG_JOB_STATE_CANCELLED or BG_JOB_STATE_ACKNOWLEDGED.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-setnotifyflags
     */
    SetNotifyFlags(Val) {
        result := ComCall(23, this, "uint", Val, "HRESULT")
        return result
    }

    /**
     * Retrieves the event notification flags for the job.
     * @returns {Integer} Identifies the events that your application receives. The following table lists the event notification flag values. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BG_NOTIFY_JOB_TRANSFERRED"></a><a id="bg_notify_job_transferred"></a><dl>
     * <dt><b>BG_NOTIFY_JOB_TRANSFERRED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All of the files in the job have been transferred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BG_NOTIFY_JOB_ERROR"></a><a id="bg_notify_job_error"></a><dl>
     * <dt><b>BG_NOTIFY_JOB_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error has occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BG_NOTIFY_DISABLE"></a><a id="bg_notify_disable"></a><dl>
     * <dt><b>BG_NOTIFY_DISABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Event notification is disabled. If set, BITS ignores the other flags.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BG_NOTIFY_JOB_MODIFICATION"></a><a id="bg_notify_job_modification"></a><dl>
     * <dt><b>BG_NOTIFY_JOB_MODIFICATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The job has been modified.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-getnotifyflags
     */
    GetNotifyFlags() {
        result := ComCall(24, this, "uint*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Identifies your implementation of the IBackgroundCopyCallback interface to BITS. Use the IBackgroundCopyCallback interface to receive notification of job-related events.
     * @remarks
     * Call this method only if you implement the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nn-bits-ibackgroundcopycallback">IBackgroundCopyCallback</a> interface. Use the 
     * <b>SetNotifyInterface</b> method in conjunction with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-setnotifyflags">SetNotifyFlags</a> method to specify the type of notification that you want to receive. 
     * 
     * The notification interface becomes invalid when your application terminates; BITS does not persist the notify interface. As a result, your application's initialization process should call the 
     * <b>SetNotifyInterface</b> method on those existing jobs for which you want to receive notification. If you need to capture state and progress information that occurred since the last time your application was run, poll for state and progress information during application initialization.
     * 
     * Note that BITS will call your callback even if the event for which you registered already occurred.
     * 
     * As an alternative to receiving callback notification, you can register to have BITS execute a command line for error and transferred events. For more details, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits1_5/nf-bits1_5-ibackgroundcopyjob2-setnotifycmdline">IBackgroundCopyJob2::SetNotifyCmdLine</a> method.
     * 
     * Note that if more than one application calls the  <b>SetNotifyInterface</b> method to set the notification interface for the job, the last application to call the <b>SetNotifyInterface</b> method is the one that will receive notifications—the other applications will not receive notifications.
     * @param {IUnknown} Val An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nn-bits-ibackgroundcopycallback">IBackgroundCopyCallback</a> interface pointer. To remove the current callback interface pointer, set this parameter to <b>NULL</b>.
     * @returns {HRESULT} This method returns the following <b>HRESULT</b> values, as well as others.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Notification interface pointer was successfully set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>BG_E_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The state of the job cannot be BG_JOB_STATE_CANCELLED or BG_JOB_STATE_ACKNOWLEDGED.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-setnotifyinterface
     */
    SetNotifyInterface(Val) {
        result := ComCall(25, this, "ptr", Val, "HRESULT")
        return result
    }

    /**
     * Retrieves the interface pointer to your implementation of the IBackgroundCopyCallback interface.
     * @returns {IUnknown} Interface pointer to your implementation of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nn-bits-ibackgroundcopycallback">IBackgroundCopyCallback</a> interface. When done, release <i>ppNotifyInterface</i>.
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-getnotifyinterface
     */
    GetNotifyInterface() {
        result := ComCall(26, this, "ptr*", &pVal := 0, "HRESULT")
        return IUnknown(pVal)
    }

    /**
     * Sets the minimum length of time that BITS waits after encountering a transient error condition before trying to transfer the file.
     * @remarks
     * To start the job before the minimum retry period expires, call the <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-resume">IBackgroundCopyJob::Resume</a>  method.
     * 
     * BITS does not retry the job if a network disconnect or disk lock error occurred (for example, chkdsk is running) or the <a href="https://docs.microsoft.com/windows/desktop/Bits/group-policies">MaxInternetBandwidth</a> Group Policy is zero. 
     * 
     * <b>Note</b>  Changing the system clock does not affect the minimum retry delay. For example, if the current time is 2:00 P.M. and BITS is to retry the job at 2:10 P.M.,  moving the system clock forward ten or more minutes does not mean BITS  will retry the job  early—BITS will still retry the job in ten minutes. To reflect the system clock change in BITS, you must restart the computer or the BITS service.
     * @param {Integer} Seconds Minimum length of time, in seconds, that BITS waits after encountering a transient error before trying to transfer the file. The default retry delay is 600 seconds (10 minutes). The minimum retry delay that you can specify is 5 seconds. If you specify a value less than 5 seconds, BITS changes the value to 5 seconds. If the value exceeds the no-progress-timeout 
     * value retrieved from the <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-getprogress">GetNoProgressTimeout</a> method, BITS will not retry the transfer and moves the job to the BG_JOB_STATE_ERROR state.
     * @returns {HRESULT} This method returns the following <b>HRESULT</b> values, as well as others.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Retry delay was successfully set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>BG_E_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The state of the job cannot be BG_JOB_STATE_CANCELLED or BG_JOB_STATE_ACKNOWLEDGED.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-setminimumretrydelay
     */
    SetMinimumRetryDelay(Seconds) {
        result := ComCall(27, this, "uint", Seconds, "HRESULT")
        return result
    }

    /**
     * Retrieves the minimum length of time that the service waits after encountering a transient error condition before trying to transfer the file.
     * @returns {Integer} Length of time, in seconds, that the service waits after encountering a transient error before trying to transfer the file.
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-getminimumretrydelay
     */
    GetMinimumRetryDelay() {
        result := ComCall(28, this, "uint*", &Seconds := 0, "HRESULT")
        return Seconds
    }

    /**
     * Sets the length of time that BITS tries to transfer the file after a transient error condition occurs. If there is progress, the timer is reset.
     * @remarks
     * If BITS does not make progress during the retry period, it moves the state of the job from BG_JOB_STATE_TRANSIENT_ERROR to BG_JOB_STATE_ERROR. If you request error notification, BITS then calls your 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopycallback-joberror">JobError</a> callback.
     * 
     * <b>Note</b>  Changing the system clock does not affect the retry period. For example, if the retry period expires in 14 days, moving the system clock forward 14 or more days does not mean the retry period expires early—the retry period will still expire in 14 days. To reflect the system clock change in BITS, you must restart the computer or the BITS service.
     * @param {Integer} Seconds Length of time, in seconds, that BITS tries to transfer the file after the first transient error occurs. The default retry period is 1,209,600 seconds (14 days). Set the retry period to 0 to prevent retries and to force the job into the BG_JOB_STATE_ERROR state for all errors. If the retry period value exceeds the <a href="https://docs.microsoft.com/windows/desktop/Bits/group-policies">JobInactivityTimeout</a> Group Policy value (90-day default), BITS cancels the job after the policy value is exceeded.
     * @returns {HRESULT} This method returns the following <b>HRESULT</b> values, as well as others.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Retry period successfully set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>BG_E_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The state of the job cannot be BG_JOB_STATE_CANCELLED or BG_JOB_STATE_ACKNOWLEDGED.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-setnoprogresstimeout
     */
    SetNoProgressTimeout(Seconds) {
        result := ComCall(29, this, "uint", Seconds, "HRESULT")
        return result
    }

    /**
     * Retrieves the length of time that the service tries to transfer the file after a transient error condition occurs. If there is progress, the timer is reset.
     * @returns {Integer} Length of time, in seconds, that the service tries to transfer the file after a transient error occurs.
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-getnoprogresstimeout
     */
    GetNoProgressTimeout() {
        result := ComCall(30, this, "uint*", &Seconds := 0, "HRESULT")
        return Seconds
    }

    /**
     * Retrieves the number of times BITS tried to transfer the job and an error occurred.
     * @remarks
     * The count is never reset. The count may not accurately reflect the number of times the job moves to the transient error or error state. For example, BITS does not increase the count when network disconnects occur, the check disk program runs, or the bandwidth policy prevents jobs from transferring. 
     * 
     * BITS also increases the count each time it tries to transfer the job when the job is in the transient error state and the job fails.
     * 
     * <b>BITS 1.5 and earlier:  </b> BITS does not increase the count each time it tries to transfer the job when it is in the transient error state.
     * @returns {Integer} Number of errors that occurred while BITS tried to transfer the job. The count increases  when the job moves from the BG_JOB_STATE_TRANSFERRING state to the BG_JOB_STATE_TRANSIENT_ERROR or BG_JOB_STATE_ERROR state.
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-geterrorcount
     */
    GetErrorCount() {
        result := ComCall(31, this, "uint*", &Errors := 0, "HRESULT")
        return Errors
    }

    /**
     * Specifies which proxy to use to transfer files.
     * @remarks
     * The proxy information you provide is validated at run time. If the proxy information is invalid, the job enters the <b>BG_JOB_STATE_ERROR</b> state with a <b>BG_E_INVALID_PROXY_INFO</b> error code.
     * 
     *  If your service runs as LocalSystem, you should use the <b>SetProxySettings</b> method to explicitly specify a proxy or proxy bypass list for the account and set <i>ProxyUsage</i> to <b>BG_JOB_PROXY_USAGE_OVERRIDE</b>. For more information on using system accounts with BITS, see <a href="https://docs.microsoft.com/windows/desktop/Bits/service-accounts-and-bits">Service Accounts and BITS</a>.
     * 
     * BITS does not recognize the proxy settings that are set using the Proxycfg.exe file.
     * 
     * Specify a proxy as:
     * 
     * "[<i>protocol</i>=][<i>protocol</i>"://"]<i>server</i>[":"<i>port</i>]"
     * 
     * The valid protocols are HTTP and HTTPS. The proxy list can contain the port number that is used to access the proxy.  For example, to list an HTTP proxy, a valid string is "http=http://<i>http_proxy_name</i>:80", where <i>http_proxy_name</i> is the name of the proxy server and 80 is the port number that you must use to access the proxy. If the proxy uses the default port number for that protocol, then you can omit the port number. If a proxy name is listed by itself, you can use it as the default proxy for any protocols that do not have a specified proxy. For example, "http=http://<i>http_proxy</i><i>other_proxy</i>" uses <i>http_proxy</i> for any HTTP operations, while the HTTPS protocol uses the proxy named <i>other_proxy</i>.
     * 
     * 
     * 
     * You can list locally known host names or Internet Protocol (IP) addresses in the proxy bypass list. This name can contain wildcards, such as "*", that cause the application to bypass the proxy server for addresses that fit the specified pattern, for example, "*.microsoft.com" or "*.org". Wildcard characters must be the left-most characters in the name. For example, "aaa.*" is not supported. You can specify the  &lt;local&gt; macro to indicate that all local intranet sites are bypassed. Local intranet sites are considered to be all servers that do not contain a period in their name.
     * 
     * 
     * BITS uses the Internet Explorer proxy settings of the user if an application does not specify a proxy usage. This default behavior typically works if the application submits the job in the context of an interactive user but may not work if a service running as LocalSystem submits the job. You can specify Internet Explorer proxy settings for LocalSystem; however, it is difficult to detect these settings when problems occur.
     * @param {Integer} ProxyUsage Specifies whether to use the user's proxy settings, not to use a proxy, or to use application-specified proxy settings. The default is to use the user's proxy settings, <b>BG_JOB_PROXY_USAGE_PRECONFIG</b>. For a list of proxy options, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/ne-bits-bg_job_proxy_usage">BG_JOB_PROXY_USAGE</a> enumeration.
     * @param {PWSTR} ProxyList Null-terminated string that contains the proxies to use to transfer files. The list is space-delimited. For details on specifying a proxy, see Remarks.
     * 
     *  This parameter must be <b>NULL</b> if the value of <i>ProxyUsage</i> is <b>BG_JOB_PROXY_USAGE_PRECONFIG</b>, <b>BG_JOB_PROXY_USAGE_NO_PROXY</b>, or <b>BG_JOB_PROXY_USAGE_AUTODETECT</b>.
     * 
     * The length of the proxy list is limited to 4,000 characters, not including the null terminator.
     * @param {PWSTR} ProxyBypassList Null-terminated string that contains an optional list of host names, IP addresses, or both, that can bypass the proxy. The list is space-delimited. For details on specifying a bypass proxy, see Remarks.
     * 
     * This parameter must be <b>NULL</b> if the value of <i>ProxyUsage</i> is <b>BG_JOB_PROXY_USAGE_PRECONFIG</b>, <b>BG_JOB_PROXY_USAGE_NO_PROXY</b>, or <b>BG_JOB_PROXY_USAGE_AUTODETECT</b>.
     * 						
     * 
     * The length of the proxy bypass list is limited to 4,000 characters, not including the null terminator.
     * @returns {HRESULT} This method returns the following <b>HRESULT</b> values, as well as others.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Proxy was successfully specified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value for <i>ProxyUsage</i> is not defined in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/ne-bits-bg_job_proxy_usage">BG_JOB_PROXY_USAGE</a> enumeration.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>BG_E_PROXY_LIST_TOO_LARGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pProxyList</i> buffer cannot exceed 32 KB.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>BG_E_PROXY_BYPASS_LIST_TOO_LARGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pProxyBypassList</i> cannot exceed 32 KB.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>BG_E_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The state of the job cannot be <b>BG_JOB_STATE_CANCELLED</b> or <b>BG_JOB_STATE_ACKNOWLEDGED</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pProxyList</i> parameter cannot be <b>NULL</b> if <i>ProxyUsage</i> is <b>BG_JOB_PROXY_USAGE_OVERRIDE</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-setproxysettings
     */
    SetProxySettings(ProxyUsage, ProxyList, ProxyBypassList) {
        ProxyList := ProxyList is String ? StrPtr(ProxyList) : ProxyList
        ProxyBypassList := ProxyBypassList is String ? StrPtr(ProxyBypassList) : ProxyBypassList

        result := ComCall(32, this, "int", ProxyUsage, "ptr", ProxyList, "ptr", ProxyBypassList, "HRESULT")
        return result
    }

    /**
     * Retrieves the proxy information that the job uses to transfer the files.
     * @param {Pointer<Integer>} pProxyUsage Specifies the proxy settings the job uses to transfer the files. For a list of proxy options, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/ne-bits-bg_job_proxy_usage">BG_JOB_PROXY_USAGE</a> enumeration.
     * @param {Pointer<PWSTR>} pProxyList Null-terminated string that contains one or more proxies to use to transfer files. The list is space-delimited. For details on the format of the string, see the Listing Proxy Servers section of 
     * <a href="https://docs.microsoft.com/windows/desktop/WinInet/enabling-internet-functionality">Enabling Internet Functionality</a>. Call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free <i>ppProxyList</i> when done.
     * @param {Pointer<PWSTR>} pProxyBypassList Null-terminated string that contains an optional list of host names or IP addresses, or both, that were not routed through the proxy. The list is space-delimited. For details on the format of the string, see the Listing the Proxy Bypass section of 
     * <a href="https://docs.microsoft.com/windows/desktop/WinInet/enabling-internet-functionality">Enabling Internet Functionality</a>. Call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free <i>ppProxyBypassList</i> when done.
     * @returns {HRESULT} This method returns the following <b>HRESULT</b> values, as well as others.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Proxy information was successfully retrieved.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-getproxysettings
     */
    GetProxySettings(pProxyUsage, pProxyList, pProxyBypassList) {
        pProxyUsageMarshal := pProxyUsage is VarRef ? "int*" : "ptr"
        pProxyListMarshal := pProxyList is VarRef ? "ptr*" : "ptr"
        pProxyBypassListMarshal := pProxyBypassList is VarRef ? "ptr*" : "ptr"

        result := ComCall(33, this, pProxyUsageMarshal, pProxyUsage, pProxyListMarshal, pProxyList, pProxyBypassListMarshal, pProxyBypassList, "int")
        if(result != 0) {
            Com.CoTaskMemFree(pProxyList)
            Com.CoTaskMemFree(pProxyBypassList)
            throw OSError()
        }

        return result
    }

    /**
     * Changes ownership of the job to the current user.
     * @remarks
     * To take ownership of the job, the user must have administrator privileges on the client. On Windows Vista, the user must run in an elevated state. After taking ownership, any future updates to the job must be done while the user is running in an elevated state. For details, see <a href="https://docs.microsoft.com/windows/desktop/Bits/users-and-network-connections">Users and Network Connections</a>.
     * 
     * An administrator does not have to take ownership of another user's job to change its properties or to add files to the job. Typically, an administrator uses the 
     * <b>TakeOwnership</b> method if the user does not have sufficient permission to complete the job or if the user is not logged on and the administrator needs the job to complete.
     * 
     * After ownership of the job has changed, the job is processed only when the new owner is logged on to the client. Call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-getowner">IBackgroundCopyJob::GetOwner</a> method to retrieve the SID of the new owner.
     * 
     * If the administrator 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-cancel">cancels</a> the job after taking ownership, it is possible that the files may be orphaned because the administrator does not have write permission to the files. This can occur if the local file destination is in the previous user's roaming profile.
     * 
     * The 
     * <b>TakeOwnership</b> method removes 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits1_5/nf-bits1_5-ibackgroundcopyjob2-setcredentials">credentials</a>, <a href="https://docs.microsoft.com/windows/desktop/api/bits2_5/nf-bits2_5-ibackgroundcopyjobhttpoptions-setclientcertificatebyid">certificates</a>, <a href="https://docs.microsoft.com/windows/desktop/api/bits2_5/nf-bits2_5-ibackgroundcopyjobhttpoptions-setcustomheaders">custom headers</a>, and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits1_5/nf-bits1_5-ibackgroundcopyjob2-setnotifycmdline">command line notification</a> from the job, if set.
     * 
     * If the job specifies <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-setnotifyinterface">event notification</a>, the callback is executed in the context of the user who called the <b>IBackgroundCopyJob::SetNotifyInterface</b> method.
     * @returns {HRESULT} This method returns the following <b>HRESULT</b> values, as well as others.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Job ownership was successfully changed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>BG_E_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The state of the job cannot be BG_JOB_STATE_CANCELLED or BG_JOB_STATE_ACKNOWLEDGED.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>BG_E_NEW_OWNER_NO_FILE_ACCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The new owner has insufficient access to the temporary files on the client computer. BITS creates the temporary files using the owner's security permissions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>BG_E_NEW_OWNER_DIFF_MAPPING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current owner's network drive mapping for the local file is different from the previous owner's.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * User does not have administrator privileges.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyjob-takeownership
     */
    TakeOwnership() {
        result := ComCall(34, this, "HRESULT")
        return result
    }
}
