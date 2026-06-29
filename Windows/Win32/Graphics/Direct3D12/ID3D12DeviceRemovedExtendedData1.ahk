#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D12_DRED_AUTO_BREADCRUMBS_OUTPUT1.ahk" { D3D12_DRED_AUTO_BREADCRUMBS_OUTPUT1 }
#Import ".\ID3D12DeviceRemovedExtendedData.ahk" { ID3D12DeviceRemovedExtendedData }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3D12_DRED_PAGE_FAULT_OUTPUT1.ahk" { D3D12_DRED_PAGE_FAULT_OUTPUT1 }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12DeviceRemovedExtendedData1 extends ID3D12DeviceRemovedExtendedData {
    /**
     * The interface identifier for ID3D12DeviceRemovedExtendedData1
     * @type {Guid}
     */
    static IID := Guid("{9727a022-cf1d-4dda-9eba-effa653fc506}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12DeviceRemovedExtendedData1 interfaces
    */
    struct Vtbl extends ID3D12DeviceRemovedExtendedData.Vtbl {
        GetAutoBreadcrumbsOutput1     : IntPtr
        GetPageFaultAllocationOutput1 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12DeviceRemovedExtendedData1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {D3D12_DRED_AUTO_BREADCRUMBS_OUTPUT1} 
     */
    GetAutoBreadcrumbsOutput1() {
        pOutput := D3D12_DRED_AUTO_BREADCRUMBS_OUTPUT1()
        result := ComCall(5, this, D3D12_DRED_AUTO_BREADCRUMBS_OUTPUT1.Ptr, pOutput, "HRESULT")
        return pOutput
    }

    /**
     * 
     * @returns {D3D12_DRED_PAGE_FAULT_OUTPUT1} 
     */
    GetPageFaultAllocationOutput1() {
        pOutput := D3D12_DRED_PAGE_FAULT_OUTPUT1()
        result := ComCall(6, this, D3D12_DRED_PAGE_FAULT_OUTPUT1.Ptr, pOutput, "HRESULT")
        return pOutput
    }

    Query(iid) {
        if (ID3D12DeviceRemovedExtendedData1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetAutoBreadcrumbsOutput1 := CallbackCreate(GetMethod(implObj, "GetAutoBreadcrumbsOutput1"), flags, 2)
        this.vtbl.GetPageFaultAllocationOutput1 := CallbackCreate(GetMethod(implObj, "GetPageFaultAllocationOutput1"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetAutoBreadcrumbsOutput1)
        CallbackFree(this.vtbl.GetPageFaultAllocationOutput1)
    }
}
