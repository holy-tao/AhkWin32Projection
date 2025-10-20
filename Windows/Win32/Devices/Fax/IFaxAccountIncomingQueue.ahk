#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Used by a fax client application to retrieve the inbound fax jobs (FaxIncomingJobs object) in the job queue for a particular fax account.
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxaccountincomingqueue
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxAccountIncomingQueue extends IDispatch{
    /**
     * The interface identifier for IFaxAccountIncomingQueue
     * @type {Guid}
     */
    static IID => Guid("{dd142d92-0186-4a95-a090-cbc3eadba6b4}")

    /**
     * The class identifier for FaxAccountIncomingQueue
     * @type {Guid}
     */
    static CLSID => Guid("{9bcf6094-b4da-45f4-b8d6-ddeb2186652c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<IFaxIncomingJobs>} pFaxIncomingJobs 
     * @returns {HRESULT} 
     */
    GetJobs(pFaxIncomingJobs) {
        result := ComCall(7, this, "ptr", pFaxIncomingJobs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrJobId 
     * @param {Pointer<IFaxIncomingJob>} pFaxIncomingJob 
     * @returns {HRESULT} 
     */
    GetJob(bstrJobId, pFaxIncomingJob) {
        bstrJobId := bstrJobId is String ? BSTR.Alloc(bstrJobId).Value : bstrJobId

        result := ComCall(8, this, "ptr", bstrJobId, "ptr", pFaxIncomingJob, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
