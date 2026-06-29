#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDXGIOutput1.ahk" { IDXGIOutput1 }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Represents an adapter output (such as a monitor). The IDXGIOutput2 interface exposes a method to check for multiplane overlay support on the primary output adapter.
 * @remarks
 * To determine  the outputs that are available from the adapter, use <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiadapter-enumoutputs">IDXGIAdapter::EnumOutputs</a>. To determine the specific output that the swap chain will update, use <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiswapchain-getcontainingoutput">IDXGISwapChain::GetContainingOutput</a>. You can then call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> from any  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgioutput">IDXGIOutput</a> or <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nn-dxgi1_2-idxgioutput1">IDXGIOutput1</a> object to obtain an <b>IDXGIOutput2</b> object.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi1_3/nn-dxgi1_3-idxgioutput2
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct IDXGIOutput2 extends IDXGIOutput1 {
    /**
     * The interface identifier for IDXGIOutput2
     * @type {Guid}
     */
    static IID := Guid("{595e39d1-2724-4663-99b1-da969de28364}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDXGIOutput2 interfaces
    */
    struct Vtbl extends IDXGIOutput1.Vtbl {
        SupportsOverlays : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDXGIOutput2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Queries an adapter output for multiplane overlay support.
     * @remarks
     * See <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforcorewindow">CreateSwapChainForCoreWindow</a> for info on creating a foreground swap chain.
     * @returns {BOOL} TRUE if the output adapter is the primary adapter and it supports multiplane overlays, otherwise returns FALSE.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_3/nf-dxgi1_3-idxgioutput2-supportsoverlays
     */
    SupportsOverlays() {
        result := ComCall(23, this, BOOL)
        return result
    }

    Query(iid) {
        if (IDXGIOutput2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SupportsOverlays := CallbackCreate(GetMethod(implObj, "SupportsOverlays"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SupportsOverlays)
    }
}
