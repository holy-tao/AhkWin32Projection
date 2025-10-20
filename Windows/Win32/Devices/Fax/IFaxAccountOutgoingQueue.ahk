#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Used by a fax client application to retrieve the outbound fax jobs (FaxOutgoingJobs object) in the job queue for a particular fax account.
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxaccountoutgoingqueue
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxAccountOutgoingQueue extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaxAccountOutgoingQueue
     * @type {Guid}
     */
    static IID => Guid("{0f1424e9-f22d-4553-b7a5-0d24bd0d7e46}")

    /**
     * The class identifier for FaxAccountOutgoingQueue
     * @type {Guid}
     */
    static CLSID => Guid("{feeceefb-c149-48ba-bab8-b791e101f62f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetJobs", "GetJob"]

    /**
     * 
     * @param {Pointer<IFaxOutgoingJobs>} pFaxOutgoingJobs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccountoutgoingqueue-getjobs
     */
    GetJobs(pFaxOutgoingJobs) {
        result := ComCall(7, this, "ptr*", pFaxOutgoingJobs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrJobId 
     * @param {Pointer<IFaxOutgoingJob>} pFaxOutgoingJob 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccountoutgoingqueue-getjob
     */
    GetJob(bstrJobId, pFaxOutgoingJob) {
        bstrJobId := bstrJobId is String ? BSTR.Alloc(bstrJobId).Value : bstrJobId

        result := ComCall(8, this, "ptr", bstrJobId, "ptr*", pFaxOutgoingJob, "HRESULT")
        return result
    }
}
