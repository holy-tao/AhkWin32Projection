#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\XACTTRANSINFO.ahk" { XACTTRANSINFO }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\BOID.ahk" { BOID }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct ITransaction extends IUnknown {
    /**
     * The interface identifier for ITransaction
     * @type {Guid}
     */
    static IID := Guid("{0fb15084-af41-11ce-bd2b-204c4f4f5020}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITransaction interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Commit             : IntPtr
        Abort              : IntPtr
        GetTransactionInfo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITransaction.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BOOL} fRetaining 
     * @param {Integer} grfTC 
     * @param {Integer} grfRM 
     * @returns {HRESULT} 
     */
    Commit(fRetaining, grfTC, grfRM) {
        result := ComCall(3, this, BOOL, fRetaining, "uint", grfTC, "uint", grfRM, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOID>} pboidReason 
     * @param {BOOL} fRetaining 
     * @param {BOOL} fAsync 
     * @returns {HRESULT} 
     */
    Abort(pboidReason, fRetaining, fAsync) {
        result := ComCall(4, this, BOID.Ptr, pboidReason, BOOL, fRetaining, BOOL, fAsync, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {XACTTRANSINFO} 
     */
    GetTransactionInfo() {
        pinfo := XACTTRANSINFO()
        result := ComCall(5, this, XACTTRANSINFO.Ptr, pinfo, "HRESULT")
        return pinfo
    }

    Query(iid) {
        if (ITransaction.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Commit := CallbackCreate(GetMethod(implObj, "Commit"), flags, 4)
        this.vtbl.Abort := CallbackCreate(GetMethod(implObj, "Abort"), flags, 4)
        this.vtbl.GetTransactionInfo := CallbackCreate(GetMethod(implObj, "GetTransactionInfo"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Commit)
        CallbackFree(this.vtbl.Abort)
        CallbackFree(this.vtbl.GetTransactionInfo)
    }
}
