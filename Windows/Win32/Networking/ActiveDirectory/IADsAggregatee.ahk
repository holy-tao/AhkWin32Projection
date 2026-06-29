#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IADsAggregatee extends IUnknown {
    /**
     * The interface identifier for IADsAggregatee
     * @type {Guid}
     */
    static IID := Guid("{1346ce8c-9039-11d0-8528-00c04fd8d503}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IADsAggregatee interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ConnectAsAggregatee    : IntPtr
        DisconnectAsAggregatee : IntPtr
        RelinquishInterface    : IntPtr
        RestoreInterface       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IADsAggregatee.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IUnknown} pOuterUnknown 
     * @returns {HRESULT} 
     */
    ConnectAsAggregatee(pOuterUnknown) {
        result := ComCall(3, this, "ptr", pOuterUnknown, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DisconnectAsAggregatee() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {HRESULT} 
     */
    RelinquishInterface(riid) {
        result := ComCall(5, this, Guid.Ptr, riid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {HRESULT} 
     */
    RestoreInterface(riid) {
        result := ComCall(6, this, Guid.Ptr, riid, "HRESULT")
        return result
    }

    Query(iid) {
        if (IADsAggregatee.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ConnectAsAggregatee := CallbackCreate(GetMethod(implObj, "ConnectAsAggregatee"), flags, 2)
        this.vtbl.DisconnectAsAggregatee := CallbackCreate(GetMethod(implObj, "DisconnectAsAggregatee"), flags, 1)
        this.vtbl.RelinquishInterface := CallbackCreate(GetMethod(implObj, "RelinquishInterface"), flags, 2)
        this.vtbl.RestoreInterface := CallbackCreate(GetMethod(implObj, "RestoreInterface"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ConnectAsAggregatee)
        CallbackFree(this.vtbl.DisconnectAsAggregatee)
        CallbackFree(this.vtbl.RelinquishInterface)
        CallbackFree(this.vtbl.RestoreInterface)
    }
}
