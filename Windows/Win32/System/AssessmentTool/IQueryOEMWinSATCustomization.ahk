#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\WINSAT_OEM_CUSTOMIZATION_STATE.ahk" { WINSAT_OEM_CUSTOMIZATION_STATE }

/**
 * @namespace Windows.Win32.System.AssessmentTool
 */
export default struct IQueryOEMWinSATCustomization extends IUnknown {
    /**
     * The interface identifier for IQueryOEMWinSATCustomization
     * @type {Guid}
     */
    static IID := Guid("{bc9a6a9f-ad4e-420e-9953-b34671e9df22}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IQueryOEMWinSATCustomization interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetOEMPrePopulationInfo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IQueryOEMWinSATCustomization.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {WINSAT_OEM_CUSTOMIZATION_STATE} 
     */
    GetOEMPrePopulationInfo() {
        result := ComCall(3, this, "int*", &state := 0, "HRESULT")
        return state
    }

    Query(iid) {
        if (IQueryOEMWinSATCustomization.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetOEMPrePopulationInfo := CallbackCreate(GetMethod(implObj, "GetOEMPrePopulationInfo"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetOEMPrePopulationInfo)
    }
}
