#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDebugDocument.ahk" { IDebugDocument }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\APPLICATION_NODE_EVENT_FILTER.ahk" { APPLICATION_NODE_EVENT_FILTER }
#Import ".\TEXT_DOCUMENT_ARRAY.ahk" { TEXT_DOCUMENT_ARRAY }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IDebugApplicationNode100 extends IUnknown {
    /**
     * The interface identifier for IDebugApplicationNode100
     * @type {Guid}
     */
    static IID := Guid("{90a7734e-841b-4f77-9384-a2891e76e7e2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugApplicationNode100 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetFilterForEventSink : IntPtr
        GetExcludedDocuments  : IntPtr
        QueryIsChildNode      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugApplicationNode100.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @param {APPLICATION_NODE_EVENT_FILTER} filter 
     * @returns {HRESULT} 
     */
    SetFilterForEventSink(dwCookie, filter) {
        result := ComCall(3, this, "uint", dwCookie, APPLICATION_NODE_EVENT_FILTER, filter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {APPLICATION_NODE_EVENT_FILTER} filter 
     * @returns {TEXT_DOCUMENT_ARRAY} 
     */
    GetExcludedDocuments(filter) {
        pDocuments := TEXT_DOCUMENT_ARRAY()
        result := ComCall(4, this, APPLICATION_NODE_EVENT_FILTER, filter, TEXT_DOCUMENT_ARRAY.Ptr, pDocuments, "HRESULT")
        return pDocuments
    }

    /**
     * 
     * @param {IDebugDocument} pSearchKey 
     * @returns {HRESULT} 
     */
    QueryIsChildNode(pSearchKey) {
        result := ComCall(5, this, "ptr", pSearchKey, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDebugApplicationNode100.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetFilterForEventSink := CallbackCreate(GetMethod(implObj, "SetFilterForEventSink"), flags, 3)
        this.vtbl.GetExcludedDocuments := CallbackCreate(GetMethod(implObj, "GetExcludedDocuments"), flags, 3)
        this.vtbl.QueryIsChildNode := CallbackCreate(GetMethod(implObj, "QueryIsChildNode"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetFilterForEventSink)
        CallbackFree(this.vtbl.GetExcludedDocuments)
        CallbackFree(this.vtbl.QueryIsChildNode)
    }
}
