#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\Apis.ahk
#Include .\IBackgroundCopyFile.ahk

/**
 * Use the IBackgroundCopyFile2 interface to specify a new remote name for the file and retrieve the list of ranges to download.
 * @see https://learn.microsoft.com/windows/win32/api/bits2_0/nn-bits2_0-ibackgroundcopyfile2
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class IBackgroundCopyFile2 extends IBackgroundCopyFile{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundCopyFile2
     * @type {Guid}
     */
    static IID => Guid("{83e81b93-0873-474d-8a8c-f2018b1a939c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFileRanges", "SetRemoteName"]

    /**
     * Retrieves the ranges that you want to download from the remote file.
     * @param {Pointer<Integer>} RangeCount Number of elements in <i>Ranges</i>.
     * @returns {Pointer<BG_FILE_RANGE>} Array of  <a href="https://docs.microsoft.com/windows/desktop/api/bits2_0/ns-bits2_0-bg_file_range">BG_FILE_RANGE</a> structures that specify the ranges to download. When done, call the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free <i>Ranges</i>.
     * @see https://learn.microsoft.com/windows/win32/api/bits2_0/nf-bits2_0-ibackgroundcopyfile2-getfileranges
     */
    GetFileRanges(RangeCount) {
        RangeCountMarshal := RangeCount is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, RangeCountMarshal, RangeCount, "ptr*", &Ranges := 0, "int")
        if(result != 0) {
            Com.CoTaskMemFree(Ranges)
            throw OSError(result)
        }

        return Ranges
    }

    /**
     * Changes the remote name to a new URL in a download job.
     * @remarks
     * Typically, you call this method if you want to change the protocol used to transfer the file (for example, from SMB to HTTP) or if you want to change the file name or path.
     * 
     * This method does not serialize when it returns. To serialize the change, <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-suspend">suspend</a> the job, call this method (if changing multiple files in the job, use a loop), and <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopyjob-resume">resume</a> the job. Calling the <b>IBackgroundCopyJob::Resume</b> method serializes the change. 
     * 
     * If the time stamp or file size of the new remote name is different from the previous remote name or the new server does not support checkpoint resume (for HTTP remote names), BITS restarts the download. Otherwise, the transfer resumes from the same position on the new server. BITS does not restart already transferred files. 
     * 
     * If the remote name identifies a server message block (SMB) path, the following table identifies possible error codes that can occur after you resume the job. These errors place the job in the <b>BG_JOB_STATE_ERROR</b> state.
     * 
     * <table>
     * <tr>
     * <th>Error code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><c>HRESULT_FROM_WIN32(ERROR_PATH_NOT_FOUND)</c></td>
     * <td> The directory was not found. </td>
     * </tr>
     * <tr>
     * <td><c>HRESULT_FROM_WIN32(ERROR_FILE_NOT_FOUND)</c></td>
     * <td>The file was not found.</td>
     * </tr>
     * <tr>
     * <td><c>HRESULT_FROM_WIN32(ERROR_ACCESS_DENIED)</c></td>
     * <td>The user does not have access to the file specified in <i>Val</i>.</td>
     * </tr>
     * </table>
     * @param {PWSTR} Val Null-terminated string that contains the name of the file on the server. For information on specifying the remote name, see the <b>RemoteName</b> member and Remarks section of the <a href="https://docs.microsoft.com/windows/desktop/api/bits/ns-bits-bg_file_info">BG_FILE_INFO</a> structure.
     * @returns {HRESULT} This method returns the following return values, as well as others.
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
     * Success
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
     * The new remote name is an invalid URL or the new URL is too long (the URL cannot exceed 2,200 characters).
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
     * You cannot call this method for upload or upload-reply jobs; only call this method for download jobs.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/bits2_0/nf-bits2_0-ibackgroundcopyfile2-setremotename
     */
    SetRemoteName(Val) {
        Val := Val is String ? StrPtr(Val) : Val

        result := ComCall(7, this, "ptr", Val, "HRESULT")
        return result
    }
}
