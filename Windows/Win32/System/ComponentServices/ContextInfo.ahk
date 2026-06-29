#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Retrieves transaction, activity, and context information on the current context object. Using the methods of this interface, you can retrieve relevant information contained within an object context.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-contextinfo
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct ContextInfo extends IDispatch {
    /**
     * The interface identifier for ContextInfo
     * @type {Guid}
     */
    static IID := Guid("{19a5a02c-0ac8-11d2-b286-00c04f8ef934}")

    /**
     * The class identifier for ContextInfo
     * @type {Guid}
     */
    static CLSID := Guid("{19a5a02c-0ac8-11d2-b286-00c04f8ef934}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ContextInfo interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        IsInTransaction  : IntPtr
        GetTransaction   : IntPtr
        GetTransactionId : IntPtr
        GetActivityId    : IntPtr
        GetContextId     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ContextInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Indicates whether the current object is executing in a transaction. (ContextInfo.IsInTransaction)
     * @returns {VARIANT_BOOL} <b>TRUE</b> if the current object is executing within a transaction and <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-contextinfo-isintransaction
     */
    IsInTransaction() {
        result := ComCall(7, this, VARIANT_BOOL.Ptr, &pbIsInTx := 0, "HRESULT")
        return pbIsInTx
    }

    /**
     * Retrieves the object context's transaction object.
     * @returns {IUnknown} A reference to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of the transaction object for the currently executing transaction.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-contextinfo-gettransaction
     */
    GetTransaction() {
        result := ComCall(8, this, "ptr*", &ppTx := 0, "HRESULT")
        return IUnknown(ppTx)
    }

    /**
     * Retrieves the transaction identifier associated with the object context. Objects in the same transaction share the same transaction identifier.
     * @returns {BSTR} A reference to the transaction identifier.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-contextinfo-gettransactionid
     */
    GetTransactionId() {
        pbstrTxId := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pbstrTxId, "HRESULT")
        return pbstrTxId
    }

    /**
     * Retrieves the activity identifier associated with the object context.
     * @returns {BSTR} A reference to the activity identifier.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-contextinfo-getactivityid
     */
    GetActivityId() {
        pbstrActivityId := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, pbstrActivityId, "HRESULT")
        return pbstrActivityId
    }

    /**
     * Retrieves the unique identifier of this object context.
     * @returns {BSTR} A reference to the unique identifier.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-contextinfo-getcontextid
     */
    GetContextId() {
        pbstrCtxId := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, pbstrCtxId, "HRESULT")
        return pbstrCtxId
    }

    Query(iid) {
        if (ContextInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsInTransaction := CallbackCreate(GetMethod(implObj, "IsInTransaction"), flags, 2)
        this.vtbl.GetTransaction := CallbackCreate(GetMethod(implObj, "GetTransaction"), flags, 2)
        this.vtbl.GetTransactionId := CallbackCreate(GetMethod(implObj, "GetTransactionId"), flags, 2)
        this.vtbl.GetActivityId := CallbackCreate(GetMethod(implObj, "GetActivityId"), flags, 2)
        this.vtbl.GetContextId := CallbackCreate(GetMethod(implObj, "GetContextId"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsInTransaction)
        CallbackFree(this.vtbl.GetTransaction)
        CallbackFree(this.vtbl.GetTransactionId)
        CallbackFree(this.vtbl.GetActivityId)
        CallbackFree(this.vtbl.GetContextId)
    }
}
