#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D12_GPU_VIRTUAL_ADDRESS_RANGE.ahk" { D3D12_GPU_VIRTUAL_ADDRESS_RANGE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12PageableTools extends IUnknown {
    /**
     * The interface identifier for ID3D12PageableTools
     * @type {Guid}
     */
    static IID := Guid("{8f1359db-d8d1-42f9-b5cf-79f4cbad0d3d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12PageableTools interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetAllocation : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12PageableTools.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {D3D12_GPU_VIRTUAL_ADDRESS_RANGE} 
     */
    GetAllocation() {
        pAllocation := D3D12_GPU_VIRTUAL_ADDRESS_RANGE()
        result := ComCall(3, this, D3D12_GPU_VIRTUAL_ADDRESS_RANGE.Ptr, pAllocation, "HRESULT")
        return pAllocation
    }

    Query(iid) {
        if (ID3D12PageableTools.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetAllocation := CallbackCreate(GetMethod(implObj, "GetAllocation"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetAllocation)
    }
}
