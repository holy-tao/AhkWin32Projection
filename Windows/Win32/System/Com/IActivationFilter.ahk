#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct IActivationFilter extends IUnknown {
    /**
     * The interface identifier for IActivationFilter
     * @type {Guid}
     */
    static IID := Guid("{00000017-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IActivationFilter interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        HandleActivation : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IActivationFilter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} dwActivationType 
     * @param {Pointer<Guid>} rclsid 
     * @returns {Guid} 
     */
    HandleActivation(dwActivationType, rclsid) {
        pReplacementClsId := Guid()
        result := ComCall(3, this, "uint", dwActivationType, Guid.Ptr, rclsid, Guid.Ptr, pReplacementClsId, "HRESULT")
        return pReplacementClsId
    }

    Query(iid) {
        if (IActivationFilter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.HandleActivation := CallbackCreate(GetMethod(implObj, "HandleActivation"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.HandleActivation)
    }
}
