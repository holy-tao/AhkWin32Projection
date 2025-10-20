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
     * 
     * @param {IBackgroundCopyGroup} pGroup 
     * @param {IBackgroundCopyJob1} pJob 
     * @param {Integer} dwFileIndex 
     * @param {Integer} dwStatus 
     * @param {Integer} dwNumOfRetries 
     * @param {Integer} dwWin32Result 
     * @param {Integer} dwTransportResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nf-qmgr-ibackgroundcopycallback1-onstatus
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
        result := ComCall(5, this, "uint", ProgressType, "ptr", pGroup, "ptr", pJob, "uint", dwFileIndex, "uint", dwProgressValue, "uint", dwByteArraySize, "char*", pByte, "HRESULT")
        return result
    }
}
