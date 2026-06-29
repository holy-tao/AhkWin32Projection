#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDXGIFactory2.ahk" { IDXGIFactory2 }
#Import ".\DXGI_CREATE_FACTORY_FLAGS.ahk" { DXGI_CREATE_FACTORY_FLAGS }

/**
 * Enables creating Microsoft DirectX Graphics Infrastructure (DXGI) objects. (IDXGIFactory3)
 * @see https://learn.microsoft.com/windows/win32/api/dxgi1_3/nn-dxgi1_3-idxgifactory3
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct IDXGIFactory3 extends IDXGIFactory2 {
    /**
     * The interface identifier for IDXGIFactory3
     * @type {Guid}
     */
    static IID := Guid("{25483823-cd46-4c7d-86ca-47aa95b837bd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDXGIFactory3 interfaces
    */
    struct Vtbl extends IDXGIFactory2.Vtbl {
        GetCreationFlags : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDXGIFactory3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the flags that were used when a Microsoft DirectX Graphics Infrastructure (DXGI) object was created.
     * @remarks
     * The <b>GetCreationFlags</b> method returns flags that were passed to the  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_3/nf-dxgi1_3-createdxgifactory2">CreateDXGIFactory2</a> function, or were implicitly constructed by <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-createdxgifactory">CreateDXGIFactory</a>, <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-createdxgifactory1">CreateDXGIFactory1</a>,  <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-d3d11createdevice">D3D11CreateDevice</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-d3d11createdeviceandswapchain">D3D11CreateDeviceAndSwapChain</a>.
     * @returns {DXGI_CREATE_FACTORY_FLAGS} The creation flags.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_3/nf-dxgi1_3-idxgifactory3-getcreationflags
     */
    GetCreationFlags() {
        result := ComCall(25, this, DXGI_CREATE_FACTORY_FLAGS)
        return result
    }

    Query(iid) {
        if (IDXGIFactory3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCreationFlags := CallbackCreate(GetMethod(implObj, "GetCreationFlags"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCreationFlags)
    }
}
