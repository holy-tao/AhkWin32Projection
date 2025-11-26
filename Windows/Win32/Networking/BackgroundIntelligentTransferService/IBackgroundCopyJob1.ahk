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
     * 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nf-qmgr-ibackgroundcopyjob1-getprogress
     */
    GetProgress(dwFlags) {
        result := ComCall(4, this, "uint", dwFlags, "uint*", &pdwProgress := 0, "HRESULT")
        return pdwProgress
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwStatus 
     * @param {Pointer<Integer>} pdwWin32Result 
     * @param {Pointer<Integer>} pdwTransportResult 
     * @param {Pointer<Integer>} pdwNumOfRetries 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nf-qmgr-ibackgroundcopyjob1-getstatus
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
     * 
     * @param {Integer} cFileCount 
     * @param {Pointer<Pointer<FILESETINFO>>} ppFileSet 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nf-qmgr-ibackgroundcopyjob1-addfiles
     */
    AddFiles(cFileCount, ppFileSet) {
        ppFileSetMarshal := ppFileSet is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, "uint", cFileCount, ppFileSetMarshal, ppFileSet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cFileIndex 
     * @returns {FILESETINFO} 
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nf-qmgr-ibackgroundcopyjob1-getfile
     */
    GetFile(cFileIndex) {
        pFileInfo := FILESETINFO()
        result := ComCall(7, this, "uint", cFileIndex, "ptr", pFileInfo, "HRESULT")
        return pFileInfo
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nf-qmgr-ibackgroundcopyjob1-getfilecount
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
     * 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nf-qmgr-ibackgroundcopyjob1-get_jobid
     */
    get_JobID() {
        pguidJobID := Guid()
        result := ComCall(10, this, "ptr", pguidJobID, "HRESULT")
        return pguidJobID
    }
}
