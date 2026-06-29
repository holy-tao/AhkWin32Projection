#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Retrieves transaction, activity, and context information on the current context object.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-iobjectcontextinfo
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IObjectContextInfo extends IUnknown {
    /**
     * The interface identifier for IObjectContextInfo
     * @type {Guid}
     */
    static IID := Guid("{75b52ddb-e8ed-11d1-93ad-00aa00ba3258}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IObjectContextInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        IsInTransaction  : IntPtr
        GetTransaction   : IntPtr
        GetTransactionId : IntPtr
        GetActivityId    : IntPtr
        GetContextId     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IObjectContextInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Indicates whether the current object is executing in a transaction. (IObjectContextInfo.IsInTransaction)
     * @returns {BOOL} If the current object is executing within a transaction, the return value is <b>TRUE</b>. Otherwise, it is <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iobjectcontextinfo-isintransaction
     */
    IsInTransaction() {
        result := ComCall(3, this, BOOL)
        return result
    }

    /**
     * Retrieves a reference to the current transaction.
     * @returns {IUnknown} A reference to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of the transaction that is currently executing. You can then <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> to get the <b>ITransaction</b> interface for the current transaction.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iobjectcontextinfo-gettransaction
     */
    GetTransaction() {
        result := ComCall(4, this, "ptr*", &pptrans := 0, "HRESULT")
        return IUnknown(pptrans)
    }

    /**
     * Retrieves the identifier of the current transaction.
     * @remarks
     * Objects in the same transaction share the same transaction identifier.
     * @param {Pointer<Guid>} pGuid A GUID that identifies the current transaction.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, and E_FAIL, as well as the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object is not executing in a transaction.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iobjectcontextinfo-gettransactionid
     */
    GetTransactionId(pGuid) {
        result := ComCall(5, this, Guid.Ptr, pGuid, "HRESULT")
        return result
    }

    /**
     * Retrieves the identifier of the current activity.
     * @remarks
     * If the object is not running within a synchronization domain, COM+ returns a GUID_NULL, which consists of all zeros.
     * @param {Pointer<Guid>} pGUID A GUID that identifies the current activity.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iobjectcontextinfo-getactivityid
     */
    GetActivityId(pGUID) {
        result := ComCall(6, this, Guid.Ptr, pGUID, "HRESULT")
        return result
    }

    /**
     * Retrieves the identifier of the current context.
     * @param {Pointer<Guid>} pGuid A GUID that identifies the current context.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iobjectcontextinfo-getcontextid
     */
    GetContextId(pGuid) {
        result := ComCall(7, this, Guid.Ptr, pGuid, "HRESULT")
        return result
    }

    Query(iid) {
        if (IObjectContextInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsInTransaction := CallbackCreate(GetMethod(implObj, "IsInTransaction"), flags, 1)
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
