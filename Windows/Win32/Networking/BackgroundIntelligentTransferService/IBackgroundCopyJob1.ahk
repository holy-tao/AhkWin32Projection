#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<Integer>} pdwProgress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nf-qmgr-ibackgroundcopyjob1-getprogress
     */
    GetProgress(dwFlags, pdwProgress) {
        result := ComCall(4, this, "uint", dwFlags, "uint*", pdwProgress, "HRESULT")
        return result
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
        result := ComCall(5, this, "uint*", pdwStatus, "uint*", pdwWin32Result, "uint*", pdwTransportResult, "uint*", pdwNumOfRetries, "HRESULT")
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
        result := ComCall(6, this, "uint", cFileCount, "ptr*", ppFileSet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cFileIndex 
     * @param {Pointer<FILESETINFO>} pFileInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nf-qmgr-ibackgroundcopyjob1-getfile
     */
    GetFile(cFileIndex, pFileInfo) {
        result := ComCall(7, this, "uint", cFileIndex, "ptr", pFileInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwFileCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nf-qmgr-ibackgroundcopyjob1-getfilecount
     */
    GetFileCount(pdwFileCount) {
        result := ComCall(8, this, "uint*", pdwFileCount, "HRESULT")
        return result
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
     * @param {Pointer<Guid>} pguidJobID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nf-qmgr-ibackgroundcopyjob1-get_jobid
     */
    get_JobID(pguidJobID) {
        result := ComCall(10, this, "ptr", pguidJobID, "HRESULT")
        return result
    }
}
