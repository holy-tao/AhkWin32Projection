#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D11On12Device.ahk" { ID3D11On12Device }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Enables better interoperability with a component that might be handed a Direct3D 11 device, but which wants to leverage Direct3D 12 instead.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11on12/nn-d3d11on12-id3d11on12device1
 * @namespace Windows.Win32.Graphics.Direct3D11on12
 */
export default struct ID3D11On12Device1 extends ID3D11On12Device {
    /**
     * The interface identifier for ID3D11On12Device1
     * @type {Guid}
     */
    static IID := Guid("{bdb64df4-ea2f-4c70-b861-aaab1258bb5d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D11On12Device1 interfaces
    */
    struct Vtbl extends ID3D11On12Device.Vtbl {
        GetD3D12Device : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D11On12Device1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the [Direct3D 12 device](/windows/desktop/api/d3d12/nn-d3d12-id3d12device) being interoperated with.
     * @param {Pointer<Guid>} riid Type: **REFIID**
     * 
     * A reference to the globally unique identifier (GUID) of the interface that you wish to be returned in `ppvDevice`. This is expected to be the GUID of [ID3D12Device](/windows/desktop/api/d3d12/nn-d3d12-id3d12device).
     * @returns {Pointer<Void>} Type: **[void](/windows/desktop/winprog/windows-data-types)\*\***
     * 
     * A pointer to a memory block that receives a pointer to the device. This is the address of a pointer to an [ID3D12Device](/windows/desktop/api/d3d12/nn-d3d12-id3d12device), representing the Direct3D 12 device.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11on12/nf-d3d11on12-id3d11on12device1-getd3d12device
     */
    GetD3D12Device(riid) {
        result := ComCall(6, this, Guid.Ptr, riid, "ptr*", &ppvDevice := 0, "HRESULT")
        return ppvDevice
    }

    Query(iid) {
        if (ID3D11On12Device1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetD3D12Device := CallbackCreate(GetMethod(implObj, "GetD3D12Device"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetD3D12Device)
    }
}
