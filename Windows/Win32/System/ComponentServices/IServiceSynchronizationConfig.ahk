#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\CSC_SynchronizationConfig.ahk" { CSC_SynchronizationConfig }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Configures the synchronization for the work that is done when calling either CoCreateActivity or CoEnterServiceDomain.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-iservicesynchronizationconfig
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IServiceSynchronizationConfig extends IUnknown {
    /**
     * The interface identifier for IServiceSynchronizationConfig
     * @type {Guid}
     */
    static IID := Guid("{fd880e81-6dce-4c58-af83-a208846c0030}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IServiceSynchronizationConfig interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ConfigureSynchronization : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IServiceSynchronizationConfig.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Configures the synchronization for the enclosed work.
     * @param {CSC_SynchronizationConfig} synchConfig A value from the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-csc_synchronizationconfig">CSC_SynchronizationConfig</a> enumeration.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicesynchronizationconfig-configuresynchronization
     */
    ConfigureSynchronization(synchConfig) {
        result := ComCall(3, this, CSC_SynchronizationConfig, synchConfig, "HRESULT")
        return result
    }

    Query(iid) {
        if (IServiceSynchronizationConfig.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ConfigureSynchronization := CallbackCreate(GetMethod(implObj, "ConfigureSynchronization"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ConfigureSynchronization)
    }
}
