#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct IDtcLuRmEnlistmentSink extends IUnknown {
    /**
     * The interface identifier for IDtcLuRmEnlistmentSink
     * @type {Guid}
     */
    static IID := Guid("{4131e770-1aea-11d0-944b-00a0c905416e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDtcLuRmEnlistmentSink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AckUnplug     : IntPtr
        TmDown        : IntPtr
        SessionLost   : IntPtr
        BackedOut     : IntPtr
        BackOut       : IntPtr
        Committed     : IntPtr
        Forget        : IntPtr
        Prepare       : IntPtr
        RequestCommit : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDtcLuRmEnlistmentSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AckUnplug() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    TmDown() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SessionLost() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    BackedOut() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    BackOut() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Committed() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Forget() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Prepare() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RequestCommit() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDtcLuRmEnlistmentSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AckUnplug := CallbackCreate(GetMethod(implObj, "AckUnplug"), flags, 1)
        this.vtbl.TmDown := CallbackCreate(GetMethod(implObj, "TmDown"), flags, 1)
        this.vtbl.SessionLost := CallbackCreate(GetMethod(implObj, "SessionLost"), flags, 1)
        this.vtbl.BackedOut := CallbackCreate(GetMethod(implObj, "BackedOut"), flags, 1)
        this.vtbl.BackOut := CallbackCreate(GetMethod(implObj, "BackOut"), flags, 1)
        this.vtbl.Committed := CallbackCreate(GetMethod(implObj, "Committed"), flags, 1)
        this.vtbl.Forget := CallbackCreate(GetMethod(implObj, "Forget"), flags, 1)
        this.vtbl.Prepare := CallbackCreate(GetMethod(implObj, "Prepare"), flags, 1)
        this.vtbl.RequestCommit := CallbackCreate(GetMethod(implObj, "RequestCommit"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AckUnplug)
        CallbackFree(this.vtbl.TmDown)
        CallbackFree(this.vtbl.SessionLost)
        CallbackFree(this.vtbl.BackedOut)
        CallbackFree(this.vtbl.BackOut)
        CallbackFree(this.vtbl.Committed)
        CallbackFree(this.vtbl.Forget)
        CallbackFree(this.vtbl.Prepare)
        CallbackFree(this.vtbl.RequestCommit)
    }
}
