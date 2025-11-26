#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\FILESETINFO.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Use the IBackgroundCopyJob1 interface to add files to the job and retrieve the job's status.
 * @see https://docs.microsoft.com/windows/win32/api//qmgr/nn-qmgr-ibackgroundcopyjob1
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class IBackgroundCopyJob1 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundCopyJob1
     * @type {Guid}
     */
    static IID => Guid("{59f5553c-2031-4629-bb18-2645a6970947}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CancelJob", "GetProgress", "GetStatus", "AddFiles", "GetFile", "GetFileCount", "SwitchToForeground", "get_JobID"]

    /**
     * @type {Guid} 
     */
    JobID {
        get => this.get_JobID()
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nn-qmgr-ibackgroundcopyjob1
     */
    CancelJob() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Use the GetProgress method to retrieve the job's progress.
     * @param {Integer} dwFlags Type of progress to retrieve. Specify one of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="QM_PROGRESS_PERCENT_DONE"></a><a id="qm_progress_percent_done"></a><dl>
     * <dt><b>QM_PROGRESS_PERCENT_DONE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns the percent of the download that is complete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="QM_PROGRESS_SIZE_DONE"></a><a id="qm_progress_size_done"></a><dl>
     * <dt><b>QM_PROGRESS_SIZE_DONE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns the number of bytes downloaded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="QM_PROGRESS_TIME_DONE"></a><a id="qm_progress_time_done"></a><dl>
     * <dt><b>QM_PROGRESS_TIME_DONE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} Progress of the download. The progress represents the number of bytes downloaded or the percent of the download that is complete, depending on <i>dwFlags</i>.
     * @see https://docs.microsoft.com/windows/win32/api//qmgr/nf-qmgr-ibackgroundcopyjob1-getprogress
     */
    GetProgress(dwFlags) {
        result := ComCall(4, this, "uint", dwFlags, "uint*", &pdwProgress := 0, "HRESULT")
        return pdwProgress
    }

    /**
     * Use the GetStatus method to retrieve the state of the job.
     * @param {Pointer<Integer>} pdwStatus State of the job. The state can be set to one or more of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="QM_STATUS_JOB_FOREGROUND"></a><a id="qm_status_job_foreground"></a><dl>
     * <dt><b>QM_STATUS_JOB_FOREGROUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="QM_STATUS_JOB_INCOMPLETE"></a><a id="qm_status_job_incomplete"></a><dl>
     * <dt><b>QM_STATUS_JOB_INCOMPLETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * QMGR is still downloading the job.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="QM_STATUS_JOB_COMPLETE"></a><a id="qm_status_job_complete"></a><dl>
     * <dt><b>QM_STATUS_JOB_COMPLETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The job is complete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="QM_STATUS_JOB_ERROR"></a><a id="qm_status_job_error"></a><dl>
     * <dt><b>QM_STATUS_JOB_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while processing the job. 
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pdwWin32Result Win32 error code. Valid only if the QM_STATUS_JOB_ERROR <i>dwStatus</i> flag is set.
     * @param {Pointer<Integer>} pdwTransportResult HTTP error code. Valid only if the QM_STATUS_JOB_ERROR <i>dwStatus</i> flag is set.
     * @param {Pointer<Integer>} pdwNumOfRetries Number of times QMGR tried to download the job after an error occurs. Valid only if the QM_STATUS_GROUP_ERROR <i>dwStatus</i> flag is set.
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
     * Successfully retrieved the state of the job.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//qmgr/nf-qmgr-ibackgroundcopyjob1-getstatus
     */
    GetStatus(pdwStatus, pdwWin32Result, pdwTransportResult, pdwNumOfRetries) {
        pdwStatusMarshal := pdwStatus is VarRef ? "uint*" : "ptr"
        pdwWin32ResultMarshal := pdwWin32Result is VarRef ? "uint*" : "ptr"
        pdwTransportResultMarshal := pdwTransportResult is VarRef ? "uint*" : "ptr"
        pdwNumOfRetriesMarshal := pdwNumOfRetries is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pdwStatusMarshal, pdwStatus, pdwWin32ResultMarshal, pdwWin32Result, pdwTransportResultMarshal, pdwTransportResult, pdwNumOfRetriesMarshal, pdwNumOfRetries, "HRESULT")
        return result
    }

    /**
     * Use the AddFiles method to add one or more files to download to the job.
     * @param {Integer} cFileCount Number of files in <i>pFileInfo</i> to add to the job.
     * @param {Pointer<Pointer<FILESETINFO>>} ppFileSet Array of <a href="https://docs.microsoft.com/windows/desktop/api/qmgr/ns-qmgr-filesetinfo">FILESETINFO</a> structures that contain the remote and local names of the files to download.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Local or remote file name is invalid. For example, the remote file name specifies an unsupported protocol.
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
     * User does not have permission to write to the specified directory on the client.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//qmgr/nf-qmgr-ibackgroundcopyjob1-addfiles
     */
    AddFiles(cFileCount, ppFileSet) {
        ppFileSetMarshal := ppFileSet is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, "uint", cFileCount, ppFileSetMarshal, ppFileSet, "HRESULT")
        return result
    }

    /**
     * Use the GetFile method to retrieve the remote and local file names for the given file in the job.
     * @param {Integer} cFileIndex Zero-based index that identifies the file in the job.
     * @returns {FILESETINFO} A <a href="https://docs.microsoft.com/windows/desktop/api/qmgr/ns-qmgr-filesetinfo">FILESETINFO</a> structure that contains the remote and local names of the file.
     * @see https://docs.microsoft.com/windows/win32/api//qmgr/nf-qmgr-ibackgroundcopyjob1-getfile
     */
    GetFile(cFileIndex) {
        pFileInfo := FILESETINFO()
        result := ComCall(7, this, "uint", cFileIndex, "ptr", pFileInfo, "HRESULT")
        return pFileInfo
    }

    /**
     * Use the GetFileCount method to retrieve the number of files in the job.
     * @returns {Integer} Number of files in the job.
     * @see https://docs.microsoft.com/windows/win32/api//qmgr/nf-qmgr-ibackgroundcopyjob1-getfilecount
     */
    GetFileCount() {
        result := ComCall(8, this, "uint*", &pdwFileCount := 0, "HRESULT")
        return pdwFileCount
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nn-qmgr-ibackgroundcopyjob1
     */
    SwitchToForeground() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * Use the get_JobID method to retrieve the job's identifier.
     * @returns {Guid} GUID that uniquely identifies the job.
     * @see https://docs.microsoft.com/windows/win32/api//qmgr/nf-qmgr-ibackgroundcopyjob1-get_jobid
     */
    get_JobID() {
        pguidJobID := Guid()
        result := ComCall(10, this, "ptr", pguidJobID, "HRESULT")
        return pguidJobID
    }
}
