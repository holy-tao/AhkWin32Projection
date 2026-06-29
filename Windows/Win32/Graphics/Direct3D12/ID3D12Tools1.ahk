#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D12_GPU_VIRTUAL_ADDRESS_RANGE.ahk" { D3D12_GPU_VIRTUAL_ADDRESS_RANGE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID3D12Tools.ahk" { ID3D12Tools }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12Tools1 extends ID3D12Tools {
    /**
     * The interface identifier for ID3D12Tools1
     * @type {Guid}
     */
    static IID := Guid("{e4fbc019-dd3c-43e1-8f32-7f649575f0a0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12Tools1 interfaces
    */
    struct Vtbl extends ID3D12Tools.Vtbl {
        ReserveGPUVARangesAtCreate   : IntPtr
        ClearReservedGPUVARangesList : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12Tools1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<D3D12_GPU_VIRTUAL_ADDRESS_RANGE>} pRanges 
     * @param {Integer} uiNumRanges 
     * @returns {HRESULT} 
     */
    ReserveGPUVARangesAtCreate(pRanges, uiNumRanges) {
        result := ComCall(5, this, D3D12_GPU_VIRTUAL_ADDRESS_RANGE.Ptr, pRanges, "uint", uiNumRanges, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    ClearReservedGPUVARangesList() {
        ComCall(6, this)
    }

    Query(iid) {
        if (ID3D12Tools1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ReserveGPUVARangesAtCreate := CallbackCreate(GetMethod(implObj, "ReserveGPUVARangesAtCreate"), flags, 3)
        this.vtbl.ClearReservedGPUVARangesList := CallbackCreate(GetMethod(implObj, "ClearReservedGPUVARangesList"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ReserveGPUVARangesAtCreate)
        CallbackFree(this.vtbl.ClearReservedGPUVARangesList)
    }
}
