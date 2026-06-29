#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IFaxOutgoingJobs.ahk" { IFaxOutgoingJobs }
#Import ".\IFaxOutgoingJob.ahk" { IFaxOutgoingJob }

/**
 * Used by a fax client application to retrieve the outbound fax jobs (FaxOutgoingJobs object) in the job queue for a particular fax account.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nn-faxcomex-ifaxaccountoutgoingqueue
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct IFaxAccountOutgoingQueue extends IDispatch {
    /**
     * The interface identifier for IFaxAccountOutgoingQueue
     * @type {Guid}
     */
    static IID := Guid("{0f1424e9-f22d-4553-b7a5-0d24bd0d7e46}")

    /**
     * The class identifier for FaxAccountOutgoingQueue
     * @type {Guid}
     */
    static CLSID := Guid("{feeceefb-c149-48ba-bab8-b791e101f62f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFaxAccountOutgoingQueue interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        GetJobs : IntPtr
        GetJob  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFaxAccountOutgoingQueue.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns the collection of outbound fax jobs in the queue for the current fax account.
     * @returns {IFaxOutgoingJobs} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxoutgoingjobs">IFaxOutgoingJobs</a>**</b>
     * 
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutgoingjobs">FaxOutgoingJobs</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccountoutgoingqueue-getjobs
     */
    GetJobs() {
        result := ComCall(7, this, "ptr*", &pFaxOutgoingJobs := 0, "HRESULT")
        return IFaxOutgoingJobs(pFaxOutgoingJobs)
    }

    /**
     * Returns an outgoing fax job in the job queue of the current fax account according to the job's ID.
     * @param {BSTR} bstrJobId Type: <b>BSTR</b>
     * 
     * Specifies the job ID.
     * @returns {IFaxOutgoingJob} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxoutgoingjob2">IFaxOutgoingJob2</a>**</b>
     * 
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutgoingjob">FaxOutgoingJob</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccountoutgoingqueue-getjob
     */
    GetJob(bstrJobId) {
        bstrJobId := bstrJobId is String ? BSTR.Alloc(bstrJobId).Value : bstrJobId

        result := ComCall(8, this, BSTR, bstrJobId, "ptr*", &pFaxOutgoingJob := 0, "HRESULT")
        return IFaxOutgoingJob(pFaxOutgoingJob)
    }

    Query(iid) {
        if (IFaxAccountOutgoingQueue.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetJobs := CallbackCreate(GetMethod(implObj, "GetJobs"), flags, 2)
        this.vtbl.GetJob := CallbackCreate(GetMethod(implObj, "GetJob"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetJobs)
        CallbackFree(this.vtbl.GetJob)
    }
}
