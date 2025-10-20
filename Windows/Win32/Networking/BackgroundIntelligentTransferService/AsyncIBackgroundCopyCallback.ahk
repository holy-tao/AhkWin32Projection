#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class AsyncIBackgroundCopyCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for AsyncIBackgroundCopyCallback
     * @type {Guid}
     */
    static IID => Guid("{ca29d251-b4bb-4679-a3d9-ae8006119d54}")

    /**
     * The class identifier for AsyncIBackgroundCopyCallback
     * @type {Guid}
     */
    static CLSID => Guid("{ca29d251-b4bb-4679-a3d9-ae8006119d54}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Begin_JobTransferred", "Finish_JobTransferred", "Begin_JobError", "Finish_JobError", "Begin_JobModification", "Finish_JobModification"]

    /**
     * 
     * @param {IBackgroundCopyJob} pJob 
     * @returns {HRESULT} 
     */
    Begin_JobTransferred(pJob) {
        result := ComCall(3, this, "ptr", pJob, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Finish_JobTransferred() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IBackgroundCopyJob} pJob 
     * @param {IBackgroundCopyError} pError 
     * @returns {HRESULT} 
     */
    Begin_JobError(pJob, pError) {
        result := ComCall(5, this, "ptr", pJob, "ptr", pError, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Finish_JobError() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IBackgroundCopyJob} pJob 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    Begin_JobModification(pJob, dwReserved) {
        result := ComCall(7, this, "ptr", pJob, "uint", dwReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Finish_JobModification() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
