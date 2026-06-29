#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DXGI_ADAPTER_DESC3.ahk" { DXGI_ADAPTER_DESC3 }
#Import ".\IDXGIAdapter3.ahk" { IDXGIAdapter3 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * This interface represents a display subsystem, and extends this family of interfaces to expose a method to check for an adapter's compatibility with Arbitrary Code Guard (ACG).
 * @remarks
 * For more details, refer to the <a href="https://docs.microsoft.com/windows/desktop/direct3d12/residency">Residency</a> section of the D3D12 documentation.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi1_6/nn-dxgi1_6-idxgiadapter4
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct IDXGIAdapter4 extends IDXGIAdapter3 {
    /**
     * The interface identifier for IDXGIAdapter4
     * @type {Guid}
     */
    static IID := Guid("{3c8d99d1-4fbf-4181-a82c-af66bf7bd24e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDXGIAdapter4 interfaces
    */
    struct Vtbl extends IDXGIAdapter3.Vtbl {
        GetDesc3 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDXGIAdapter4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets a Microsoft DirectX Graphics Infrastructure (DXGI) 1.6 description of an adapter or video card. This description includes information about ACG compatibility.
     * @remarks
     * Use the <b>GetDesc3</b> method to get a DXGI 1.6 description of an adapter.  To get a DXGI 1.2 description, use the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgiadapter2-getdesc2">IDXGIAdapter2::GetDesc2</a> method. To get a DXGI 1.1 description, use the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiadapter1-getdesc1">IDXGIAdapter1::GetDesc1</a> method. To get a DXGI 1.0 description, use the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiadapter-getdesc">IDXGIAdapter::GetDesc</a> method.
     * 
     * The Windows Display Driver Model (WDDM) scheduler can preempt the graphics processing unit (GPU)'s execution of application tasks. The granularity at which the GPU can be preempted from performing its current task in the WDDM 1.1 or earlier driver model is a direct memory access (DMA) buffer for graphics tasks or a compute packet for compute tasks. The GPU can switch between tasks only after it completes the currently executing unit of work, a DMA buffer or a compute packet. 
     * 
     * A DMA buffer is the largest independent unit of graphics work that the WDDM scheduler can submit to the GPU. This buffer contains a set of GPU instructions that the WDDM driver and GPU use. A compute packet is the largest independent unit of compute work that the WDDM scheduler can submit to the GPU. A compute packet contains dispatches (for example, calls to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-dispatch">ID3D11DeviceContext::Dispatch</a> method), which contain thread groups. The WDDM 1.2 or later driver model allows the GPU to be preempted at finer granularity levels than a DMA buffer or compute packet. You can use the <b>GetDesc3</b> or <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgiadapter2-getdesc2">GetDesc2</a> methods to retrieve the granularity levels for graphics and compute tasks.
     * @returns {DXGI_ADAPTER_DESC3} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_6/ns-dxgi1_6-dxgi_adapter_desc3">DXGI_ADAPTER_DESC3</a> structure that describes the adapter.  
     * 	    This parameter must not be <b>NULL</b>. On <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature level</a> 9 graphics hardware, early versions of  <b>GetDesc3</b> (<a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiadapter1-getdesc1">GetDesc1</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiadapter-getdesc">GetDesc</a>) return zeros for the PCI ID in the <b>VendorId</b>, <b>DeviceId</b>, <b>SubSysId</b>, and <b>Revision</b> members of the adapter description structure and “Software Adapter” for the description string in the <b>Description</b> member. <b>GetDesc3</b> and <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgiadapter2-getdesc2">GetDesc2</a> return the actual feature level 9 hardware values in these members.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_6/nf-dxgi1_6-idxgiadapter4-getdesc3
     */
    GetDesc3() {
        pDesc := DXGI_ADAPTER_DESC3()
        result := ComCall(18, this, DXGI_ADAPTER_DESC3.Ptr, pDesc, "HRESULT")
        return pDesc
    }

    Query(iid) {
        if (IDXGIAdapter4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDesc3 := CallbackCreate(GetMethod(implObj, "GetDesc3"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDesc3)
    }
}
