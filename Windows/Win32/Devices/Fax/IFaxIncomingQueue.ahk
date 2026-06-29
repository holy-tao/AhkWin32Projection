#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IFaxIncomingJobs.ahk" { IFaxIncomingJobs }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IFaxIncomingJob.ahk" { IFaxIncomingJob }

/**
 * The IFaxIncomingQueue interface is used by a fax client application to manage the inbound fax jobs (FaxIncomingJobs object) in the job queue. The object also includes a method to block inbound faxes from the fax job queue.
 * @remarks
 * To create a <b>FaxIncomingQueue</b> object in C++, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxfolders-incomingqueue-vb">IFaxFolders::get_IncomingQueue</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nn-faxcomex-ifaxincomingqueue
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct IFaxIncomingQueue extends IDispatch {
    /**
     * The interface identifier for IFaxIncomingQueue
     * @type {Guid}
     */
    static IID := Guid("{902e64ef-8fd8-4b75-9725-6014df161545}")

    /**
     * The class identifier for FaxIncomingQueue
     * @type {Guid}
     */
    static CLSID := Guid("{69131717-f3f1-40e3-809d-a6cbf7bd85e5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFaxIncomingQueue interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Blocked : IntPtr
        put_Blocked : IntPtr
        Refresh     : IntPtr
        Save        : IntPtr
        GetJobs     : IntPtr
        GetJob      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFaxIncomingQueue.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Blocked {
        get => this.get_Blocked()
        set => this.put_Blocked(value)
    }

    /**
     * The Blocked property is a Boolean value that indicates whether the job queue for incoming faxes is blocked. (Get)
     * @remarks
     * If this property is equal to <b>TRUE</b>, the inbound job queue is blocked and the fax service is not answering incoming fax calls. If this property is equal to <b>FALSE</b>, the queue is not blocked.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingqueue-get_blocked
     */
    get_Blocked() {
        result := ComCall(7, this, VARIANT_BOOL.Ptr, &pbBlocked := 0, "HRESULT")
        return pbBlocked
    }

    /**
     * The Blocked property is a Boolean value that indicates whether the job queue for incoming faxes is blocked. (Put)
     * @remarks
     * If this property is equal to <b>TRUE</b>, the inbound job queue is blocked and the fax service is not answering incoming fax calls. If this property is equal to <b>FALSE</b>, the queue is not blocked.
     * @param {VARIANT_BOOL} bBlocked 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingqueue-put_blocked
     */
    put_Blocked(bBlocked) {
        result := ComCall(8, this, VARIANT_BOOL, bBlocked, "HRESULT")
        return result
    }

    /**
     * The Refresh method refreshes FaxIncomingQueue object information from the fax server. When the Refresh method is called, any configuration changes made after the last Save method call are lost.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingqueue-refresh
     */
    Refresh() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * The Save method saves the FaxIncomingQueue object's data.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farMANAGE_CONFIG</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access rights.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingqueue-save
     */
    Save() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * The GetJobs method returns the collection of inbound fax jobs in the queue.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_JOBS</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farSUBMIT_LOW</a> access rights.
     * @returns {IFaxIncomingJobs} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxincomingjobs">IFaxIncomingJobs</a>**</b>
     * 
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxincomingjobs">FaxIncomingJobs</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingqueue-getjobs
     */
    GetJobs() {
        result := ComCall(11, this, "ptr*", &pFaxIncomingJobs := 0, "HRESULT")
        return IFaxIncomingJobs(pFaxIncomingJobs)
    }

    /**
     * The GetJob method returns an incoming fax job in the job queue according to its ID.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_JOBS</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farSUBMIT_LOW</a> access rights.
     * @param {BSTR} bstrJobId Type: <b>BSTR</b>
     * 
     * Specifies the job ID.
     * @returns {IFaxIncomingJob} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxincomingjob">IFaxIncomingJob</a>**</b>
     * 
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxincomingjob">FaxIncomingJob</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxincomingqueue-getjob
     */
    GetJob(bstrJobId) {
        bstrJobId := bstrJobId is String ? BSTR.Alloc(bstrJobId).Value : bstrJobId

        result := ComCall(12, this, BSTR, bstrJobId, "ptr*", &pFaxIncomingJob := 0, "HRESULT")
        return IFaxIncomingJob(pFaxIncomingJob)
    }

    Query(iid) {
        if (IFaxIncomingQueue.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Blocked := CallbackCreate(GetMethod(implObj, "get_Blocked"), flags, 2)
        this.vtbl.put_Blocked := CallbackCreate(GetMethod(implObj, "put_Blocked"), flags, 2)
        this.vtbl.Refresh := CallbackCreate(GetMethod(implObj, "Refresh"), flags, 1)
        this.vtbl.Save := CallbackCreate(GetMethod(implObj, "Save"), flags, 1)
        this.vtbl.GetJobs := CallbackCreate(GetMethod(implObj, "GetJobs"), flags, 2)
        this.vtbl.GetJob := CallbackCreate(GetMethod(implObj, "GetJob"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Blocked)
        CallbackFree(this.vtbl.put_Blocked)
        CallbackFree(this.vtbl.Refresh)
        CallbackFree(this.vtbl.Save)
        CallbackFree(this.vtbl.GetJobs)
        CallbackFree(this.vtbl.GetJob)
    }
}
