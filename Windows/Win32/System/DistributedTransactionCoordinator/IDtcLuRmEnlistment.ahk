#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct IDtcLuRmEnlistment extends IUnknown {
    /**
     * The interface identifier for IDtcLuRmEnlistment
     * @type {Guid}
     */
    static IID := Guid("{4131e769-1aea-11d0-944b-00a0c905416e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDtcLuRmEnlistment interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Unplug        : IntPtr
        BackedOut     : IntPtr
        BackOut       : IntPtr
        Committed     : IntPtr
        Forget        : IntPtr
        RequestCommit : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDtcLuRmEnlistment.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BOOL} fConversationLost 
     * @returns {HRESULT} 
     */
    Unplug(fConversationLost) {
        result := ComCall(3, this, BOOL, fConversationLost, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    BackedOut() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    BackOut() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Committed() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Forget() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RequestCommit() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDtcLuRmEnlistment.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Unplug := CallbackCreate(GetMethod(implObj, "Unplug"), flags, 2)
        this.vtbl.BackedOut := CallbackCreate(GetMethod(implObj, "BackedOut"), flags, 1)
        this.vtbl.BackOut := CallbackCreate(GetMethod(implObj, "BackOut"), flags, 1)
        this.vtbl.Committed := CallbackCreate(GetMethod(implObj, "Committed"), flags, 1)
        this.vtbl.Forget := CallbackCreate(GetMethod(implObj, "Forget"), flags, 1)
        this.vtbl.RequestCommit := CallbackCreate(GetMethod(implObj, "RequestCommit"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Unplug)
        CallbackFree(this.vtbl.BackedOut)
        CallbackFree(this.vtbl.BackOut)
        CallbackFree(this.vtbl.Committed)
        CallbackFree(this.vtbl.Forget)
        CallbackFree(this.vtbl.RequestCommit)
    }
}
