#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDXGIFactory3.ahk" { IDXGIFactory3 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\LUID.ahk" { LUID }

/**
 * Enables creating Microsoft DirectX Graphics Infrastructure (DXGI) objects. (IDXGIFactory4)
 * @see https://learn.microsoft.com/windows/win32/api/dxgi1_4/nn-dxgi1_4-idxgifactory4
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct IDXGIFactory4 extends IDXGIFactory3 {
    /**
     * The interface identifier for IDXGIFactory4
     * @type {Guid}
     */
    static IID := Guid("{1bc6ea02-ef36-464f-bf0c-21ca39e5168a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDXGIFactory4 interfaces
    */
    struct Vtbl extends IDXGIFactory3.Vtbl {
        EnumAdapterByLuid : IntPtr
        EnumWarpAdapter   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDXGIFactory4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Outputs the IDXGIAdapter for the specified LUID.
     * @remarks
     * For Direct3D 12, it's no longer possible to backtrack from a device to the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiadapter">IDXGIAdapter</a> that was used to create it.
     *           <b>IDXGIFactory4::EnumAdapterByLuid</b> enables an app to retrieve information about the adapter where a D3D12 device was created.
     *           <b>IDXGIFactory4::EnumAdapterByLuid</b> is designed to be paired with <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-getadapterluid">ID3D12Device::GetAdapterLuid</a>.
     *           For more information, see <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-1-4-improvements">DXGI 1.4 Improvements</a>.
     * @param {LUID} AdapterLuid Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff549708(v=vs.85)">LUID</a></b>
     * 
     * A unique value that identifies the adapter.
     *             See <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff549708(v=vs.85)">LUID</a> for a definition of the structure.
     *             <b>LUID</b> is defined in dxgi.h.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The globally unique identifier (GUID) of the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiadapter">IDXGIAdapter</a> object referenced by the <i>ppvAdapter</i> parameter.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * The address of an <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiadapter">IDXGIAdapter</a> interface pointer to the adapter.
     *             This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_4/nf-dxgi1_4-idxgifactory4-enumadapterbyluid
     */
    EnumAdapterByLuid(AdapterLuid, riid) {
        result := ComCall(26, this, LUID, AdapterLuid, Guid.Ptr, riid, "ptr*", &ppvAdapter := 0, "HRESULT")
        return ppvAdapter
    }

    /**
     * Provides an adapter which can be provided to D3D12CreateDevice to use the WARP renderer.
     * @remarks
     * For more information, see <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-1-4-improvements">DXGI 1.4 Improvements</a>.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The globally unique identifier (GUID) of the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiadapter">IDXGIAdapter</a> object referenced by the <i>ppvAdapter</i> parameter.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * The address of an <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiadapter">IDXGIAdapter</a> interface pointer to the adapter.
     *             This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_4/nf-dxgi1_4-idxgifactory4-enumwarpadapter
     */
    EnumWarpAdapter(riid) {
        result := ComCall(27, this, Guid.Ptr, riid, "ptr*", &ppvAdapter := 0, "HRESULT")
        return ppvAdapter
    }

    Query(iid) {
        if (IDXGIFactory4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnumAdapterByLuid := CallbackCreate(GetMethod(implObj, "EnumAdapterByLuid"), flags, 4)
        this.vtbl.EnumWarpAdapter := CallbackCreate(GetMethod(implObj, "EnumWarpAdapter"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnumAdapterByLuid)
        CallbackFree(this.vtbl.EnumWarpAdapter)
    }
}
