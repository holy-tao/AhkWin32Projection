#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\CSC_COMTIIntrinsicsConfig.ahk" { CSC_COMTIIntrinsicsConfig }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Configures the COM Transaction Integrator (COMTI) intrinsics for the work that is done when calling the CoCreateActivity or CoEnterServiceDomain function.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-iservicecomtiintrinsicsconfig
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IServiceComTIIntrinsicsConfig extends IUnknown {
    /**
     * The interface identifier for IServiceComTIIntrinsicsConfig
     * @type {Guid}
     */
    static IID := Guid("{09e6831e-04e1-4ed4-9d0f-e8b168bafeaf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IServiceComTIIntrinsicsConfig interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ComTIIntrinsicsConfig : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IServiceComTIIntrinsicsConfig.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Configures the COMTI intrinsics for the enclosed work.
     * @param {CSC_COMTIIntrinsicsConfig} comtiIntrinsicsConfig A value from the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-csc_comtiintrinsicsconfig">CSC_COMTIIntrinsicsConfig</a> enumeration.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicecomtiintrinsicsconfig-comtiintrinsicsconfig
     */
    ComTIIntrinsicsConfig(comtiIntrinsicsConfig) {
        result := ComCall(3, this, CSC_COMTIIntrinsicsConfig, comtiIntrinsicsConfig, "HRESULT")
        return result
    }

    Query(iid) {
        if (IServiceComTIIntrinsicsConfig.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ComTIIntrinsicsConfig := CallbackCreate(GetMethod(implObj, "ComTIIntrinsicsConfig"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ComTIIntrinsicsConfig)
    }
}
