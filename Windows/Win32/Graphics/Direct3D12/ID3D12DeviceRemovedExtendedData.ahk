#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D12_DRED_AUTO_BREADCRUMBS_OUTPUT.ahk" { D3D12_DRED_AUTO_BREADCRUMBS_OUTPUT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\D3D12_DRED_PAGE_FAULT_OUTPUT.ahk" { D3D12_DRED_PAGE_FAULT_OUTPUT }

/**
 * Provides runtime access to Device Removed Extended Data (DRED) data.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12deviceremovedextendeddata
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12DeviceRemovedExtendedData extends IUnknown {
    /**
     * The interface identifier for ID3D12DeviceRemovedExtendedData
     * @type {Guid}
     */
    static IID := Guid("{98931d33-5ae8-4791-aa3c-1a73a2934e71}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12DeviceRemovedExtendedData interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetAutoBreadcrumbsOutput     : IntPtr
        GetPageFaultAllocationOutput : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12DeviceRemovedExtendedData.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the Device Removed Extended Data (DRED) auto-breadcrumbs output after device removal.
     * @returns {D3D12_DRED_AUTO_BREADCRUMBS_OUTPUT} An output parameter that takes the address of a [D3D12_DRED_AUTO_BREADCRUMBS_OUTPUT](ns-d3d12-d3d12_dred_auto_breadcrumbs_output.md) object. The object whose address is passed receives the data.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12deviceremovedextendeddata-getautobreadcrumbsoutput
     */
    GetAutoBreadcrumbsOutput() {
        pOutput := D3D12_DRED_AUTO_BREADCRUMBS_OUTPUT()
        result := ComCall(3, this, D3D12_DRED_AUTO_BREADCRUMBS_OUTPUT.Ptr, pOutput, "HRESULT")
        return pOutput
    }

    /**
     * Retrieves the Device Removed Extended Data (DRED) page fault data.
     * @returns {D3D12_DRED_PAGE_FAULT_OUTPUT} An output parameter that takes the address of a [D3D12_DRED_PAGE_FAULT_OUTPUT](ns-d3d12-d3d12_dred_page_fault_output.md) object.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12deviceremovedextendeddata-getpagefaultallocationoutput
     */
    GetPageFaultAllocationOutput() {
        pOutput := D3D12_DRED_PAGE_FAULT_OUTPUT()
        result := ComCall(4, this, D3D12_DRED_PAGE_FAULT_OUTPUT.Ptr, pOutput, "HRESULT")
        return pOutput
    }

    Query(iid) {
        if (ID3D12DeviceRemovedExtendedData.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetAutoBreadcrumbsOutput := CallbackCreate(GetMethod(implObj, "GetAutoBreadcrumbsOutput"), flags, 2)
        this.vtbl.GetPageFaultAllocationOutput := CallbackCreate(GetMethod(implObj, "GetPageFaultAllocationOutput"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetAutoBreadcrumbsOutput)
        CallbackFree(this.vtbl.GetPageFaultAllocationOutput)
    }
}
