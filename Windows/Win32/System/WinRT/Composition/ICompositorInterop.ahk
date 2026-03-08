#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * Native interoperation interface that allows creating swapchain surfaces and graphics devices. This is interface is available in C++ only.
 * @remarks
 * See <a href="https://docs.microsoft.com/windows/desktop/api/windows.ui.composition.interop/nn-windows-ui-composition-interop-icompositiondrawingsurfaceinterop">ICompositionDrawingSurfaceInterop</a> for usage examples.
 * @see https://learn.microsoft.com/windows/win32/api/windows.ui.composition.interop/nn-windows-ui-composition-interop-icompositorinterop
 * @namespace Windows.Win32.System.WinRT.Composition
 * @version v4.0.30319
 */
class ICompositorInterop extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositorInterop
     * @type {Guid}
     */
    static IID => Guid("{25297d5c-3ad4-4c9c-b5cf-e36a38512330}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateCompositionSurfaceForHandle", "CreateCompositionSurfaceForSwapChain", "CreateGraphicsDevice"]

    /**
     * Creates an instance of CompositionSurface for use with the handle of a swapchain. In order to host media swapchain on a CompositionSurface, use the IMFMediaEngineEx::GetVideoSwapchainHandle method.
     * @param {HANDLE} swapChain Type: <b>HANDLE*</b>
     * 
     * The handle of the swap chain to create the CompositionSurface for.
     * @returns {Pointer<ICompositionSurface>} Type: <b>ICompositionSurface**</b>
     * 
     * The created CompositionSurface.
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.composition.interop/nf-windows-ui-composition-interop-icompositorinterop-createcompositionsurfaceforhandle
     */
    CreateCompositionSurfaceForHandle(swapChain) {
        swapChain := swapChain is Win32Handle ? NumGet(swapChain, "ptr") : swapChain

        result := ComCall(3, this, "ptr", swapChain, "ptr*", &result := 0, "HRESULT")
        return result
    }

    /**
     * Creates an instance of CompositionSurface for use with a swap chain.
     * @param {IUnknown} swapChain Type: <b>IUnknown*</b>
     * 
     * The swap chain to create the CompositionSurface for.
     * @returns {Pointer<ICompositionSurface>} Type: <b>ICompositionSurface**</b>
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
     * @returns {Pointer<CompositionGraphicsDevice>} Type: <b>ICompositionGraphicsDevice**</b>
     * 
     * The created CompositionGraphicsDevice.
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.composition.interop/nf-windows-ui-composition-interop-icompositorinterop-creategraphicsdevice
     */
    CreateGraphicsDevice(renderingDevice) {
        result := ComCall(5, this, "ptr", renderingDevice, "ptr*", &result := 0, "HRESULT")
        return result
    }
}
