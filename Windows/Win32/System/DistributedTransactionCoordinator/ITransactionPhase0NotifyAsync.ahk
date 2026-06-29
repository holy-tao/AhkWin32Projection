#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct ITransactionPhase0NotifyAsync extends IUnknown {
    /**
     * The interface identifier for ITransactionPhase0NotifyAsync
     * @type {Guid}
     */
    static IID := Guid("{ef081809-0c76-11d2-87a6-00c04f990f34}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITransactionPhase0NotifyAsync interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Phase0Request   : IntPtr
        EnlistCompleted : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITransactionPhase0NotifyAsync.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BOOL} fAbortingHint 
     * @returns {HRESULT} 
     */
    Phase0Request(fAbortingHint) {
        result := ComCall(3, this, BOOL, fAbortingHint, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} _status 
     * @returns {HRESULT} 
     */
    EnlistCompleted(_status) {
        result := ComCall(4, this, "int", _status, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITransactionPhase0NotifyAsync.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Phase0Request := CallbackCreate(GetMethod(implObj, "Phase0Request"), flags, 2)
        this.vtbl.EnlistCompleted := CallbackCreate(GetMethod(implObj, "EnlistCompleted"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Phase0Request)
        CallbackFree(this.vtbl.EnlistCompleted)
    }
}
