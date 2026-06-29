#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * Native interoperation interface that allows creating swapchain surfaces and graphics devices. This is interface is available in C++ only.
 * @remarks
 * See <a href="https://docs.microsoft.com/windows/desktop/api/windows.ui.composition.interop/nn-windows-ui-composition-interop-icompositiondrawingsurfaceinterop">ICompositionDrawingSurfaceInterop</a> for usage examples.
 * @see https://learn.microsoft.com/windows/win32/api/windows.ui.composition.interop/nn-windows-ui-composition-interop-icompositorinterop
 * @namespace Windows.Win32.System.WinRT.Composition
 */
export default struct ICompositorInterop extends IUnknown {
    /**
     * The interface identifier for ICompositorInterop
     * @type {Guid}
     */
    static IID := Guid("{25297d5c-3ad4-4c9c-b5cf-e36a38512330}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICompositorInterop interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateCompositionSurfaceForHandle    : IntPtr
        CreateCompositionSurfaceForSwapChain : IntPtr
        CreateGraphicsDevice                 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICompositorInterop.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates an instance of CompositionSurface for use with the handle of a swapchain. In order to host media swapchain on a CompositionSurface, use the IMFMediaEngineEx::GetVideoSwapchainHandle method.
     * @param {HANDLE} swapChain Type: <b>HANDLE*</b>
     * 
     * The handle of the swap chain to create the CompositionSurface for.
     * @returns {Pointer} Type: <b>ICompositionSurface**</b>
     * 
     * The created CompositionSurface.
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.composition.interop/nf-windows-ui-composition-interop-icompositorinterop-createcompositionsurfaceforhandle
     */
    CreateCompositionSurfaceForHandle(swapChain) {
        result := ComCall(3, this, HANDLE, swapChain, "ptr*", &result := 0, "HRESULT")
        return result
    }

    /**
     * Creates an instance of CompositionSurface for use with a swap chain.
     * @param {IUnknown} swapChain Type: <b>IUnknown*</b>
     * 
     * The swap chain to create the CompositionSurface for.
     * @returns {Pointer} Type: <b>ICompositionSurface**</b>
     * 
     * The created CompositionSurface.
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.composition.interop/nf-windows-ui-composition-interop-icompositorinterop-createcompositionsurfaceforswapchain
     */
    CreateCompositionSurfaceForSwapChain(swapChain) {
        result := ComCall(4, this, "ptr", swapChain, "ptr*", &result := 0, "HRESULT")
        return result
    }

    /**
     * Creates a CompositionGraphicsDevice backed by the specified rendering device.
     * @param {IUnknown} renderingDevice Type: <b>IUnknown*</b>
     * 
     * The rendering device to back the CompositionGraphicsDevice.
     * @returns {Pointer} Type: <b>ICompositionGraphicsDevice**</b>
     * 
     * The created CompositionGraphicsDevice.
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.composition.interop/nf-windows-ui-composition-interop-icompositorinterop-creategraphicsdevice
     */
    CreateGraphicsDevice(renderingDevice) {
        result := ComCall(5, this, "ptr", renderingDevice, "ptr*", &result := 0, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICompositorInterop.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateCompositionSurfaceForHandle := CallbackCreate(GetMethod(implObj, "CreateCompositionSurfaceForHandle"), flags, 3)
        this.vtbl.CreateCompositionSurfaceForSwapChain := CallbackCreate(GetMethod(implObj, "CreateCompositionSurfaceForSwapChain"), flags, 3)
        this.vtbl.CreateGraphicsDevice := CallbackCreate(GetMethod(implObj, "CreateGraphicsDevice"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateCompositionSurfaceForHandle)
        CallbackFree(this.vtbl.CreateCompositionSurfaceForSwapChain)
        CallbackFree(this.vtbl.CreateGraphicsDevice)
    }
}
