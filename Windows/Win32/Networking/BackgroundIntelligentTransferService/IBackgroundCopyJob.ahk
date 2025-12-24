#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumBackgroundCopyFiles.ahk
#Include .\BG_JOB_PROGRESS.ahk
#Include .\BG_JOB_TIMES.ahk
#Include .\IBackgroundCopyError.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Use the IBackgroundCopyJob interface to add files to the job, set the priority level of the job, determine the state of the job, and to start and stop the job.
 * @see https://docs.microsoft.com/windows/win32/api//bits/nn-bits-ibackgroundcopyjob
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
     * @see https://docs.microsoft.com/windows/win32/api//bits/nf-bits-ibackgroundcopyjob-addfileset
     */
    AddFileSet(cFileCount, pFileSet) {
        result := ComCall(3, this, "uint", cFileCount, "ptr", pFileSet, "HRESULT")
        return result
    }

    /**
     * Adds a single file to the job.
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
     * @see https://docs.microsoft.com/windows/win32/api//bits/nf-bits-ibackgroundcopyjob-addfile
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
     * @see https://docs.microsoft.com/windows/win32/api//bits/nf-bits-ibackgroundcopyjob-enumfiles
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
     * @see https://docs.microsoft.com/windows/win32/api//bits/nf-bits-ibackgroundcopyjob-suspend
     */
    Suspend() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * Activates a new job or restarts a job that has been suspended.
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
     * @see https://docs.microsoft.com/windows/win32/api//bits/nf-bits-ibackgroundcopyjob-resume
     */
    Resume() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Deletes the job from the transfer queue and removes related temporary files from the client (downloads) and server (uploads).
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
     * @see https://docs.microsoft.com/windows/win32/api//bits/nf-bits-ibackgroundcopyjob-cancel
     */
    Cancel() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * Ends the job and saves the transferred files on the client.
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
     * @see https://docs.microsoft.com/windows/win32/api//bits/nf-bits-ibackgroundcopyjob-complete
     */
    Complete() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * Retrieves the identifier used to identify the job in the queue.
     * @returns {Guid} GUID that identifies the job within the BITS queue.
     * @see https://docs.microsoft.com/windows/win32/api//bits/nf-bits-ibackgroundcopyjob-getid
     */
    GetId() {
        pVal := Guid()
        result := ComCall(10, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the type of transfer being performed, such as a file download or upload.
     * @returns {Integer} Type of transfer being performed. For a list of transfer types, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/ne-bits-bg_job_type">BG_JOB_TYPE</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//bits/nf-bits-ibackgroundcopyjob-gettype
     */
    GetType() {
        result := ComCall(11, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Retrieves job-related progress information, such as the number of bytes and files transferred.
     * @returns {BG_JOB_PROGRESS} Contains data that you can use to calculate the percentage of the job that is complete. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/ns-bits-bg_job_progress">BG_JOB_PROGRESS</a>.
     * @see https://docs.microsoft.com/windows/win32/api//bits/nf-bits-ibackgroundcopyjob-getprogress
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
     * @see https://docs.microsoft.com/windows/win32/api//bits/nf-bits-ibackgroundcopyjob-gettimes
     */
    GetTimes() {
        pVal := BG_JOB_TIMES()
        result := ComCall(13, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the state of the job.
     * @returns {Integer} The state of the job. For example, the state reflects whether the job is in error, transferring data, or suspended. For a list of job states, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/ne-bits-bg_job_state">BG_JOB_STATE</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//bits/nf-bits-ibackgroundcopyjob-getstate
     */
    GetState() {
        result := ComCall(14, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the error interface after an error occurs.
     * @returns {IBackgroundCopyError} Error interface that provides the error code, a description of the error, and the context in which the error occurred. This parameter also  identifies the file being transferred at the time the error occurred. Release <i>ppError</i> when done.
     * @see https://docs.microsoft.com/windows/win32/api//bits/nf-bits-ibackgroundcopyjob-geterror
     */
    GetError() {
        result := ComCall(15, this, "ptr*", &ppError := 0, "HRESULT")
        return IBackgroundCopyError(ppError)
    }

    /**
     * Retrieves the identity of the job's owner.
     * @returns {PWSTR} Null-terminated string that contains the string version of the SID that identifies the job's owner. Call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free <i>ppOwner</i> when done.
     * @see https://docs.microsoft.com/windows/win32/api//bits/nf-bits-ibackgroundcopyjob-getowner
     */
    GetOwner() {
        result := ComCall(16, this, "ptr*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Specifies a display name for the job. Typically, you use the display name to identify the job in a user interface.
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
     * @see https://docs.microsoft.com/windows/win32/api//bits/nf-bits-ibackgroundcopyjob-setdisplayname
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
     * @see https://docs.microsoft.com/windows/win32/api//bits/nf-bits-ibackgroundcopyjob-getdisplayname
     */
    GetDisplayName() {
        result := ComCall(18, this, "ptr*", &pVal := 0, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//bits/nf-bits-ibackgroundcopyjob-setdescription
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
     * @see https://docs.microsoft.com/windows/win32/api//bits/nf-bits-ibackgroundcopyjob-getdescription
     */
    GetDescription() {
        result := ComCall(20, this, "ptr*", &pVal := 0, "HRESULT")
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
     * <a href="/windows/desktop/api/bits/ne-bits-bg_job_priority">BG_JOB_PRIORITY</a> enumeration.
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
     * @see https://docs.microsoft.com/windows/win32/api//bits/nf-bits-ibackgroundcopyjob-setpriority
     */
    SetPriority(Val) {
        result := ComCall(21, this, "int", Val, "HRESULT")
        return result
    }

    /**
     * Retrieves the priority level for the job. The priority level determines when the job is processed relative to other jobs in the transfer queue.
     * @returns {Integer} Priority of the job relative to other jobs in the transfer queue.
     * @see https://docs.microsoft.com/windows/win32/api//bits/nf-bits-ibackgroundcopyjob-getpriority
     */
    GetPriority() {
        result := ComCall(22, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Specifies the type of event notification you want to receive, such as job transferred events.
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
     * @see https://docs.microsoft.com/windows/win32/api//bits/nf-bits-ibackgroundcopyjob-setnotifyflags
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
     * @see https://docs.microsoft.com/windows/win32/api//bits/nf-bits-ibackgroundcopyjob-getnotifyflags
     */
    GetNotifyFlags() {
        result := ComCall(24, this, "uint*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Identifies your implementation of the IBackgroundCopyCallback interface to BITS. Use the IBackgroundCopyCallback interface to receive notification of job-related events.
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
     * @see https://docs.microsoft.com/windows/win32/api//bits/nf-bits-ibackgroundcopyjob-setnotifyinterface
     */
    SetNotifyInterface(Val) {
        result := ComCall(25, this, "ptr", Val, "HRESULT")
        return result
    }

    /**
     * Retrieves the interface pointer to your implementation of the IBackgroundCopyCallback interface.
     * @returns {IUnknown} Interface pointer to your implementation of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nn-bits-ibackgroundcopycallback">IBackgroundCopyCallback</a> interface. When done, release <i>ppNotifyInterface</i>.
     * @see https://docs.microsoft.com/windows/win32/api//bits/nf-bits-ibackgroundcopyjob-getnotifyinterface
     */
    GetNotifyInterface() {
        result := ComCall(26, this, "ptr*", &pVal := 0, "HRESULT")
        return IUnknown(pVal)
    }

    /**
     * Sets the minimum length of time that BITS waits after encountering a transient error condition before trying to transfer the file.
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
     * @see https://docs.microsoft.com/windows/win32/api//bits/nf-bits-ibackgroundcopyjob-setminimumretrydelay
     */
    SetMinimumRetryDelay(Seconds) {
        result := ComCall(27, this, "uint", Seconds, "HRESULT")
        return result
    }

    /**
     * Retrieves the minimum length of time that the service waits after encountering a transient error condition before trying to transfer the file.
     * @returns {Integer} Length of time, in seconds, that the service waits after encountering a transient error before trying to transfer the file.
     * @see https://docs.microsoft.com/windows/win32/api//bits/nf-bits-ibackgroundcopyjob-getminimumretrydelay
     */
    GetMinimumRetryDelay() {
        result := ComCall(28, this, "uint*", &Seconds := 0, "HRESULT")
        return Seconds
    }

    /**
     * Sets the length of time that BITS tries to transfer the file after a transient error condition occurs. If there is progress, the timer is reset.
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
     * @see https://docs.microsoft.com/windows/win32/api//bits/nf-bits-ibackgroundcopyjob-setnoprogresstimeout
     */
    SetNoProgressTimeout(Seconds) {
        result := ComCall(29, this, "uint", Seconds, "HRESULT")
        return result
    }

    /**
     * Retrieves the length of time that the service tries to transfer the file after a transient error condition occurs. If there is progress, the timer is reset.
     * @returns {Integer} Length of time, in seconds, that the service tries to transfer the file after a transient error occurs.
     * @see https://docs.microsoft.com/windows/win32/api//bits/nf-bits-ibackgroundcopyjob-getnoprogresstimeout
     */
    GetNoProgressTimeout() {
        result := ComCall(30, this, "uint*", &Seconds := 0, "HRESULT")
        return Seconds
    }

    /**
     * Retrieves the number of times BITS tried to transfer the job and an error occurred.
     * @returns {Integer} Number of errors that occurred while BITS tried to transfer the job. The count increases  when the job moves from the BG_JOB_STATE_TRANSFERRING state to the BG_JOB_STATE_TRANSIENT_ERROR or BG_JOB_STATE_ERROR state.
     * @see https://docs.microsoft.com/windows/win32/api//bits/nf-bits-ibackgroundcopyjob-geterrorcount
     */
    GetErrorCount() {
        result := ComCall(31, this, "uint*", &Errors := 0, "HRESULT")
        return Errors
    }

    /**
     * Specifies which proxy to use to transfer files.
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
     * <a href="/windows/desktop/api/bits/ne-bits-bg_job_proxy_usage">BG_JOB_PROXY_USAGE</a> enumeration.
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
     * @see https://docs.microsoft.com/windows/win32/api//bits/nf-bits-ibackgroundcopyjob-setproxysettings
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
     * @see https://docs.microsoft.com/windows/win32/api//bits/nf-bits-ibackgroundcopyjob-getproxysettings
     */
    GetProxySettings(pProxyUsage, pProxyList, pProxyBypassList) {
        pProxyUsageMarshal := pProxyUsage is VarRef ? "int*" : "ptr"
        pProxyListMarshal := pProxyList is VarRef ? "ptr*" : "ptr"
        pProxyBypassListMarshal := pProxyBypassList is VarRef ? "ptr*" : "ptr"

        result := ComCall(33, this, pProxyUsageMarshal, pProxyUsage, pProxyListMarshal, pProxyList, pProxyBypassListMarshal, pProxyBypassList, "HRESULT")
        return result
    }

    /**
     * Changes ownership of the job to the current user.
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
     * @see https://docs.microsoft.com/windows/win32/api//bits/nf-bits-ibackgroundcopyjob-takeownership
     */
    TakeOwnership() {
        result := ComCall(34, this, "HRESULT")
        return result
    }
}
