#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implement the IBackgroundCopyCallback1 interface to receive notification when events occur.
 * @see https://docs.microsoft.com/windows/win32/api//qmgr/nn-qmgr-ibackgroundcopycallback1
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class IBackgroundCopyCallback1 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundCopyCallback1
     * @type {Guid}
     */
    static IID => Guid("{084f6593-3800-4e08-9b59-99fa59addf82}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnStatus", "OnProgress", "OnProgressEx"]

    /**
     * Implement the OnStatus method to receive notification when the group is complete or an error occurs.
     * @param {IBackgroundCopyGroup} pGroup Interface pointer to the group that generated the event.
     * @param {IBackgroundCopyJob1} pJob Interface pointer to the job associated with the event or <b>NULL</b> if the event is not associated with a job.
     * @param {Integer} dwFileIndex Index to the file associated with the error or -1. To retrieve the file, call the <a href="https://docs.microsoft.com/windows/desktop/api/qmgr/nf-qmgr-ibackgroundcopyjob1-getfile">IBackgroundCopyJob1::GetFile</a> method.
     * @param {Integer} dwStatus The state of the group. The state of the group is either complete (all jobs in the group have been downloaded) or in error. An error occurred if the QM_STATUS_GROUP_ERROR flag is set. Otherwise, the group is complete.
     * @param {Integer} dwNumOfRetries Number of times QMGR tried to download the group after an error occurs. Valid only if the QM_STATUS_GROUP_ERROR <i>dwStatus</i> flag is set.
     * @param {Integer} dwWin32Result Win32 error code. Valid only if the QM_STATUS_GROUP_ERROR <i>dwStatus</i> flag is set.
     * @param {Integer} dwTransportResult HTTP error code. Valid only if the QM_STATUS_GROUP_ERROR <i>dwStatus</i> flag is set.
     * @returns {HRESULT} This method should return <b>S_OK</b>; otherwise, the service continues to call this method until S_OK is returned. The interval at which the implementation is called is arbitrary.
     * @see https://docs.microsoft.com/windows/win32/api//qmgr/nf-qmgr-ibackgroundcopycallback1-onstatus
     */
    OnStatus(pGroup, pJob, dwFileIndex, dwStatus, dwNumOfRetries, dwWin32Result, dwTransportResult) {
        result := ComCall(3, this, "ptr", pGroup, "ptr", pJob, "uint", dwFileIndex, "uint", dwStatus, "uint", dwNumOfRetries, "uint", dwWin32Result, "uint", dwTransportResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ProgressType 
     * @param {IBackgroundCopyGroup} pGroup 
     * @param {IBackgroundCopyJob1} pJob 
     * @param {Integer} dwFileIndex 
     * @param {Integer} dwProgressValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nn-qmgr-ibackgroundcopycallback1
     */
    OnProgress(ProgressType, pGroup, pJob, dwFileIndex, dwProgressValue) {
        result := ComCall(4, this, "uint", ProgressType, "ptr", pGroup, "ptr", pJob, "uint", dwFileIndex, "uint", dwProgressValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ProgressType 
     * @param {IBackgroundCopyGroup} pGroup 
     * @param {IBackgroundCopyJob1} pJob 
     * @param {Integer} dwFileIndex 
     * @param {Integer} dwProgressValue 
     * @param {Integer} dwByteArraySize 
     * @param {Pointer<Integer>} pByte 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nn-qmgr-ibackgroundcopycallback1
     */
    OnProgressEx(ProgressType, pGroup, pJob, dwFileIndex, dwProgressValue, dwByteArraySize, pByte) {
        pByteMarshal := pByte is VarRef ? "char*" : "ptr"

        result := ComCall(5, this, "uint", ProgressType, "ptr", pGroup, "ptr", pJob, "uint", dwFileIndex, "uint", dwProgressValue, "uint", dwByteArraySize, pByteMarshal, pByte, "HRESULT")
        return result
    }
}
