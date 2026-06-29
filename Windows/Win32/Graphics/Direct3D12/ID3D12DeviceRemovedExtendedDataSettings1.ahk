#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D12_DRED_ENABLEMENT.ahk" { D3D12_DRED_ENABLEMENT }
#Import ".\ID3D12DeviceRemovedExtendedDataSettings.ahk" { ID3D12DeviceRemovedExtendedDataSettings }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12DeviceRemovedExtendedDataSettings1 extends ID3D12DeviceRemovedExtendedDataSettings {
    /**
     * The interface identifier for ID3D12DeviceRemovedExtendedDataSettings1
     * @type {Guid}
     */
    static IID := Guid("{dbd5ae51-3317-4f0a-adf9-1d7cedcaae0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12DeviceRemovedExtendedDataSettings1 interfaces
    */
    struct Vtbl extends ID3D12DeviceRemovedExtendedDataSettings.Vtbl {
        SetBreadcrumbContextEnablement : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12DeviceRemovedExtendedDataSettings1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {D3D12_DRED_ENABLEMENT} Enablement 
     * @returns {String} Nothing - always returns an empty string
     */
    SetBreadcrumbContextEnablement(Enablement) {
        ComCall(6, this, D3D12_DRED_ENABLEMENT, Enablement)
    }

    Query(iid) {
        if (ID3D12DeviceRemovedExtendedDataSettings1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetBreadcrumbContextEnablement := CallbackCreate(GetMethod(implObj, "SetBreadcrumbContextEnablement"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetBreadcrumbContextEnablement)
    }
}
