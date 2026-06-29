#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IFaxIncomingJobs.ahk" { IFaxIncomingJobs }
#Import ".\IFaxIncomingJob.ahk" { IFaxIncomingJob }

/**
 * Used by a fax client application to retrieve the inbound fax jobs (FaxIncomingJobs object) in the job queue for a particular fax account.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nn-faxcomex-ifaxaccountincomingqueue
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct IFaxAccountIncomingQueue extends IDispatch {
    /**
     * The interface identifier for IFaxAccountIncomingQueue
     * @type {Guid}
     */
    static IID := Guid("{dd142d92-0186-4a95-a090-cbc3eadba6b4}")

    /**
     * The class identifier for FaxAccountIncomingQueue
     * @type {Guid}
     */
    static CLSID := Guid("{9bcf6094-b4da-45f4-b8d6-ddeb2186652c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFaxAccountIncomingQueue interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        GetJobs : IntPtr
        GetJob  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFaxAccountIncomingQueue.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns the collection of inbound fax jobs in the queue for the current fax account.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum_2">far2SUBMIT_LOW</a> access rights.
     * 
     * If the setting "All incoming faxes are viewable by everyone" is true (see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxconfiguration-incomingfaxesarepublic-vb">IncomingFaxesArePublic</a>) or if the current user has <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum_2">far2MANAGE_RECEIVE_FOLDER</a> access rights, then the set returned includes all the messages present in the fax server incoming queue.
     * @returns {IFaxIncomingJobs} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxincomingjobs">IFaxIncomingJobs</a>**</b>
     * 
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxincomingjobs">FaxIncomingJobs</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccountincomingqueue-getjobs
     */
    GetJobs() {
        result := ComCall(7, this, "ptr*", &pFaxIncomingJobs := 0, "HRESULT")
        return IFaxIncomingJobs(pFaxIncomingJobs)
    }

    /**
     * Returns an incoming fax job in the job queue of the current fax account according to the job's ID.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum_2">far2SUBMIT_LOW</a> access rights.
     * 
     * If the setting "All incoming faxes are viewable by everyone" is true (see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxconfiguration-incomingfaxesarepublic-vb">IncomingFaxesArePublic</a>) or if the current user has <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum_2">far2MANAGE_RECEIVE_FOLDER</a> access rights, then the set returned includes all the messages present in the fax server incoming queue.
     * @param {BSTR} bstrJobId Type: <b>BSTR</b>
     * 
     * Specifies the job ID.
     * @returns {IFaxIncomingJob} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxincomingjob">IFaxIncomingJob</a>**</b>
     * 
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxincomingjob">FaxIncomingJob</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccountincomingqueue-getjob
     */
    GetJob(bstrJobId) {
        bstrJobId := bstrJobId is String ? BSTR.Alloc(bstrJobId).Value : bstrJobId

        result := ComCall(8, this, BSTR, bstrJobId, "ptr*", &pFaxIncomingJob := 0, "HRESULT")
        return IFaxIncomingJob(pFaxIncomingJob)
    }

    Query(iid) {
        if (IFaxAccountIncomingQueue.IID.Equals(iid)) {
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
