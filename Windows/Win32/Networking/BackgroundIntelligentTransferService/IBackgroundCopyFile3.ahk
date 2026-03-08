#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\Apis.ahk
#Include .\IBackgroundCopyFile2.ahk

/**
 * Use this interface to retrieve the name of the temporary file that contains the downloaded content and to validate the file so that peers can request its content.
 * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nn-bits3_0-ibackgroundcopyfile3
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class IBackgroundCopyFile3 extends IBackgroundCopyFile2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundCopyFile3
     * @type {Guid}
     */
    static IID => Guid("{659cdeaa-489e-11d9-a9cd-000d56965251}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTemporaryName", "SetValidationState", "GetValidationState", "IsDownloadedFromPeer"]

    /**
     * Gets the full path of the temporary file that contains the content of the download.
     * @remarks
     * Applications can use this method to gain access to the data before the job is complete. Open the file for shared write access (FILE_SHARE_WRITE). To determine how many bytes have been transferred and are available for reading, call the <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyfile-getprogress">IBackgroundCopyFile::GetProgress</a> method. Note that the progress information will be set back to zero if the time stamp of the URL changes.
     * 
     * Do not open the file for reading until BITS begins transferring the file; otherwise, the job will go into the transient error state. 
     * 
     *  The temporary file is available until the application calls the <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-complete">IBackgroundCopyJob::Complete</a> or <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-cancel">IBackgroundCopyJob::Cancel</a> method, or the JobInactivityTimeout group policy expires. You must release your handle to the temporary file before calling the <b>Complete</b> or <b>Cancel</b> method.
     * 
     * The ACL for the temporary file is the same as that of the final file when <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-complete">Complete</a> is called (the ACL is inherited from the folder). 
     * 
     * To determine if BITS finished transferring the file, you can:
     * 
     * <ul>
     * <li>Call the <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyfile-getprogress">IBackgroundCopyFile::GetProgress</a> method and compare <b>BytesTransferred</b> to <b>BytesTotal</b>.</li>
     * <li>Implement the <a href="https://docs.microsoft.com/windows/desktop/api/bits3_0/nf-bits3_0-ibackgroundcopycallback2-filetransferred">IBackgroundCopyCallback2::FileTransferred</a> callback.</li>
     * </ul>
     * @returns {PWSTR} Null-terminated string that contains the full path of the temporary file. Call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free <i>ppFileName</i> when done.
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ibackgroundcopyfile3-gettemporaryname
     */
    GetTemporaryName() {
        result := ComCall(8, this, "ptr*", &pFilename := 0, "int")
        if(result != 0) {
            Com.CoTaskMemFree(pFilename)
            throw OSError()
        }

        return pFilename
    }

    /**
     * Sets the validation state of this file.
     * @remarks
     * If you set the validation state to <b>FALSE</b> and the file was downloaded from the origin server, the job moves to the error state with an error code of BG_E_VALIDATION_FAILED and the file progress is set to zero. You can then call the <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-resume">IBackgroundCopyJob::Resume</a> method to download the file again. 
     * 
     * <b>BITS 3.0:  </b>Do not call the <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-resume">IBackgroundCopyJob::Resume</a> method to download the file again. Instead, call the <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-complete">IBackgroundCopyJob::Complete</a> or <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-cancel">IBackgroundCopyJob::Cancel</a> method to cleanup the current job and then create a new job to download the file.
     * 
     * If you set the validation state to <b>FALSE</b> and the file was downloaded from a peer, BITS removes the file from the cache, resets the file progress to zero, and downloads the file again from the origin server.
     * 
     * You can call this method only after BITS finishes transferring the file. To receive notification when the transfer is complete, implement the <a href="https://docs.microsoft.com/windows/desktop/api/bits3_0/nf-bits3_0-ibackgroundcopycallback2-filetransferred">IBackgroundCopyCallback2::FileTransferred</a> method.
     * 
     * Calling the <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-complete">IBackgroundCopyJob::Complete</a> method implicitly validates the file.
     * 
     * If you validate a file in the cache and then call <a href="https://docs.microsoft.com/windows/desktop/api/bits3_0/nf-bits3_0-ibackgroundcopyjob4-setpeercachingflags">IBackgroundCopyJob4::SetPeerCachingFlags</a>  to disable caching (or peer caching is disable through Group Policy), the file remains in the cache. If you disable caching before validating the file, BITS removes the file from the cache.
     * @param {BOOL} state Set to <b>TRUE</b> if the file content is valid, otherwise, <b>FALSE</b>.
     * @returns {HRESULT} The method returns the following return values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * You cannot validate the file until the download is complete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>BG_E_RECORD_DELETED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The cached record associated with this file has been deleted.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ibackgroundcopyfile3-setvalidationstate
     */
    SetValidationState(state) {
        result := ComCall(9, this, "int", state, "HRESULT")
        return result
    }

    /**
     * Gets the current validation state of this file.
     * @remarks
     * Note that <b>FALSE</b> may not mean that the file is not valid, it may mean the <a href="https://docs.microsoft.com/windows/desktop/api/bits3_0/nf-bits3_0-ibackgroundcopyfile3-setvalidationstate">IBackgroundCopyFile3::SetValidationState</a> has not been called.
     * @returns {BOOL} <b>TRUE</b> if the contents of the file is valid, otherwise, <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ibackgroundcopyfile3-getvalidationstate
     */
    GetValidationState() {
        result := ComCall(10, this, "int*", &pState := 0, "HRESULT")
        return pState
    }

    /**
     * Gets a value that determines if any part of the file was downloaded from a peer.
     * @returns {BOOL} Is <b>TRUE</b> if any part of the file was downloaded from a peer; otherwise, <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ibackgroundcopyfile3-isdownloadedfrompeer
     */
    IsDownloadedFromPeer() {
        result := ComCall(11, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }
}
