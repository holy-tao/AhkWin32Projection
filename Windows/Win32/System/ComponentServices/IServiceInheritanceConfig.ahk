#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\CSC_InheritanceConfig.ahk" { CSC_InheritanceConfig }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Determines whether to construct a new context based on the current context or to create a new context based solely on the information in CServiceConfig.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-iserviceinheritanceconfig
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IServiceInheritanceConfig extends IUnknown {
    /**
     * The interface identifier for IServiceInheritanceConfig
     * @type {Guid}
     */
    static IID := Guid("{92186771-d3b4-4d77-a8ea-ee842d586f35}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IServiceInheritanceConfig interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ContainingContextTreatment : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IServiceInheritanceConfig.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Determines whether the containing context is based on the current context.
     * @param {CSC_InheritanceConfig} inheritanceConfig A value from the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-csc_inheritanceconfig">CSC_InheritanceConfig</a> enumeration.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iserviceinheritanceconfig-containingcontexttreatment
     */
    ContainingContextTreatment(inheritanceConfig) {
        result := ComCall(3, this, CSC_InheritanceConfig, inheritanceConfig, "HRESULT")
        return result
    }

    Query(iid) {
        if (IServiceInheritanceConfig.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ContainingContextTreatment := CallbackCreate(GetMethod(implObj, "ContainingContextTreatment"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ContainingContextTreatment)
    }
}
