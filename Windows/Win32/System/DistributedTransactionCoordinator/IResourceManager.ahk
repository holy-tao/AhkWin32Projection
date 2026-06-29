#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITransaction.ahk" { ITransaction }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITransactionEnlistmentAsync.ahk" { ITransactionEnlistmentAsync }
#Import ".\BOID.ahk" { BOID }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\XACTSTAT.ahk" { XACTSTAT }
#Import ".\ITransactionResourceAsync.ahk" { ITransactionResourceAsync }

/**
 * The IResourceManager interface resolves contentions for system resources.The filter graph manager exposes this interface.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-iresourcemanager
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct IResourceManager extends IUnknown {
    /**
     * The interface identifier for IResourceManager
     * @type {Guid}
     */
    static IID := Guid("{13741d21-87eb-11ce-8081-0080c758527e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IResourceManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Enlist                           : IntPtr
        Reenlist                         : IntPtr
        ReenlistmentComplete             : IntPtr
        GetDistributedTransactionManager : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IResourceManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {ITransaction} pTransaction 
     * @param {ITransactionResourceAsync} pRes 
     * @param {Pointer<BOID>} pUOW 
     * @param {Pointer<Integer>} pisoLevel 
     * @param {Pointer<ITransactionEnlistmentAsync>} ppEnlist 
     * @returns {HRESULT} 
     */
    Enlist(pTransaction, pRes, pUOW, pisoLevel, ppEnlist) {
        pisoLevelMarshal := pisoLevel is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", pTransaction, "ptr", pRes, BOID.Ptr, pUOW, pisoLevelMarshal, pisoLevel, ITransactionEnlistmentAsync.Ptr, ppEnlist, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pPrepInfo 
     * @param {Integer} cbPrepInfo 
     * @param {Integer} lTimeout 
     * @returns {XACTSTAT} 
     */
    Reenlist(pPrepInfo, cbPrepInfo, lTimeout) {
        pPrepInfoMarshal := pPrepInfo is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, pPrepInfoMarshal, pPrepInfo, "uint", cbPrepInfo, "uint", lTimeout, "int*", &pXactStat := 0, "HRESULT")
        return pXactStat
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ReenlistmentComplete() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} iid 
     * @returns {Pointer<Void>} 
     */
    GetDistributedTransactionManager(iid) {
        result := ComCall(6, this, Guid.Ptr, iid, "ptr*", &ppvObject := 0, "HRESULT")
        return ppvObject
    }

    Query(iid) {
        if (IResourceManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Enlist := CallbackCreate(GetMethod(implObj, "Enlist"), flags, 6)
        this.vtbl.Reenlist := CallbackCreate(GetMethod(implObj, "Reenlist"), flags, 5)
        this.vtbl.ReenlistmentComplete := CallbackCreate(GetMethod(implObj, "ReenlistmentComplete"), flags, 1)
        this.vtbl.GetDistributedTransactionManager := CallbackCreate(GetMethod(implObj, "GetDistributedTransactionManager"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Enlist)
        CallbackFree(this.vtbl.Reenlist)
        CallbackFree(this.vtbl.ReenlistmentComplete)
        CallbackFree(this.vtbl.GetDistributedTransactionManager)
    }
}
