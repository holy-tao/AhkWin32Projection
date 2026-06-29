#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D12_DRED_DEVICE_STATE.ahk" { D3D12_DRED_DEVICE_STATE }
#Import ".\ID3D12DeviceRemovedExtendedData1.ahk" { ID3D12DeviceRemovedExtendedData1 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3D12_DRED_PAGE_FAULT_OUTPUT2.ahk" { D3D12_DRED_PAGE_FAULT_OUTPUT2 }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12DeviceRemovedExtendedData2 extends ID3D12DeviceRemovedExtendedData1 {
    /**
     * The interface identifier for ID3D12DeviceRemovedExtendedData2
     * @type {Guid}
     */
    static IID := Guid("{67fc5816-e4ca-4915-bf18-42541272da54}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12DeviceRemovedExtendedData2 interfaces
    */
    struct Vtbl extends ID3D12DeviceRemovedExtendedData1.Vtbl {
        GetPageFaultAllocationOutput2 : IntPtr
        GetDeviceState                : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12DeviceRemovedExtendedData2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {D3D12_DRED_PAGE_FAULT_OUTPUT2} 
     */
    GetPageFaultAllocationOutput2() {
        pOutput := D3D12_DRED_PAGE_FAULT_OUTPUT2()
        result := ComCall(7, this, D3D12_DRED_PAGE_FAULT_OUTPUT2.Ptr, pOutput, "HRESULT")
        return pOutput
    }

    /**
     * 
     * @returns {D3D12_DRED_DEVICE_STATE} 
     */
    GetDeviceState() {
        result := ComCall(8, this, D3D12_DRED_DEVICE_STATE)
        return result
    }

    Query(iid) {
        if (ID3D12DeviceRemovedExtendedData2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPageFaultAllocationOutput2 := CallbackCreate(GetMethod(implObj, "GetPageFaultAllocationOutput2"), flags, 2)
        this.vtbl.GetDeviceState := CallbackCreate(GetMethod(implObj, "GetDeviceState"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPageFaultAllocationOutput2)
        CallbackFree(this.vtbl.GetDeviceState)
    }
}
