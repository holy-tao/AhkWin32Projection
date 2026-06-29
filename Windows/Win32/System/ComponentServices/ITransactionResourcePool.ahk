#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IObjPool.ahk" { IObjPool }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Maintains a list of pooled objects, keyed by IObjPool, that are used until the transaction completes.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-itransactionresourcepool
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct ITransactionResourcePool extends IUnknown {
    /**
     * The interface identifier for ITransactionResourcePool
     * @type {Guid}
     */
    static IID := Guid("{c5feb7c1-346a-11d1-b1cc-00aa00ba3258}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITransactionResourcePool interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        PutResource : IntPtr
        GetResource : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITransactionResourcePool.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Adds an object to the list of pooled objects.
     * @param {IObjPool} pPool The key to each object in the transaction resource pool. It determines the type of pooled object to add to the list.
     * @param {IUnknown} pUnk A reference to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> of the pooled object.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-itransactionresourcepool-putresource
     */
    PutResource(pPool, pUnk) {
        result := ComCall(3, this, "ptr", pPool, "ptr", pUnk, "HRESULT")
        return result
    }

    /**
     * Retrieves an object from the list of pooled objects.
     * @param {IObjPool} pPool The key to each object in the transaction resource pool. It determines the type of pooled object to retrieve from the list.
     * @returns {IUnknown} A reference to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> of the pooled object.
     * 
     * The object that is retrieved must have the same <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-iobjpool">IObjPool</a> pointer as an object that was put on the list by using <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-itransactionresourcepool-putresource">PutResource</a>.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-itransactionresourcepool-getresource
     */
    GetResource(pPool) {
        result := ComCall(4, this, "ptr", pPool, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    Query(iid) {
        if (ITransactionResourcePool.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.PutResource := CallbackCreate(GetMethod(implObj, "PutResource"), flags, 3)
        this.vtbl.GetResource := CallbackCreate(GetMethod(implObj, "GetResource"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.PutResource)
        CallbackFree(this.vtbl.GetResource)
    }
}
