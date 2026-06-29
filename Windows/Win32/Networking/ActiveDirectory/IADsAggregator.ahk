#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IADsAggregator extends IUnknown {
    /**
     * The interface identifier for IADsAggregator
     * @type {Guid}
     */
    static IID := Guid("{52db5fb0-941f-11d0-8529-00c04fd8d503}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IADsAggregator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ConnectAsAggregator    : IntPtr
        DisconnectAsAggregator : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IADsAggregator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IUnknown} pAggregatee 
     * @returns {HRESULT} 
     */
    ConnectAsAggregator(pAggregatee) {
        result := ComCall(3, this, "ptr", pAggregatee, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DisconnectAsAggregator() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IADsAggregator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ConnectAsAggregator := CallbackCreate(GetMethod(implObj, "ConnectAsAggregator"), flags, 2)
        this.vtbl.DisconnectAsAggregator := CallbackCreate(GetMethod(implObj, "DisconnectAsAggregator"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ConnectAsAggregator)
        CallbackFree(this.vtbl.DisconnectAsAggregator)
    }
}
