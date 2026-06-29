#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IFaxOutgoingJob.ahk" { IFaxOutgoingJob }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The IFaxOutgoingJobs interface describes a messaging collection that is used by a fax client application to manage the outbound fax jobs in a fax server's job queue. Each outbound job is represented by a IFaxOutgoingJob interface.
 * @remarks
 * A default implementation of <b>IFaxOutgoingJobs</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutgoingjobs">FaxOutgoingJobs</a> object.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nn-faxcomex-ifaxoutgoingjobs
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct IFaxOutgoingJobs extends IDispatch {
    /**
     * The interface identifier for IFaxOutgoingJobs
     * @type {Guid}
     */
    static IID := Guid("{2c56d8e6-8c2f-4573-944c-e505f8f5aeed}")

    /**
     * The class identifier for FaxOutgoingJobs
     * @type {Guid}
     */
    static CLSID := Guid("{92bf2a6c-37be-43fa-a37d-cb0e5f753b35}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFaxOutgoingJobs interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get__NewEnum : IntPtr
        get_Item     : IntPtr
        get_Count    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFaxOutgoingJobs.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * The IFaxOutgoingJobs::get__NewEnum method returns a reference to an enumerator object that you can use to iterate through the IFaxOutgoingJobs collection.
     * @returns {IUnknown} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>**</b>
     * 
     * Receives an indirect pointer to the enumerator object's <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface for this collection.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjobs-get__newenum
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    /**
     * The IFaxOutgoingJobs::get_Item method returns a IFaxOutgoingJob interface from the IFaxOutgoingJobs interface.
     * @param {VARIANT} vIndex Type: <b>VARIANT</b>
     * 
     * Variant that specifies the item to retrieve from the collection.
     * 				
     * 
     * 
     * 
     * If this parameter is type VT_I2 or VT_I4, the parameter specifies the index of the item to retrieve from the collection. The index is 1-based. If this parameter is type VT_BSTR, the parameter is a job ID that specifies the outbound job to retrieve. Other types are not supported.
     * @returns {IFaxOutgoingJob} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxoutgoingjob">IFaxOutgoingJob</a>**</b>
     * 
     * An address of a pointer that receives a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxoutgoingjob">IFaxOutgoingJob</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjobs-get_item
     */
    get_Item(vIndex) {
        result := ComCall(8, this, VARIANT, vIndex, "ptr*", &pFaxOutgoingJob := 0, "HRESULT")
        return IFaxOutgoingJob(pFaxOutgoingJob)
    }

    /**
     * The IFaxOutgoingJobs::get_Count property represents the number of objects in the FaxOutgoingJobs collection. This is the total number of outgoing jobs for the fax server.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutgoingjobs-get_count
     */
    get_Count() {
        result := ComCall(9, this, "int*", &plCount := 0, "HRESULT")
        return plCount
    }

    Query(iid) {
        if (IFaxOutgoingJobs.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
        this.vtbl.get_Item := CallbackCreate(GetMethod(implObj, "get_Item"), flags, 3)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get__NewEnum)
        CallbackFree(this.vtbl.get_Item)
        CallbackFree(this.vtbl.get_Count)
    }
}
