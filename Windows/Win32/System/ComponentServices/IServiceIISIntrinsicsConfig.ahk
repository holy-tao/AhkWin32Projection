#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\CSC_IISIntrinsicsConfig.ahk" { CSC_IISIntrinsicsConfig }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Configures the IIS intrinsics for the work that is done when calling the CoCreateActivity or CoEnterServiceDomain function.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-iserviceiisintrinsicsconfig
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IServiceIISIntrinsicsConfig extends IUnknown {
    /**
     * The interface identifier for IServiceIISIntrinsicsConfig
     * @type {Guid}
     */
    static IID := Guid("{1a0cf920-d452-46f4-bc36-48118d54ea52}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IServiceIISIntrinsicsConfig interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        IISIntrinsicsConfig : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IServiceIISIntrinsicsConfig.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Configures the IIS intrinsics for the enclosed work.
     * @param {CSC_IISIntrinsicsConfig} iisIntrinsicsConfig A value from the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-csc_iisintrinsicsconfig">CSC_IISIntrinsicsConfig</a> enumeration.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iserviceiisintrinsicsconfig-iisintrinsicsconfig
     */
    IISIntrinsicsConfig(iisIntrinsicsConfig) {
        result := ComCall(3, this, CSC_IISIntrinsicsConfig, iisIntrinsicsConfig, "HRESULT")
        return result
    }

    Query(iid) {
        if (IServiceIISIntrinsicsConfig.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IISIntrinsicsConfig := CallbackCreate(GetMethod(implObj, "IISIntrinsicsConfig"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IISIntrinsicsConfig)
    }
}
