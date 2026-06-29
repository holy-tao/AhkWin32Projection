#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IResourceManager.ahk" { IResourceManager }
#Import ".\ITransactionEnlistmentAsync.ahk" { ITransactionEnlistmentAsync }
#Import ".\ITransactionResourceAsync.ahk" { ITransactionResourceAsync }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\XID.ahk" { XID }
#Import ".\XACTSTAT.ahk" { XACTSTAT }
#Import ".\ITransaction.ahk" { ITransaction }
#Import ".\BOID.ahk" { BOID }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct IResourceManager2 extends IResourceManager {
    /**
     * The interface identifier for IResourceManager2
     * @type {Guid}
     */
    static IID := Guid("{d136c69a-f749-11d1-8f47-00c04f8ee57d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IResourceManager2 interfaces
    */
    struct Vtbl extends IResourceManager.Vtbl {
        Enlist2   : IntPtr
        Reenlist2 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IResourceManager2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {ITransaction} pTransaction 
     * @param {ITransactionResourceAsync} pResAsync 
     * @param {Pointer<BOID>} pUOW 
     * @param {Pointer<Integer>} pisoLevel 
     * @param {Pointer<XID>} pXid 
     * @param {Pointer<ITransactionEnlistmentAsync>} ppEnlist 
     * @returns {HRESULT} 
     */
    Enlist2(pTransaction, pResAsync, pUOW, pisoLevel, pXid, ppEnlist) {
        pisoLevelMarshal := pisoLevel is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, "ptr", pTransaction, "ptr", pResAsync, BOID.Ptr, pUOW, pisoLevelMarshal, pisoLevel, XID.Ptr, pXid, ITransactionEnlistmentAsync.Ptr, ppEnlist, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<XID>} pXid 
     * @param {Integer} dwTimeout 
     * @returns {XACTSTAT} 
     */
    Reenlist2(pXid, dwTimeout) {
        result := ComCall(8, this, XID.Ptr, pXid, "uint", dwTimeout, "int*", &pXactStat := 0, "HRESULT")
        return pXactStat
    }

    Query(iid) {
        if (IResourceManager2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Enlist2 := CallbackCreate(GetMethod(implObj, "Enlist2"), flags, 7)
        this.vtbl.Reenlist2 := CallbackCreate(GetMethod(implObj, "Reenlist2"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Enlist2)
        CallbackFree(this.vtbl.Reenlist2)
    }
}
