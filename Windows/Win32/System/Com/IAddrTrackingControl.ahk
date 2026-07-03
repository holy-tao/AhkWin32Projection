#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct IAddrTrackingControl extends IUnknown {
    /**
     * The interface identifier for IAddrTrackingControl
     * @type {Guid}
     */
    static IID := Guid("{00000147-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAddrTrackingControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        EnableCOMDynamicAddrTracking  : IntPtr
        DisableCOMDynamicAddrTracking : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAddrTrackingControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EnableCOMDynamicAddrTracking() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DisableCOMDynamicAddrTracking() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAddrTrackingControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnableCOMDynamicAddrTracking := CallbackCreate(GetMethod(implObj, "EnableCOMDynamicAddrTracking"), flags, 1)
        this.vtbl.DisableCOMDynamicAddrTracking := CallbackCreate(GetMethod(implObj, "DisableCOMDynamicAddrTracking"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnableCOMDynamicAddrTracking)
        CallbackFree(this.vtbl.DisableCOMDynamicAddrTracking)
    }
}
