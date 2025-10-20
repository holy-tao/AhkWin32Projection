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
     * 
     * @returns {HRESULT} 
     */
    CancelJob() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<UInt32>} pdwProgress 
     * @returns {HRESULT} 
     */
    GetProgress(dwFlags, pdwProgress) {
        result := ComCall(4, this, "uint", dwFlags, "uint*", pdwProgress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwStatus 
     * @param {Pointer<UInt32>} pdwWin32Result 
     * @param {Pointer<UInt32>} pdwTransportResult 
     * @param {Pointer<UInt32>} pdwNumOfRetries 
     * @returns {HRESULT} 
     */
    GetStatus(pdwStatus, pdwWin32Result, pdwTransportResult, pdwNumOfRetries) {
        result := ComCall(5, this, "uint*", pdwStatus, "uint*", pdwWin32Result, "uint*", pdwTransportResult, "uint*", pdwNumOfRetries, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cFileCount 
     * @param {Pointer<FILESETINFO>} ppFileSet 
     * @returns {HRESULT} 
     */
    AddFiles(cFileCount, ppFileSet) {
        result := ComCall(6, this, "uint", cFileCount, "ptr", ppFileSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cFileIndex 
     * @param {Pointer<FILESETINFO>} pFileInfo 
     * @returns {HRESULT} 
     */
    GetFile(cFileIndex, pFileInfo) {
        result := ComCall(7, this, "uint", cFileIndex, "ptr", pFileInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwFileCount 
     * @returns {HRESULT} 
     */
    GetFileCount(pdwFileCount) {
        result := ComCall(8, this, "uint*", pdwFileCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SwitchToForeground() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidJobID 
     * @returns {HRESULT} 
     */
    get_JobID(pguidJobID) {
        result := ComCall(10, this, "ptr", pguidJobID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
