#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D12_RESOURCE_DESC1.ahk" { D3D12_RESOURCE_DESC1 }
#Import ".\ID3D12Device11.ahk" { ID3D12Device11 }
#Import ".\D3D12_RESOURCE_ALLOCATION_INFO1.ahk" { D3D12_RESOURCE_ALLOCATION_INFO1 }
#Import "..\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import ".\D3D12_RESOURCE_ALLOCATION_INFO.ahk" { D3D12_RESOURCE_ALLOCATION_INFO }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12Device12 extends ID3D12Device11 {
    /**
     * The interface identifier for ID3D12Device12
     * @type {Guid}
     */
    static IID := Guid("{5af5c532-4c91-4cd0-b541-15a405395fc5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12Device12 interfaces
    */
    struct Vtbl extends ID3D12Device11.Vtbl {
        GetResourceAllocationInfo3 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12Device12.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} visibleMask 
     * @param {Integer} numResourceDescs 
     * @param {Pointer<D3D12_RESOURCE_DESC1>} pResourceDescs 
     * @param {Pointer<Integer>} pNumCastableFormats 
     * @param {Pointer<Pointer<DXGI_FORMAT>>} ppCastableFormats 
     * @param {Pointer<D3D12_RESOURCE_ALLOCATION_INFO1>} pResourceAllocationInfo1 
     * @returns {D3D12_RESOURCE_ALLOCATION_INFO} 
     */
    GetResourceAllocationInfo3(visibleMask, numResourceDescs, pResourceDescs, pNumCastableFormats, ppCastableFormats, pResourceAllocationInfo1) {
        pNumCastableFormatsMarshal := pNumCastableFormats is VarRef ? "uint*" : "ptr"
        ppCastableFormatsMarshal := ppCastableFormats is VarRef ? "ptr*" : "ptr"

        result := ComCall(80, this, "uint", visibleMask, "uint", numResourceDescs, D3D12_RESOURCE_DESC1.Ptr, pResourceDescs, pNumCastableFormatsMarshal, pNumCastableFormats, ppCastableFormatsMarshal, ppCastableFormats, D3D12_RESOURCE_ALLOCATION_INFO1.Ptr, pResourceAllocationInfo1, D3D12_RESOURCE_ALLOCATION_INFO)
        return result
    }

    Query(iid) {
        if (ID3D12Device12.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetResourceAllocationInfo3 := CallbackCreate(GetMethod(implObj, "GetResourceAllocationInfo3"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetResourceAllocationInfo3)
    }
}
